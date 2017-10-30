---
layout: post
title:  "SuperPAL: Data Types & Anonymous Functions"
date:   2017-10-30 11:25:29 +1100
categories: superPAL week 12 exam final
---

# Data Types & Anonymous Functions

### Question 1
What is an abstract data type? Give two examples.
### Question 2
Here is a data type for an ant:
```Haskell
data Ant = Ant { antPosition :: Coord
               , antOrientation :: Direction
               , antTransition :: [Transition SquareTurn]}
```
Rewrite the data type `Ant` using the alternative syntax for record types.

### Question 3
Write a recursive data type for a list. Is this data type primitive recursive?

### Question 4
Write a recursive data type for a trinary tree. That is, each node in the tree has three branches.

## Question 5
Consider the following data type for temperature:
```Haskell
data Temperature a = Temperature {value :: a, unit :: Temperature_Unit}
```
a) Check if a given temperature is in units of Farenheit.
b) Write a function to convert a given temperature into Kelvin.
(Hint: K = C + 273, F=9/5 C + 32)

## Question 6
Using anonymous functions, write the following functions:
a) Add 1 to every element of a list of integers.
b) Filter our all odd elements of a list.
c) Swap the order of the arguments of a function with two inputs.

## Challenge Question
# Data Types
Recall the data type for a set:
```Set a = Empty | Element a (Set a)```
a) Write a function which calculates the intersection of two sets.
b) Write a function which finds the compliment of two sets.

# Anonymous Functions
Suppose you have a list of functions of type `a -> a`. Using an anonymous function, can you figure out a way to generate a new function of type `a->a` which applies all the functions in the list together?

For example:
`funcFold [f,g,h,i,j,k] >> f ( g ( h ( i ( j ( k( a )))))`.
