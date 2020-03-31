---
layout: post
title:  "Recursion"
date:   2020-03-16 08:00:00 +1100
categories: worksheets
---

![alt text](https://i.imgur.com/xNNPN0d.jpg)

## Question 1: Identifying Recursion

Consider the following functions/types and answer these questions:

1) Does the function/type use recursion? If it does, what is the base case and what is the recursive case?

2) What does the function/type do?

```haskell
function1 :: [Int] -> Int
function2 ls
    | ls == []  = 0
    | otherwise = 1 + function1 (tail ls)
```
1. This is a recursive function. The base case is when the input list is empty ```ls == []```, and the recursive case is for any list with at least one element ```otherwise```, which shortens the list by one and adds a value of one to the output.
2. This function takes a list of integers and outputs the number of elements in the list: it calculates the length of the list!

```haskell
function2 :: [Int] -> Int
function2 [] = 0
function2 list = 1
```
1. This function does not use recursion, so there is no base case or step case.
2. The function returns zero if the list is empty and one of any other list.

```haskell
function3 :: Int -> Int -> Int
function3 m n
    | m == n    = m + n
    | m > n     = m * m
    | otherwise = n * n
```
1. This function does not use recursion, so there is no base case or step case.
2. The function takes two input numbers and either adds them together if they are the same, or multiplies the large by ```n``` if ```m``` and ```n``` are different. (Note: This function would never be used).

```haskell
function4 :: Int -> Int -> Int
function4 n x = case n of
    1 -> x
    _ -> x + function4 (n - 1) x
```
1. This is a recursive function, the base case is when the first integer reaches one, and the recursive case is when the first integer is anything else.
2. This is a multiplication function: it effectively multiplies the two numbers by repeatedly adding the second input number to itself ```n``` times.

```haskell
function5 :: Int -> Bool
function5 i
    | i == 0    = True
    | i < 0     = False || function5 (i + 1)
    | otherwise = False || function5 (i - 1)
```
1. This function is recursive, with the base case being when ```i``` is equal to ```0```, and the step case being either decrementing or incrementing ```i``` depending on whether it is negative or positive. 
2. This is a not very useful function, as it will always output ```True``` no matter what number is input: ```i``` will always reach ```0``` and output ```True```, so the boolean ORs will output ```True```.

```haskell
data [Int -> Bool] = (Int -> Bool) : [Int -> Bool] | []
```
1. This type is recursive. The base case is before ```|``` while the recursive step is after.
2. This type defines a list where the elements are functions from ```Int``` to ```Bool```.

```haskell
data myCoolType = My | Type | Is | Cool
```
1. This type is not recursive.
2. It can take the values ```My```, ```Type```, ```Is``` and ```Cool```. It seems to be a useless type.


## Question 2: Filling in the Blanks 

Now that we have a deep knowledge of recursion, let's try write some recursion ourselves. We will begin by filling in the blanks. So try complete these functions:

```haskell
lastElement :: [Int] —> Int
lastElement ls = case ls of
    []  -> error "No Last Element"
    [x] -> x
    _   -> lastElement (tail ls)
```

```haskell
capitalise :: String -> String
capitalise ""   = ""
capitalise str  = (toUpper (head str)) : (capitalise (tail str))
```
Note: ```toUpper``` is a ```Prelude``` function that makes characters upper case. For example: ```'a' -> 'A'```.

```haskell
stringAddition :: String -> String -> String
stringAddition str1 str2
    | str1 == []    = str2
    | otherwise     = stringAddition (init str1) (last str1 : str2)
```
Note: ```init``` gets all but the last element of a list. For example: ```"abc" -> "ab"```. ```last``` is the proper Haskell verion of our ```lastElement```.


## Question 3: Writing Our Own Recursive Functions

Consider the factorial function from mathematics:

```
n! = n * (n-1) * ... * 2 * 1
```
So, for example, ```3! = 3 * 2 * 1 = 6```. Let's try to construct a factorial function in Haskell using recursion!

``` haskell
factorial :: Int -> Int
factorial i
    | i == 0    = 1
    | i > 0     = i * (factorial (i-1))
    | otherwise = error "Factorial on negative number"
```

## Question 4: Master of Recursion

Reversing a string seems like a pretty standard function:
```haskell
"hello" -> "olleh"
```
So let's write it in Haskell:
```haskell
reverse :: String -> String
reverse ls = case ls of
    []      -> []
    x:xs    -> reverse(xs) ++ x
```
(Why can't we use cons ```:``` in the final line?)

But now let's consider the harder problem: reversing list of strings and reversing the strings inside a well:
```haskell
["A man", "a plan", "a canal", "panama!"] -> ["!amanap" ,"lanac a" ,"nalp a","nam A"]
```
This function is clearly more difficult, but give it a shot:
```haskell
reverseWithReverse :: [String] -> [String]
reverseWithReverse ls = case ls of
    []      -> []
    x:xs    -> reverseWithReverse(xs) ++ reverse(x)
```