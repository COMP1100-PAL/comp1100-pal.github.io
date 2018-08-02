---
layout: post
title:  "Fun Functions"
date:   2018-08-02 18:01:41 +1100
categories: worksheets 
---


How To Write a Function
===================


Hello fellow confused individuals. Today, you will grow out of being younglings and become PALawans. What is a function? How do I write one? What are the options available to me? If you can ask yourself these questions and not be able to answer them then you’re in the right place.

----------
Brief Recap
-------------

The actual syntax of writing a Haskell function may seem confusing to you but don’t worry, thats what you’re here for. Take a look at this function here, which just doubles its input.
```
doubleInt :: Int -> Int
doubleInt x = x * 2
```
This simple function encapsulates a whole lot of weird and confusing syntax so lets cover that now and get that out of the way, then we will move on to more interesting features of writing functions. Lets break it down:
```
doubleInt     -- This is the name of the function

:: Int -> Int -- This is the 'Type signature', this one says:
              -- "I am a function that takes one Int as in input,
              -- and I return one Int as output"

doubleInt x = -- This is the input, I call my input "x".
              -- I could have called it anything I liked,
              -- but just "x" is simple.

x * 2         -- This is the "body" of the function,
              -- its what your function returns
```
It’s actually a bit more nuanced than this but we’ll get to that. For now, try these out for size:

* Write a type signature for the function that adds two floats.
* Write a type signature for the function that multiplies two doubles.
* Write a type signature for the function that calculates the triangle inequality.
* Write a type signature for the function that determines if two booleans in a tuple are the same.
* Write a signature for the function that reverses a list.

Now for the functions you wrote type signatures for, give them meaningful names.

Write an input for those functions, give meaningful names to the inputs.

----------
Back on track, more basics
-------------

Ok so now we’re gonna consolidate our knowledge. Lets play a game of match the type signature to the function. Then try to give that combination a meaningful name and meaningful input names if they need it.
```
-- Signatures
Int -> Int -> Int

String -> String

Integer -> Bool

Bool -> Bool -> Bool

-- Function inputs plus body
me = "Hello " ++ me

interesting = isEven interesting

angry react = angry == react

num_1 num_2 = num_1 + num_2
```

----------
Putting it all together
-------------

Lets spend some time just writing functions and type signatures.

1. Write a function that multiplies two integers together.
2. Write a function that takes an integer and an integer and returns true if the first is greater than the second and false otherwise.
3. Write a function that calculates the area of an equilateral (all sides are the same length) triangle, given the length of its sides.
4. Write a haskell function to calculate the Pythagoras theorem.
5. Write a halve-it-down function, which takes in a Float and halves it.
6. Write a function that returns your name and age in a sentence.
7. Write a function that returns the first element of a tuple.

----------
Split Definitions
-------------

A function can actually make a choice on what to return depending what the input actually is. We call this a “split definition”. Take a look at this example to see what I mean:
```
doubleIntHalf10 :: Int -> Int    -- Type signature
doubleIntHalf10 10 = 10 `div` 2  -- Input and body
doubleIntHalf10 x = x * 2        -- Input and body again????
```
The line
```
doubleIntHalf10 10 = 10 `div` 2
```
Is a very specific case that will run when the input is 10 and only 10. As opposed to:
```
doubleIntHalf10 x = x * 2
```
Is a very general case that will run for every other input that is not one of the other definitions.

Write functions for the following:

* Write a split definition for the function that adds 2 to 0 but subtracts 2 from everything else.
* Write a split definition for the function that returns true when the input is false, and false when the input is true.
* Write a split definition for a function that returns the first element of a given list when an input is true, otherwise return the last element of that list.
* Write a split definition for the function that returns true when a number is even and false when it is odd.

----------
Guards and Pattern Matching
-------------

Haskell also provides cleaner methods for split definitions. Consider the following guard expression:
```
doubleIntHalf10 :: Int -> Int    -- Type signature
doubleIntHalf10 x
	| x == 10 = 10 `div` 2
	| otherwise = x * 2
```
This is the same function as before, but we have used guards instead of split definitions. This gives us the power to use conditional statements to choose the output!

Once you have gotten your hearts around that, consider:
```
doubleIntHalf10 :: Int -> Int    -- Type signature
doubleIntHalf10 x = case x of
	10 -> 10 'div' 2
	_ -> x * 2
```
This is also the same function! Instead of guards or split definitions, we used pattern matching! Pattern matching is perfect for changing the output for specific cases.
