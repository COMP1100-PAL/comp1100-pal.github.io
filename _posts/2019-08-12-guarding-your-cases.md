---
layout: post
title:  "Guarding your cases 2019"
date:   2019-08-12 09:10:41 +1100
categories: worksheets
---


# Guarding Your Cases

## Changing the Guards
Below is a function that uses guards. However, guards are so confusing that we aren't quite sure how to write it. So, we have presented 4 different possible solutions. 

Which is correct? What are the issues with the other examples? What errors and/or warnings would Haskell return for those that are wrong?

- Example 1:
    ```haskell
    traffic :: String -> String
    traffic light
        | light == "green" = "go!"
        | otherwise = "slow down."
        | light == "red" = "stop!"
    ```
- Example 2:
    ```haskell
    traffic :: [Char] -> [Char]
    traffic light
        | light = "green" == "go!"
        | light = "red" == "stop!"
        | otherwise == "slow down."
    ```
    
- Example 3:
    ```haskell
    traffic :: String -> String
    traffic light
        | light == "green" = "go!"
        | light == "red" = "stop!"
        | otherwise = "slow down."
    ```

- Example 4:
    ```haskell
    traffic :: String -> String
    traffic light
        | light = "green" = "go!"
        | light = "red" = "stop!"
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

## Case Example
We now move onto cases! They are quite similar to guards but have a few key differences. Instead of checking boolean expressions, cases use pattern matching: they see if the case matches the same expression as the pattern.

We have tried to rewrite the ```traffic``` function using cases. But again, we aren't entirely sure how to do it properly. Can you identify the correct function and what errors/warnings will appear for the other?

- Example 1:
    ```haskell
    traffic :: String -> String
    traffic light = case light of
        "green" = "go!"
        _       = "slow down."
        "red"   = "stop!"
    ```
- Example 2:
    ```haskell
    traffic :: String -> String
    traffic light = case light of
        "green" -> "go!"
        "red"   -> "stop!"
        _       -> "slow down."
    ```
- Example 3:
    ```haskell
    traffic :: String -> String
    traffic light = case light of
        "green" = "go!"
        "red"   = "stop!"
        _       = "slow down."
    ```

## The Case with Guards
Congratulations, you can now play playgroud rock-paper-scissors with your friends. However a challenger approaches, and they only trust cases. Try rewrite both ```beats``` and ```score``` with cases!
