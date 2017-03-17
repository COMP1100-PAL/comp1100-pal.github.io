# Data Types 
__Question 1__
Label each of the following things as enumerated type, tuple, record type or list.
```Haskell
(Barcode, Item)
```
```Haskell
['n','o','g','t','e','d','g','o','t','o','y']
```
```Haskell
data Colour = Red | Green | Blue | Yellow | Black
```
```Haskell
data Ant = Ant { antPosition :: Coord
               , antOrientation :: Direction
               , antTransition :: [Transition SquareTurn]}
```

#### Enumerated data types
__Question 2__
Write ``Month`` as an enumerated data type, i.e complete the following data type:
```Haskell
data Month = ...
```
__Question 3__
Write ``Season`` as an enumerated data type.

__Question 4__
Write a function that takes a month and returns the season it is in.

#### Tuples
Tuples are a convenient way of combining two types into one type without explicitly creating a new data type. 
Consider following implimentation of ``and``:
```Haskell
and :: Bool -> Bool -> Bool
and p q = case p of
    True -> case q of
        True -> True
        _ -> False
    False -> case q of
        _ -> False
```
You saw this in PAL last week.

__Question 4__
There is a better way of writing this function without the use of nested cases.

__Question 5__
Try implimenting this using tuples while keeping the type declaration the same. i.e: use the type declaration
```Haskell
and :: Bool -> Bool -> Bool
```

#### Records
__Question 6__
Define a record type for two dimensional coordinates.

__Question 7__
Write a function to find the distance from the origin.

__Question 8__
Write a function to double the x-coordinate.

#### Lists
In your assignment, you've seen lists defined as:
```Haskell
data List a = Empty | Entry a (List a)
```
Haskell defines lists as:
```Haskell
data [a] = [] | a:[a]
```
(or at least it would if it could - but don't worry too much about this)

__Question 9__
Write a function that takes in lists as how you've defined it in your assignment and outputs a list how Haskell prelude defines it. 
i.e: Write a function ``listConvert`` with the following type signature:
```Haskell
listConvert :: List a -> [a]
```