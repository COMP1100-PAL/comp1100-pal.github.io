---
title: "Heuristics Solutions"
date: "2020-05-21 10:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---

All solutions can be found in the ```.hs``` file [here](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/src_hs/Heuristics_Solutions.hs).

## Writing Your Own Heuristics

Now it is your turn to write a heuristic for tic-tac-toe. Think of a good strategy for tic-tac-toe and then write a haskell heuristic for it!

There are many possible answers to this question, so don't be afraid to implement interesting or weird ideas. Also, remember to test them using ```evaluatingHeuristic```.

> __Answer__: We implemented a heuristic that returns the number of ways that you win by making the move:

```haskell
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
```

As said, there are many possible answers, so don't worry if yours is different. Just check that it works!

## Question: Combining Heuristics

Using the heuristic you made above and ```availableHeuristic```, write an overall heuristic that combines them together, weighting them appropriately.

```haskell
combineHeuristic :: Board -> Move -> Double
combineHeuristic (Board board) move@(Move pl x y) = >Solution Here<
```

> __Answer__: This is our ```combineHeuristic``` function. Note the weighting we used!

```haskell
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
```