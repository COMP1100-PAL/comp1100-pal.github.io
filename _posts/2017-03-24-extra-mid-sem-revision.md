---
layout: post
title:  "2017 ExtEa Mid Sem Revision"
date:   2017-03-24
categories: worksheets wk6 midsemrevision
---

# MORE LAST MINUTE MID SEM REVISION

## Question A
1. Convert 7-(base 10) to two's-complement binary using an 8-bit word.
2. What is a computer algorithm?
3. What is abstraction?
4. What is polymorphism?
5. What does it mean for Haskell to be functional?
6. What does side-effect free mean?

## Question B
1. Write a function that would count the length of an list of words. (Like the word counter on Word Document)
2. Write a function that will compute combinations. The formula for combinations is nCr = n!/((n-r)!r!). Example of a combination: 5C2 = 10

## Question C
1. Write the truth table for ``implies (->)``.
2. Write a function that will express this.

## Question D
Write a function that will order a list of integers. 

## Question E
Check if two lists are equal.

``

## Question F
1. Write a function that takes ``[Bool]`` and checks if any are ``True``.
2. Write a function that takes ``[Bool]`` and returns ``True`` if the entire list is ``True``.

## Question G
The following three Haskell functions are syntactically correct and compile without warnings. Read them carefully then proceed to the following question.

```haskell
term_1 :: Integer -> Integer
term_1 i
    | i == 42 = i
    | otherwise = 1 + term_1 (i+2)

term_2 :: Integer -> Integer -> Integer
term_2 i j
    | i < j = i
    | otherwise = (i - j) + term_2 (i - 1) (j + 1)

term_3 :: Integer -> Integer 
term_3 i 
    | i == 0 = 1
    | otherwise = i * term_3 (i - 1)
```
Analyse each function and determine whether it will never/sometimes/always terminate. If you find that a function terminates only sometimes name the input values for which the function will terminate. Warning: note that the integer type can hold positive as well as negative values.
