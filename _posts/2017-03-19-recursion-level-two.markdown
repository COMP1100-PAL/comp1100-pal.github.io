---
layout: post
title:  "Recursion Level Two"
date:   2017-03-19 11:25:29 +1100
categories: worksheets recursion wk5
---

# What is recursion?
Recursion (within Haskell) is when you use a function, within its own definition.

In lectures we saw the use of the factorial function; a recursive function on numbers.

```Haskell
fac :: Integer -> Integer
fac n
| n==0 = 1
| n>0 = fac (n-1) * n
```

We also saw a `trace` for the function (how the function got evaluated) for an example. A `trace` is one of the best techniques for deconstructing what a recursive function does.

There were two types of recursions, covered in the lecture; Primitive and General recursion.

`Define each type of recursion and create function as an example for each.`

# Youngling

1. Write a function which adds up all the numbers before it. e.g. `adder 5 = 4 + 3 + 2 + 1 + 0 = 10`
- Write a function which multiplies two numbers, **without using the multiplies * function**. e.g. `multiply (4,5) = 20`
- Write a function which finds the number of digits in a positive Integer `digits 100 = 3`
- Write a recursive function to find if a number if even or odd

# Padawan
1. Write a function which finds the length of a list
- Write a function which sums a list of integers
- Write a function which sums the digits in an integer e.g. `digits 234 = 9`

# Jedi
1. Write a function which decides if a number is prime (divisible by only 1 and itself)

# Jedi Knight
1. Write a function which will reverse a list
- Write a function which decides if a string is a palindrome

# Master
1. Write a function which finds all combinations of two lists e.g. `comb [1,2] [3,4] = [(1,3),(1,4),(2,3),(2,4)]`
- Write a function which decides if one string is an anagram of another
- Write a function which finds all permutations of a list e.g. `perm [1,2,3] = [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]`
