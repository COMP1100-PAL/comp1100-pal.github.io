---
layout: post
title:  "This Worksheet Title is not a Pangram Revisied"
date:   2019-04-01 09:10:41 +1100
categories: worksheets wk5
---

# This Worksheet Title is Not a Pangram

## A Pangram?!?
Lists give us some powerful tools that let us deal with different representations of data. In this exercise you’ll have to think about different ways to represent whether or not we’ve reached our goal.

Let’s use lists and recursion to determine if a given string is a pangram. An anagram is a word or phrase with the same letters as another word or phrase (‘nag a ram’ is an anagram of ‘anagram’), whereas a pangram is a sentence that uses every letter of the alphabet. The most popular of these is ‘The quick brown fox jumps over the lazy fox’. See how it uses at every letter of the english alphabet at least once?

## Your task
Use lists and recursion to determine whether a string is a pangram

```
isPangram :: String -> Bool
isPangram sentence = >Solution Here<
```

## Polymorphic Challenge
Let's try generalise the idea of a pangram. Consider the following function:
```
isListgram :: [a] -> [a] -> Bool
isListgram ls dict = >Solution Here<
```
We want this function to return true, if the first list, ls, contains every element found in the second list, dict. This is basically an arbitrary pangram for your own alphabet. Can you write a solution for this function?
