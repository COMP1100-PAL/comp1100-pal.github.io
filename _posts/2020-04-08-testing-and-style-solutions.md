---
layout: post
title:  "Testing and Style Solutions"
date:   2020-04-21 11:00:00 +1100
categories: worksheets
---


## Question: Writing Black Box Tests

Write 3 black box tests for the following functions. Note that you only have the function name and type signature. So you don't know how the function works and operates, meaning that your tests will focus on the overall functionality rather than internal calculation.

```haskell
absoluteValue :: (Num a, Ord a) => a -> a
```
__Answer__:
```haskell
-- >> absoluteValue 10
-- 10
-- >> absoluteValue -192
-- -192
-- >> absoluteValue -1
-- 1
```
---
```haskell
isNotNegative :: (Num a, Ord a) => a -> Boolean
```
__Answer__:
```haskell
-- >> isNotNegative 10
-- True
-- >> isNotNegative -192
-- False
-- >> isNotNegative -1
-- False
```
---
```haskell
data Triangle = Equilateral | Isosceles | Scalene
-- Given three side lengths, determines whether the triangle is Equilateral, Isosceles or Scalene
typeOfTriangle :: (Num a) => a -> a -> a -> Triangle
```
__Answer__:
```haskell
-- >> typeOfTriangle 1 1 1
-- Equilateral
-- >> typeOfTriangle 2 2 3
-- Isosceles
-- >> typeOfTriangle 1 2 3
-- Scalene
```
---
```haskell
-- Sum the elements of the list that are odd
sumOdd :: [Int] -> Int
```
__Answer__:
```haskell
-- >> sumOdd [2,4,8]
-- 0
-- >> sumOdd [2,3,4,5]
-- 8
-- >> sumOdd [1,0,1]
-- 2
```
---
```haskell
data Month
    = January
    | February
    | March
    | April
    | May
    | June
    | July
    | August
    | September
    | October
    | November
    | December
  deriving (Show, Eq, Enum)
data Day = Integer
type Date = (Month, Day)
-- Ignoring leap years, return the date of the next day
nextDate :: Date -> Date
```
__Answer__:
```haskell
-- >> nextDate (Novemeber, 22)
-- (November, 23)
-- >> nextDate (February, 28)
-- (March, 1)
-- >> nextDate (August, 1)
-- (August, 2)
```
---
Note: Your answers will almost definitely differ from ours. However, you should be able to see similarities in the types of inputs tested.


## Question: White Box Tests

Now that you have written your black box tests, let's look at the code and write some white box tests. Some of the functions are broken: use white box tests to find these errors.

```haskell
absoluteValue :: (Num a) => a -> a
absoluteValue a
    | a < 0 = -a
    | a >= 0 = a
```

> __Answer__: Function is correct!

```haskell
isNotNegative :: (Num a) => a -> Boolean
isNotNegative a
    | a > 0 = True
    | otherwise = False
```

> __Answer__: Function breaks when the input is 0.

```haskell
data Triangle = Equilateral | Isosceles | Scalene
typeOfTriangle :: (Num a) => a -> a -> a -> Triangle
typeOfTriangle a b c
    | a == b && b == c = Equilateral
    | a == b || b == c = Isosceles
    | s > a && s > b && s > c = Scalene
    | otherwise = error "Not a Triangle"
      where
        s = (a+b+c)/2
```

> __Answer__: Function doesn't consider all isosceles cases, e.g. 2,3,2

```haskell
sumOdd :: [int] -> int
sumOdd l = case l of
    [] -> 0
    x:xs -> x * (x `mod` 2) + (sumOdd xs)
```

> __Answer__: Functions breaks with negative numbers as ```-i `mod` 2 = -i```

```haskell
data Month = January | February | March | April | May | June | July | August | September | October | November | December
  deriving (Show, Eq, Enum)
type Day = Int
type Date = (Month, Day)

-- Ignoring leap years, return the date of the next day
nextDate :: Date -> Date
nextDate (month, day)
    | month == February = increment (month, day) 28
    | elem month monthsWith31Days = increment (month, day) 31
    | otherwise = increment (month, day) 30
  where
    monthsWith31Days = [January, March, May, July, August, October, December]
    increment :: Date -> Int -> Date
    increment (m,d) n
        | d >= n =   (succ m , (d+1) `mod` n)
        | otherwise = (m, d+1)
```
> __Answer__: The function doesn't work when given the input ```(December, 31)```.

## Question: Code Style

Below are lots of example haskell functions. Many of them have terrible style, for a variety of reasons. For each function, fix them to make them beautifully readable!

```haskell
-- map applies a function to each element of the list
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map function (firstElement:remainingList) =
    function firstElement : map function remainingList
```
> __Answer__: Names are too long. Outputs aren't aligned.
```haskell
-- map applies a function to each element of the list
map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs
```
---
```haskell
-- bmi calc
bmi :: Double -> Double -> String
bmi x y
    | x / y^2 <= 15     = "Severely Underweight"
    | x / y^2 <= 18.5   = "Underweight"
    | x / y^2 <= 25     = "Normal"
    | x / y^2 <= 30     = "Overeight"
    | otherwise         = "Obese"
```
> __Answer__: Comment isn't informative. Repeated code that should move to a where clause. Bad names for inputs as you can't tell them apart.
```haskell
-- bmi takes in your height and weight and returns your weight category
bmi :: Double -> Double -> Double
bmi height weight
    | result <= 15      = "Severely Underweight"
    | result <= 18.5    = "Underweight"
    | result <= 25      = "Normal"
    | result <= 30      = "Overweight"
    | otherwise         = "Obese"
  where
    result = x / y^2
```
---
```haskell
answers :: [Maybe Int]
answers =[ Just 42
    , Just 7
            , Nothing
    ]
```
> __Answer__: Aligned is not comma-leading and no explanatory comment.
```haskell
-- answers is a list of student marks. Nothing designates that the students didn't sit the test.
answers :: [Maybe Int]
answers =
    [ Just 42
    , Just 7
    , Nothing
    ]
```
---
```haskell
-- meanFuncValue calculates the mean (i.e. average) of a list after applying a function to each element of the list
meanFuncValue :: [Int] -> (Int -> Float) -> Float
meanFuncValue ls f = helper ls f (length ls)
  where
    helper :: [Int] -> (Int -> Float) -> Int -> Float
    helper ls f len = case ls of
        []      -> 0
        x:xs    -> ((f x) / (fromIntegral len)) + helper xs f len
```
> __Answer__: This function should use prelude functions and better helper functions to make it far simpler. Additionally, the type signature is needlessly specific and should be generalised with polymorphism.
```haskell
-- meanFuncValue calculates the mean (i.e average) of a list after applying a function to each element of the list
meanFuncValue :: (Fractional b) => [a] -> (a -> b) -> b
meanFuncValue ls f = sum (map f ls) / fromIntegral(length(ls))
  where
    map :: (a -> b) -> [a] -> [b]
    map f ls = case ls of
        []      -> []
        x:xs    -> f x : map f xs
```
---
```haskell
-- count finds how many repetitions of a specific element there are in a list
count :: (Eq a) => [a] -> a -> Double
count n ls
    | head n == ls  = 1 + count (tail n) ls
    | otherwise     = count (tail n) ls
```
> __Answer__: Names are terrible, mixing conventions and standards. Also the function type is too general - all the outputs are ```Int``` not ```Double```.
```haskell
-- count finds how many repetitions of a specific element there are in a list
count :: (Eq a) => [a] -> a -> Int
count ls elem
    | head ls == elem   = 1 + count (tail ls) elem
    | otherwise         = count (tail ls) elem
```