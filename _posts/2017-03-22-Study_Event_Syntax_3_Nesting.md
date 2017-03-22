---
layout: post
title:  "Syntax : Nesting"
date:   2017-03-20 11:25:29 +1100
categories: worksheets studyevent
---

# Nesting
###### Nest cases in cases
Truth tables are a convenient way of describing an operation between Boolean values. For example, consider the truth table for the ``xor`` operator:

| P | Q | P xor Q |
|-------|-------|-------|
| T | T | F |
| T | F | T |
| F | T | T |
| F | F | F |

__Write the ``xor`` function__
``xor :: Bool -> Bool -> Bool``
This function takes in two boolean values and return the corresponding boolean output for the ``xor`` operator, as shown in the table above. You should use nested case statements.

###### Nest guards within cases
We have a function defined as follows
```Haskell
maybeSqrt :: Maybe Float -> Maybe Float
maybeSqrt mx = case mx of
    Just x | x >= 0 -> Just (sqrt x)
           | otherwise -> Nothing
    Nothing -> Nothing
```
Imagine we run ``maybeSqrt (Just 4)``
__What are the values of ``mx``, ``x``, ``x >= 0``, ``sqrt x`` and the function ``maybeSqrt (Just 4)`` itself?__

Let’s write a function to divide two floats. Consider the following implementation using guards.
```Haskell
divide :: Float -> Float -> Float
divide x y
    | y == 0 = error "the world will explode!"
    | otherwise = x/y
```
__Lets write this function again using cases, guards and the following type declaration:__
```Haskell
divide :: Maybe Float -> Maybe Float -> Maybe Float
```

# Functions as input
You can have functions as an argument to a case statement. For example:
```Haskell
odd :: Integer -> Bool
odd n = case even n of
    True -> False
    False -> True
```

In your assignment, you will need to write the ``tryMove`` function (week 4 lab). This is rather tricky to do in one go. So lets try to write a helper function which you can use in ``tryMove`` to make your life easier.

__Write a function ``isOpenGround`` which tells us if something is ``Ground`` or ``Storage``.__
Hint: Use the following type signature
```Haskell
isOpenGround :: List Coord -> Coord -> Bool
```
