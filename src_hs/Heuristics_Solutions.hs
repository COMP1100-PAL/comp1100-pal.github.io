module Heuristics_Solutions where

----------------------------------------------
-- Setup Data Types
----------------------------------------------

-- Player on the board: either X, O.
data Player = X | O deriving (Show, Eq)

-- Space on the board: either Just X, Just O or Nothing.
type Space = Maybe Player

-- Board: A list of list of Spaces (3 x 3)
newtype Board = Board [[Space]]
instance Show Board where
  show (Board board) = "   |   |   " ++ "\n" ++ " " ++ showSpace (col0 !! 0) ++ " | " ++ showSpace (col0 !! 1) ++ " | " ++ showSpace (col0 !! 2) ++ " " ++ "\n" ++ "   |   |   " ++ "\n" ++ "--- --- ---" ++ "\n" ++ "   |   |   " ++ "\n" ++ " " ++ showSpace (col1 !! 0) ++ " | " ++ showSpace (col1 !! 1) ++ " | " ++ showSpace (col1 !! 2) ++ " " ++ "\n" ++ "   |   |   " ++ "\n" ++ "--- --- ---" ++ "\n" ++ "   |   |   " ++ "\n" ++ " " ++ showSpace (col2 !! 0) ++ " | " ++ showSpace (col2 !! 1) ++ " | " ++ showSpace (col2 !! 2) ++ " " ++ "\n" ++ "   |   |   "
    where
      col0 = board !! 0
      col1 = board !! 1
      col2 = board !! 2

      showSpace :: Space -> String
      showSpace space = case space of
        Nothing -> " "
        Just x  -> show x

-- gets the list associated with the board
getList :: Board -> [[Space]]
getList (Board board) = board

-- Move: Player and location of the move in (x,y) coordinates 
data Move = Move Player Int Int deriving (Show, Eq)


----------------------------------------------
-- Base Functions
----------------------------------------------

-- Valid Moves
validMoves :: Board -> Player -> [Move]
validMoves board pl = map (coordToMove pl) (getNull board)

-- get cells which are Null
getNull :: Board -> [(Int, Int)]
getNull (Board board) = [(x,y) | x <- [0..2], y <- [0..2], (board !! y) !! x == Nothing]

-- Turns coord into Moves
coordToMove :: Player -> (Int, Int) -> Move
coordToMove pl (x,y) = Move pl x y


----------------------------------------------
-- Operation Functions
----------------------------------------------

-- Make a Move
makeMove :: Board -> Move -> Board
makeMove board move@(Move pl x y)
  | elem move (validMoves board pl)  = helper board move
  | otherwise                        = error "Invalid Move"
  where
    helper :: Board -> Move -> Board
    helper (Board board) move@(Move pl x y) = Board (take y board ++ [((take x (board !! y)) ++ [Just pl] ++ (drop (x+1) (board !! y)))] ++ drop (y+1) board)

-- function for evaluating heuristics: will take a heuristic and return a tuple of the best move and a list of tuples of all valid moves and their scores
evaluatingHeuristic :: (Board -> Move -> Double) -> Board -> Player -> (Move, [(Move, Double)])
evaluatingHeuristic heurFunc board pl = (helper zippedMoves (head zippedMoves), zippedMoves)
  where
    zippedMoves = (zip (validMoves board pl) (map (heurFunc board) (validMoves board pl)))
    -- helper: goes through the zipped moves and find the one with the highest value
    helper :: Eq a => [(a, Double)] -> (a,Double) -> a
    helper ls (best_o, best_v) = case ls of
      []              -> best_o
      ((o,v)):xs
        | v >= best_v -> helper xs (o,v)
        | otherwise   -> helper xs (best_o, best_v)

----------------------------------------------
-- Heuristics
----------------------------------------------

-- bad heuristic
badHeuristic :: Board -> Move -> Double
badHeuristic _ _ = 1


