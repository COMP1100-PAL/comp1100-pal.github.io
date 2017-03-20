---
layout: post
title:  "Designing a Program"
date:   2017-03-20 11:25:29 +1100
categories: worksheets design wk5
---

## Types of Design
In lectures we expressed two approaches for designing a program. The top down approach, assumes we have implemented smaller functions, in order to make a larger function. We then go a try to complete the smaller functions. The bottom up approach tries to solve a smaller problem and then extend this solution to solve larger and larger problems.

## Practice

# Conway's Game Of life
**Don't worry about implementing the graphics for this problem.**
Game of Life is a Cellular Automata, which follows a fairly simple set of rules as shown on wikipedia.

>> The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

>>
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overpopulation.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

We will design some datatypes to help you in making the game.

```haskell
data World = List Cell
data Cell = Block State Coord
data State = Alive | Dead
data Coord = C Integer Integer
```

We want you to write the function with the type signature below, which implements a single step in Game of Life. Adopt a top-down or bottom-up approach to complete the function.

```haskell
transitionWorld :: World -> World
```
