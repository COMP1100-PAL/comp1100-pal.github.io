---
title: "Practice Problems (feat. Lambda Expressions)"
date: "2020-05-22 9:00:00 +1100"
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

```haskell
isPanagram :: String -> Bool
isPanagram sentence = >Solution Here<
```


## Problem 2: Prime Factors

Write code to find the largest prime factor of a number.

```haskell
largestPrimeFactor :: Int -> Int
largestPrimeFactor n = >Solution Here<
```


## Lambda Expressions

Many of you studying COMP1130 will have been introduced to the functional programming language known as the __*Lambda Calculus*__. Programming in the lambda calculus is incredibly tedious, however sometimes it can be a useful way of concisely expressing a function. This is why haskell has a feature called __*Anonymous Functions*__ or __*Lambda Expressions*__. They are called anonymous functions as you don't have to give them a name, and they closely follow the syntax of a lambda expression. An anonymous function might look like this:

```haskell
\x -> x + 1
```

This is a function that says

> Replace the input ```x``` with ```x + 1```, or, more simply, increase the input by 1

So

```haskell
(\x -> x + 1) 7
```

Would return ```7 + 1 = 8```. The ```\``` is haskell's way of expressing a lambda (λ) and is chosen as it looks somewhat similar.

We can also have more inputs to a lambda expression, for example if we wanted to add two numbers we might use

```haskell
(\x y -> x + y)
```

So

```haskell
(\x y -> x + y) 3 5
```

Would return ```8```.

You will never require the use of a lambda expression in one of your programs, as you could always write a named function that did the same thing. So when are these lambda expressions useful? They can make code much shorter, and hence more readable and easy to understand. For example, say we want to add one to every element of a list. Recursively we might right the function

```haskell
addOneToList :: [Int] -> [Int]
addOneToList list = case list of
    [] -> []
    x : xs -> (x + 1) : (addOneToList xs)
```

However using a lambda expression, we can just use the higher order function ```map``` as follows

```haskell
addOneToList :: [Int] -> [Int]
addOneToList list = map (\x -> x + 1) list
```

## Problem 3: Lambda Expressions

Now that you've seen how useful lambda expressions are, try writing the following functions using lambda expressions combined with higher order functions.

1. For every element in a list of doubles, replace the element with ```x^2 + x```. For example, ```squareAndAdd [1, 1.5, 2]``` should return ```[2, 3.75, 6]```.

2. Extract from a list of integers the even numbers that are greater than 10. For example, ```filterEven10 [1, 4, 11, 14, 10, 18]``` should return ```[14, 18]```