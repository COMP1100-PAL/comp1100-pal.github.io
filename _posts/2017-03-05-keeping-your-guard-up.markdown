---
layout: post
title:  "Keeping your Guard up"
date:   2017-03-05 11:25:29 +1100
categories: worksheets guards wk3
---
## Guard Example

```haskell
traffic :: String -> String
traffic light
  | light == "green" = "go!"
  | light == " red" = "stop!"
  | otherwise = "slow down."
```

## The Problem
Today we'll be creating our own miniature program that allows you to play Rock-Paper-Scissors!
To start you off, here are the types you'll need:

```haskell
data Move = Paper | Rock | Scissors deriving (Eq, Show)
data Result = Win | Draw | Lose deriving (Eq, Show)
```

Note that the "deriving" term allows us to check for equality of these types and display them as strings.

### Beats
Firstly, we want you to write a function which takes a move as input and finds the move which beats it.

### Score
We next want you to write a function which returns the result to a set of moves.
