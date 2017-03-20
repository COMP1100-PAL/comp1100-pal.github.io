# COMP1130 PAL - Game of Life

The universe of Conrad’s Game of Life is an infinite, 2-D orthogonal of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight surrounding neighbours. At each step in time, the following transitions occur:

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

* Think about how you would define a type for
    1. A cell
    2. A row/column of cells on the board
    3. A board

Consider the function `transition_world`, which applies the above transition rules to _every_ cell in the board.  Using your types, design a series of functions that will help build up transition_world.  (HINT: think about starting from the bottom-up!)

## Hints

1. Define a type for a Cell
2. Define a type for a row or column of cells
3. Define a type for a world
4. Define a function that transition the world from one state to the next:
    * Write a function that takes a coordinate and outputs the neighbours of the cell given by the coordinate (you may need to add some extra types)
    * Write a function that takes a cell and returns true if it alive and false if its dead
    * Write a function that counts the number of alive cells in a list
    * Write a function that returns the columns or rows next to a Coord
    * Write a function that takes a coordinate and returns the type of cell it will be in the next state
