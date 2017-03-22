# Data Types
Data types are a collection of "things". 
For example, the data type ``Integer`` contains, as you'd expect, the integers that you've learned from maths: $$\{..., -2, -1, 0, 1, 2,...\}$$

You can define your own data types. 
For example:
```Haskell
data Size = Big | Small
```
Note that the names of data types always begin with a capital letter.

These are the data types you encounter in your assignment: enumerated, product, recursive.

__The following types have been copied from your assignment, identify what kind of types they are (i.e enumerated, product or recursive):__
```Haskell
data List a = Empty | Entry a (List a)
```
```Haskell
data Coord = C Integer Integer
```
```Haskell
data Direction = R | U | L | D
```
```Haskell
data Tile = Wall | Ground | Storage | Box | Blank
```
```Haskell
data SSState world = StartScreen | Running world
```

__And now for an exercise copied and pasted from your week 4 lab (part of your assignment!)__
Define a data type ``State`` that captures the state of the game. It should have just one data constructor ``St`` that constructs a product of the following types:
- The current coordinate position of the player, who moves throughout the maze: ``Coord``.
- The direction the player is facing (i.e., right, up, left or down): ``Direction``.
- The current coordinate positions of all boxes, as a list: ``(List Coord)``. 

__Is this an enumerated type, product type or recursive type?__