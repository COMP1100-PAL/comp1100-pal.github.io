---
layout: post
title:  "Comprehending Comprehensions"
date:   2018-08-23 11:25:29 +1100
categories: worksheets wk11 ass3
---
# List Recursion
Complete the following functions:
1. Filter out integers in a list that are smaller than five, with the type signature:
    ```haskell
    filter :: [Int] -> [Int]
    ```
2. Add two to each integer in a list of integers, with the type signature:
    ```haskell
    map :: [Int] -> [Int]
    ```
# List Comprehension
List comprehenstions have the form of `[element | element <- list]` and you can read it in english as: Elements where elements are drawn from this list.
1. Have a go at predicting what the output of the following statements are:
    ```haskell
    [x | x <- [1 .. 10]]
    [y | y <- [1, 3 .. 19]]
    ```
You can introduce functions to apply to a list comprehension to make it more interesting, for example you can double every element from the above activiity by doing this:
```haskell
[x * 2 | x <- [1 .. 10]]
-- What is this list comprehensions output?
```
And also remove elements the following way:
```haskell
[y | y <- [1 .. 20], y > 10]
-- What is this list comprehensions output?
```
To recap, they have the syntax: 
`[function ( element ) | element <- list, predicate ( element )]`

Your activity:
2. Write a list comprehension over [1 .. 100] that removes all even and divisible by 3 numbers
3. Write a list comprehension over [1 .. 9001] that squares the element and removes elements that are bigger than 100

# Higher Order Functions
Can you see how tedious it is to implement these? We can make them much more general by using *higher order functions*, which are simply functions that take functions as arguments!
1. Filters a list according to an input function, which returns a Bool for each element, with the following type signature:
    ```haskell
    filter :: [a] -> ( a -> Bool ) -> [a]
    ```
2. Write a function map that takes a list and a function. It applies the function to the list, returning a new list. It has the following type signature:
    ```haskell
    map :: [a] -> (a -> b) -> [b]
    ```
