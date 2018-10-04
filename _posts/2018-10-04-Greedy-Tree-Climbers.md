---
layout: post
title:  "Greedy Tree Climbers"
date:   2018-10-04 18:01:41 +1100
categories: worksheets wk3 decomposition
---
# Greedy Tree Climbers
You've been discussing minimax and trees a lot in lectures, but how would you actually implement a game bot?
Today, you'll write your very own greedy bot (a less clever version of minimax) for Tic Tac Toe.
A greedy bot simply looks at all the possible moves it can make, then picks the one that results in the "highest value" board.
How you calculate the "value" of a board is a tricky problem, but we'll focus on that in later weeks. For now, we'll let you assume you have a function `evaluteBoard` to find the "value" of a board. 
__In fact, assume you have all the following data types and functions already defined for you:__
```Haskell
data Board = [Move]
data Move = (Player, (Int, Int)) -- X, Y coordinates
data Player = X | O
    deriving (Show, Eq)
    
-- Returns a number on how good a board is, bigger is better
evaluateBoard :: Board -> Int
-- Assuming the move is valid, make the move and returns the new board
makeNextMove :: Board -> Move -> Board
-- Returns true if a move is able to be made in this board
isValidMove :: Board -> Move -> Boolean
```

__Your task is to finish this function, which picks the best next move:__
```Haskell
greedyMove :: Board -> Player -> Move
```

__But first, try write the body of these helper functions:__
```haskell
allMoves :: Player -> [Move]
allMoves player =

validMoves :: Board -> [Move] -> [Move]
validMoves board moves =

scoreMove :: Board -> [Move] -> [(Int, Move)]
scoreMove board possibleMoves = 

maximum' :: [(Int, Move)] -> Move
maximum' scoredMoves =
```
