---
title: "Heuristics"
date: "2020-05-21 9:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---


## What is a Heuristic?

Heuristics are functions take a game state as an input and give a numerical output. The output should tell you how good or bad that game state is for each player: it is a way of evaluating and assigning a value to potential game states that you have generated.

So a heuristic would have the type:

```haskell
heuristic :: GameState -> Player -> Double
```

It is basically just a score of the current game state!

Let's look at an example: chess. A simple heuristic would count the number of pieces that each player has and return the difference. This probably won't be a very effective AI. Why? Because it doesn't capture all the information about the state of the game. So, for pretty much all games, you will need more than one kind of evaluation to accurately determine which player is winning. This will allow you to get the entire game state information, evaluate it and let your AI make the most effective decisions. So, for our 'number of pieces' heuristic, it is a good start but will need to be combined with other board metrics, such as positions of pieces, to get a better idea of the current state. By using what is called a weighted sum, it is possible to combine multiple different evaluation heuristics into one output number, the weights for which are up to you to choose. The weights of each sub-heuristic represents how important it is relative to the other heuristics in determining which player is winning.


## Tic Tac Toe

Now that we know what a heuristic is, let's look at some coded examples. We will use __Tic-Tac-Toe__ for our examples, as it is simple and easy to think about. Hopefully you have played tic-tac-toe many times, but here is a fun [website](https://playtictactoe.org/) where you can play it if you need some practice.

So that we can develop heuristics for it later, here is a simple backend that can run a tic-tac-toe game. Read through it to understand how the game works (you can find a ```.hs``` version [here](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/src_hs/Heuristics.hs)):

```haskell
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
```

This backend provides a lot of testing facilities. In addition to all the sample board, the last function, ```evaluatingHeuristic``` allows us to check what our heuristics are doing. For example, we can run

```haskell
evaluatingHeuristic badHeuristic initialBoard X =
  (Move X 2 2,[(Move X 0 0,1.0),(Move X 0 1,1.0),(Move X 0 2,1.0),(Move X 1 0,1.0),(Move X 1 1,1.0),(Move X 1 2,1.0),(Move X 2 0,1.0),(Move X 2 1,1.0),(Move X 2 2,1.0)])
```

So it can be used to test and validate heuristics.

We have one heuristic already: ```badHeuristic```. As the name suggests, it is not a good heuristic at all. It returns ```1```, regardless of the board and the move. This defeats the purpose of a heuristic in evaluating and then comparing scores. So let's see if we can develop some better ones.

So what would be a good heuristic for tic-tac-toe? Often when thinking of and designing heuristics, it is good to consider the three stages of the game:

- Beginning: Opening moves.
- Middle: Moves to better your position.
- End: Moves to win (or lose).

To begin, we will consider the opening move. In tic-tac-toe, the first move should provide the best possibilities for winning later. So a decent heuristic would be to count the number of wins that the move makes possible. For example, the board:

```haskell
   |   |   
   |   |   
   |   |   
--- --- ---
   |   |   
   | X |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |
```

would return ```4``` with this heuristic, while this second move, ```Move X 1 0```:

```haskell
   |   |   
 O | X |   
   |   |   
--- --- ---
   |   |   
   | X |   
   |   |   
--- --- ---
   |   |   
   |   |   
   |   |
```

would score ```3```. This seems like a pretty good heuristic. So let's code it:

```haskell
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
```

This may seem complicated at first, but if we break it down, then you will see that it isn't too bad. The main parts are ```checkFree```, ```checkContains``` and ```checkPossibleWin```. Both ```checkFree``` and ```checkContains``` work in roughly the same way: they iterate through one of the possible winning scenarios and check, for ```checkFree```, if they are all not taken by the opponent, i.e they are still free, or, for ```checkContains```m that at least one contains our token. Then ```checkPossibleWin``` uses those two functions to ensure that both return ```True```, i.e the win is not stopped by the opponent and one of our tokens is in that win. Finally, we just filter the list ```possibleWins``` using ```checkPossibleWin``` and then find its length. So overall, the function does what we want: finds how many ways we can win by doing a move.

To double check, we can run it on our two examples above:

```haskell
availableHeuristic initialBoard (Move X 1 1) = 4.0

availableHeuristic oneMoveEachBoard (Move X 0 1) = 3.0
```

So we have successfully implemented a good tic-tac-toe heuristic!


## Writing Your Own Heuristics

Now it is your turn to write a heuristic for tic-tac-toe. Think of a good strategy for tic-tac-toe and then write a haskell heuristic for it!

There are many possible answers to this question, so don't be afraid to implement interesting or weird ideas. Also, remember to test them using ```evaluatingHeuristic```.


## Combining Heuristics

Often you will find many different heuristics that are all beneficial for the same game. For example in tic-tac-toe, you might have one heuristic that says "take squares with the most ways to win" and another heuristic that says "block the opponent's winning moves". Obviously you don't want to be restricted to only using one of the heuristics, as neither on it's own will be particularly effective.

So how do you combine them? In this case, as you don't want to let the opponent win, you might say block the opponent's winning moves if one exists and otherwise take a square with the most ways to win, effectively weighting the "block opponent's winning moves" greater than the "take squares with the most ways to win". In some cases however, the heuristics might not be as easy to weight, for example if your heuristics were "take squares with the most ways to win" and "take squares near my other pieces", you might want to take a sum of the two heuristic values to create a new heuristic.

You could also take a weighted average of the two and experiment with different weightings to see what creates the best AI.


### Question: Combining Heuristics

Using the heuristic you made above and ```availableHeuristic```, write an overall heuristic that combines them together, weighting them appropriately.

```haskell
combineHeuristic :: Board -> Move -> Double
combineHeuristic (Board board) move@(Move pl x y) = >Solution Here<
```