-- Available Wins Heuristic: Checks how many wins are possible from a move
availableHeuristic :: Board -> Move -> Double
availableHeuristic board move@(Move pl x y) = fromIntegral (length (filter (checkPossibleWin resultingBoard pl) possibleWins))
  where
    -- Board that results from the move
    resultingBoard = makeMove board move

    -- opposite player
    oppositePlayer :: Player
    oppositePlayer = case pl of
      X -> O
      O -> X

    -- Possible winning methods
    possibleWins = [[(0,0),(0,1),(0,2)],[(1,0),(1,1),(1,2)],[(2,0),(2,1),(2,2)],[(0,0),(1,0),(2,0)],[(0,1),(1,1),(2,1)],[(0,2),(1,2),(2,2)],[(0,0),(1,1),(2,2)],[(0,2),(1,1),(2,0)]]

    -- Checks if a winning method is available, i.e opponent isn't in one of the positions
    checkFree :: Board -> Player -> [(Int,Int)] -> Bool
    checkFree (Board board) pl ls = case ls of
      []          -> True
      ((x,y)):xs  -> (((board !! y) !! x) /= Just oppositePlayer) && checkFree (Board board) pl xs

    -- Checks if the player is moving towards a winning method
    checkContains :: Board ->  Player -> [(Int, Int)] -> Bool
    checkContains (Board board) pl ls = case ls of
      []          -> False
      ((x,y)):xs  -> (((board !! y) !! x) == Just pl) || checkContains (Board board) pl xs

    -- Checks if a winning method is possible and already has a player token in it
    checkPossibleWin :: Board -> Player -> [(Int, Int)] -> Bool
    checkPossibleWin board pl ls = (checkFree board pl ls) && (checkContains board pl ls)

-- willWin Heuristic: Will check if the player will win from the following move. Scores how many ways it will win.
willWinHeuristic :: Board -> Move -> Double
willWinHeuristic board move@(Move pl x y) = fromIntegral (length (filter (checkWin resultingBoard pl) possibleWins))
  where
    -- Board that results from the move
    resultingBoard = makeMove board move

    -- Possible winning methods
    possibleWins = [[(0,0),(0,1),(0,2)],[(1,0),(1,1),(1,2)],[(2,0),(2,1),(2,2)],[(0,0),(1,0),(2,0)],[(0,1),(1,1),(2,1)],[(0,2),(1,2),(2,2)],[(0,0),(1,1),(2,2)],[(0,2),(1,1),(2,0)]]

    -- Checks a win condition for completion
    checkWin :: Board -> Player -> [(Int,Int)] -> Bool
    checkWin (Board board) pl ls = case ls of
      []          -> True
      ((x,y)):xs  -> (((board !! y) !! x) == Just pl) && checkWin (Board board) pl xs

-- combine Heuristic: Will use the two heuristics above to make an overall heuristic. The willWin Heuristic should take precedence, so we check if there is a win option first. If so, we return the willWin Heuristic. If not, then we return the available Heuristic.
combineHeuristic :: Board -> Move -> Double
combineHeuristic board move@(Move pl x y) = case checkAllZero willWinList of
  True  -> availableHeuristic board move
  False -> willWinHeuristic board move
  where
    -- The result of evaluating the willWinHeuristic - only the second tuple element, i.e the list.
    willWinList :: [(Move,Double)]
    willWinList = snd (evaluatingHeuristic willWinHeuristic board pl)

    -- Will check if a list is all zeros
    checkAllZero :: [(a,Double)] -> Bool
    checkAllZero ls = case ls of
      []          -> True
      ((o,v)):xs  -> (v == 0) && (checkAllZero xs) 


----------------------------------------------
-- Testing Boards
----------------------------------------------

-- Initial Board
initialBoard :: Board
initialBoard = Board (replicate 3 (replicate 3 Nothing))

-- Middle Move
middleMoveBoard :: Board
middleMoveBoard = makeMove initialBoard (Move X 1 1)

-- Corner Move
cornerMoveBoard :: Board
cornerMoveBoard = makeMove initialBoard (Move X 0 0)

-- Edge Move
edgeMoveBoard :: Board
edgeMoveBoard = makeMove initialBoard (Move X 0 1)

-- One Move Each
oneMoveEachBoard :: Board
oneMoveEachBoard = makeMove middleMoveBoard (Move O 0 0)

-- X Near Win
xNearWinBoard :: Board
xNearWinBoard = makeMove oneMoveEachBoard (Move X 2 0)

-- Y Near Win
yNearWinBoard :: Board
yNearWinBoard = makeMove xNearWinBoard (Move O 0 2)