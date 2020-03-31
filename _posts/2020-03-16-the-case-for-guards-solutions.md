---
layout: post
title:  "The Case For Guards Solutions"
date:   2020-03-16 08:00:00 +1100
categories: worksheets
---

## Question 1

Write the following functions. Some questions use specific ```data``` types that are defined below.

```haskell
data Grade = N | PS | P | CR | D | HD
  deriving (Show, Eq)

data TrafficLight = Red | Yellow | Green
  deriving (Show, Eq)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq)
```

1) A case function that returns the driving instruction based on what the traffic light shows.
```haskell
traffic :: TrafficLight -> String
traffic light = case light of
  Red     -> "Stop"
  Yellow  -> "Slow Down"
  Green   -> "Go"
```
2) A guard function that takes your grade as a number and returns the appropriate ```Grade``` value.
```haskell
grading :: Int -> Grade
grading score
  | score > 80  = HD
  | score > 70  = D
  | score > 60  = Cr
  | score > 50  = P
  | score == 50 = PS
  | otherwise   = N
```
3) A case function that takes a day of the week and returns where the COMP1100 lecture is that day.
```haskell
lectureLocation :: Day -> "String"
lectureLocation day = case day of
  Monday    -> error "No Lecture on Monday"
  Tuesday   -> error "No Lecture on Tuesday"
  Wednesday -> "Llewellyn Hall"
  Thursday  -> "Llewellyn Hall"
  Friday    -> "Manning Clark Hall"
```
4) A guard function that checks is a positive number is even and if so returns ```"This number is even!"```.
```haskell
isEvenString :: Int -> String
isEvenString i
  | i % 2 == 0  = "This number is even!"
  | otherwise   = "This number is odd!"
```
5) A guard function that takes two numbers and determines if both, one or none are even. (Remeber that ```&&``` means 'AND' and ```||`` means 'OR' in Haskell!)
```haskell
isEvenTwo :: Int -> Int -> Int
isEvenTwo x y
  | x % 2 == 0 && y % 2 == 0  = 2
  | x % 2 == 0 || y % 2 == 0  = 1
  | otherwise                 = 0
```
6) A case function that takes a character and checks if it is vowel or not.
```haskell
isVowel :: Char -> Bool
isVowel char = case char of
  'a' -> True
  'e' -> True
  'i' -> True
  'o' -> True
  'u' -> True
  _   -> False
```

## Question 2

Let's make a Scissors-Paper-Rock game in Haskell! To begin, we define our ```data``` types:
```haskell
data Move = Paper | Rock | Scissors deriving (Eq, Show)
data Result = Win | Draw | Lose deriving (Eq, Show)
```
These should both be pretty self-explanatory. Now, consider the following function:
```haskell
beats :: Move -> Move
beats move =
    | move == Paper     = Scissors
    | move == Rock      = Paper
    | move == Scissors  = Rock
```
This function will return the move that beats the input move. We can also write this function using Cases:
```haskell
beats :: Move -> Move
beast move = case move of
    Rock      -> Paper
    Paper     -> Scissors
    Scissors  -> Rock
```
Both versions of ```beats``` will produce the same output, however it is clear that using a case statement over guards leads to more easily readable code. Whenever you need a decision-making function, always consider whether you should use a Case or a Guard: always try to choose the option that leads to the easiest, simplest and cleanest code.

With this in mind, it is now your turn to choose which method to use as we complete the Scissors-Paper-Rock game. Finish the following function: it takes two moves as input, your move and your opponents move, and tells you the result:
```haskell
score :: Move -> Move -> Result
score myMove opponentMove ...
```
Remember - think carefully whether you want to you Cases or Guards. (Hint: Use the ```beats``` function!)

The function can be written using Guards or Cases:
```haskell
score :: Move -> Move -> Result
score myMove opponentMove
  | beats opponentMove == myMove  = Win
  | beats myMove == opponentMove  = Lose
  | myMove == opponentMove        = Draw
  | otherwise                     = error "Unexpected Result Achieved"

score :: Move -> Move -> Result
score myMove opponentMove = case myMove of
  opponentMove        -> Draw
  beats opponentMove  -> Win
  _                   -> Lose
```
However, the Guard function is more appropriate. Although it is longer, it is much more clear what the function is doing: the readability is better. Additionally, we can generate an error when something strange happens.
