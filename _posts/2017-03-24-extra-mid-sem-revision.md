---
layout: post
title:  "2017 ExtEa Mid Sem Revision"
date:   2017-03-24
categories: worksheets wk6 midsemrevision
---

# MORE LAST MINUTE MID SEM REVISION

1. a) Convert 7-(base 10) to two's-complement binary using an 8-bit word.
b) What is a computer algorithm?
c) What is abstraction?
d) What is polymorphism?
e) What does it mean for Haskell to be functional?
f) What does side-effect free mean?
2. a) Write a function that would count the length of an list of words. (Like the word counter on Word Document)
b) Write a function that will compute combinations. 
The formula for combinations is nCr = n!/((n-r)!r!)
Example of a combination: 5C2 = 10
3. a) Write the truth table for ``implies (->)``.
b) Write a function that will express this.
4. Write a function that will order a list of integers. 
5. Check if two lists are equal.
6. a) Write a function that takes ``[Bool]`` and checks if any are ``True``.
b) Write a function that takes ``[Bool]`` and returns ``True`` if the entire list is ``True``.
7. The following three Haskell functions are syntactically correct and compile without warnings. Read them carefully then proceed to the following question.
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
