---
layout: post
title:  "guarding your cases"
date:   2019-03-18 11:01:41 +1100
categories: worksheets wk3
---

# Guarding Your Cases 

## Guard Example
Here is an example of a function that uses guards:
```haskell
traffic :: String -> String
traffic light
    | light == "green" = "go!"
    | light == "red" = "stop!"
    | otherwise = "slow down."
```

## The Problem

Today, we'll be creating your own miniature program that allows you to play Rock-Paper-Scissors! To start off, here are the type you'll need:
```haskell
data Move = Paper | Rock | Scissors deriving (Eq, Show)
data Result = Win | Draw | Lose deriving (Eq, Show)
```
(The first part of the problem is writing a function which takes a move as input and finds the move which beats it). We have written most of the function but some parts are missing:

```haskell
beats :: Move -> Move
beats move
    | move == Paper = _
    | __ == ___ = _
    | otherwise     = _
```

Now write a function which returns the result to a set of moves. Here is a framework:

```
score :: Move -> Move -> Result
score playerA playerB ...
```

## The Case with Guards
Congratulations, you can now play playgroud rock-paper-scissors with your friends. However a challenger approaches, and they only trust cases. Try rewrite both ```beats``` and ```score``` with cases!

## Challenge
The following table gives scores for people sitting next to each other. Given a list of the three people (as strings) calculate the score of the sitting arrangement:

|        | Jay | Edmund | Ranald |
| ------ |:---:|:------:|:------:|
| Jay    | /   | 2      | 4      |
| Edmund | 2   | /      | -1     |
| Ranald | 4   | -1     | /      |

Use cases and guards!
