# Part A: How do I Place the Ships??!!?!

This worksheet will guide you through the ideas needed to program the `placeShip` function.


# Task 1
To play battleship, we first need to generate a board! Let's generate a board by playing a game. Do this in a group on a whiteboard.
a) Draw an empty 10x10 grid on the board.
b) Someone pick two random numbers from 1 to 10. Mark these on the board.
c) Someone else pick a random type of ship:
 - Carrier (1x5)
 - BattleShip (1x4)
 - Cruiser (1x3)
 - Submarine (1x3)
 - Destroyer (1x2)

d) Someone pick a random direction (Up, Down, Left, Right)
e) Draw the ship facing the direction chosen at the random coordinates.
f) Repeat steps b) to e), picking a different coordinate and a different ship. Do so until you have placed all the ships. 

Congratulations, You just programmed `placeShips`! Now you just need to tell Haskell how to do it...

# Task 2
Read the following explanation and discuss it with your group members:

In the assignment, we will describe the boards you just drew using the record type `GenShips`:

```haskell
data GenShips = GenShips {gsShips       :: Ships,
                          existingShips :: ShipsOnGrid,
                          finished      :: Bool}
```

Recall that `Ships = Matrix Bool = [[Bool]]`. This is a 2D grid of booleans. If a ship is on a given coordinate, then that entry in `Ships` reads as `True`, otherwise, it is `False`. Recall that `ShipsOnGrid = [ShipType]` is a list of the current ships on the board. The last entry in the record type tells us if all the ships are positioned on the board.

An example of an element of type `GenShips` looks like this:

```GenShips [[False,False,True,...],...,[...,False,False]] [Cruiser, Submarine] False```

This describes a board with two ships placed onto it.
In the assignment, the program will start with the following element of `GenShips`:
```startingBoard = GenShips [[False,False,..,False],...,[False,...,False]] [] False```
That is, an empty board with no ships.
The computer will then randomly give you a coordinate, a position, a ship, and a direction. The goal of the `placeShips` function is to update `startingBoard` so that it places that ship on the board! Then the computer will give you a new coordinate, position and ship. You must update `startingBoard` again, and again, and again until the board is finished!

# Task 3
Before we write `placeShips`, we will get comfortable with the `genShips` data type. Write a function called `updateShipTypes`, which inputs a type `genShips` and a `ShipType` and _only_ adds the `shipType` to the list `ShipsOnGrid` in the record type:

```updateShipTypes :: GenShips -> ShipType -> GenShips```

# Task 4
Let's now write a primitive version of `placeShips`. Write a function that inputs a `GenShips`, a coordinate, and a `shipType`. If the coordinate is in the appropriate bounds (e.g., on the 10x10 grid), add the ship to the list of `shipsOnGrid`. Otherwise, simply return the original `genShips`.

# You are ready for placeShips!

You are now ready to write `placeShips`. Your first concern should be to figure out how to update a single coordinate on a `Ships` board. That is, write a function which inputs a coordinate and a [[Bool]], and changes the value at the coordinate in the [[Bool]] to `True`.

HINTS:
 - Use the predefined function `updateList :: [a] -> Int -> a -> [a]`, which inputs a list, an index, and a value, and updates the list at that index with the new value.
 - Feel free to use the "bangbang" (!!): 
 - ```[1,2,3,4,5] !! 2 >> 3. ```

