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