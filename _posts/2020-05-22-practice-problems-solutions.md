---
title: "Practice Problems (feat. Lambda Expressions) Solutions"
date: "2020-05-22 10:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---


## Practice Makes Perfect

As we near the end of semester, you will be approaching mastery in Haskell. Just to think that only 2 months ago, you were being introduced to the command line and ```.hs``` files, and now you are building AI to compete on leaderboards!

However, like all skills, practice will always help. So, as you prefect your AIs and ready for the exam period, we have composed a small set of problems that will test you on all areas of Haskell. Give them a try and see how you go!


## Problem 1: Panagrams

Let’s use lists and recursion to determine if a given string is a panagram. An anagram is a word or phrase with the same letters as another word or phrase (‘nag a ram’ is an anagram of ‘anagram’): a panagram is a sentence that uses every letter of the alphabet. The most popular of these is ‘The quick brown fox jumps over the lazy fox’. See how it uses at every letter of the english alphabet at least once?

Your task: Use lists and recursion to determine whether a string is a panagram.

> __Answer__:

```haskell
isPanagram :: String -> Bool
isPanagram sentence = and (zipWith (||) (helper sentence ['a' .. 'z']) (helper sentence ['A' .. 'Z']))
    where
        -- Helper produces a list of booleans, checking if each element of ls2 is in ls1
        helper :: Eq a => [a] -> [a] -> [Bool]
        helper ls1 ls2 = map ((flip elem) ls1) ls2
```


## Problem 2:

Write code to find the largest prime factor of a number.

> __Answer__:

```haskell
primeFactors :: Int -> [Int]
primeFactors n = primeFactors' n 2
  where
    primeFactors' 1 _ = []
    primeFactors' n f
      | n `mod` f == 0 = f : primeFactors' (n `div` f) f
      | otherwise      = primeFactors' n (f + 1)

largestPrimeFactor :: Int -> Int
largestPrimeFactor n = last (primeFactors n)
```

## Problem 3: Lambda Expressions

Now that you've seen how useful lambda expressions are, try writing the following functions using lambda expressions combined with higher order functions.

1. For every element in a list of doubles, replace the element with ```x^2 + x```. For example, ```squareAndAdd [1, 1.5, 2]``` should return ```[2, 3.75, 6]```.

> __Answer__:

```haskell
squareAndAdd :: [Int] -> [Int]
squareAndAdd list = map (\x -> x^2 + x) list
```

2. Extract from a list of integers the even numbers that are greater than 10. For example, ```filterEven10 [1, 4, 11, 14, 10, 18]``` should return ```[14, 18]```

> __Answer__:

```haskell
filterEven10 :: [Int] -> [Int]
filterEven10 list = filter (\x -> even x && x > 10) list
```