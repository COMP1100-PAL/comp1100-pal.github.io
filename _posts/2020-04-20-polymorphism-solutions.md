---
layout: post
title:  "Polymorphism Solutions"
date:   2020-03-30 08:00:00 +1100
categories: worksheets
---


## Question 1: Identifying Recursion

We have a list of types and a list of instances.For each type, say whether it is polymorphic and if it is not, link it its instance.

Types:
```haskell
[a]    Maybe a    Bool    String    (Bool, b)    a    Maybe Int    Double    Char    Int    (String, Char)
```

Instances:
```haskell
1    "True"    ("1", '1')    1.0    '1'    True    Just 1
```

__Answers__: 
```
"True" - String 
("1",'1') - (Char , String) 
1.0 - Double 
True - Bool
Just 1 - Maybe Int
```


## Question 2: Applying Polymorphic Functions

We will now take a look at some examples of useful polymorphic functions. For each of the functions, see if you can work out what they do:

```haskell
polymorphism0 :: [a] -> a
polymorphism (x:xs) = x
```
__Answer__: Extracts the head of a list

```haskell
polymorph1 :: a -> b -> (a,b)
polymorph1 elem1 elem2 = (elem1, elem2)
```
__Answer__: Given two elements this function will output a tupple with the two (in the same order).

```haskell
polymorph2 :: (Eq a) => [a] -> a -> Int
polymorph2 lst elem = case lst of 
    [] -> 0
    _
        | head lst == elem -> 1 + polymorph (tail lst) elem
        | otherwise -> polymorph (tail lst) elem
```
__Answer__: ```polymorph2``` returns the number of times ```element``` is present in ```lst```.

```haskell
polymorph3 :: [a] -> [b] -> [(a,b)]
polymorph3 lst1 lst2 
    | lst1 == [] || lst2 == [] = []
    | otherwise = [(head lst1, head lst2)] ++ polymorph3 (tail lst1) (tail lst2)
```
__Answer__: creates a list of tupples with elements of the two lists 

```haskell
polymorph4 :: (Num a) => a -> a -> a
polymorph4 x n
    | n =< 1 = 0
    | otherwise = x + polymorph4 x (n-1)
```
__Answer__: returns ```x * (n - 1)``` but effectively rounds up ```n``` if it is not an integer.

We also have the following list of 5 inputs and outputs:

Inputs:
```haskell
20  "Green"
[True, True, False] True
2  3
"Turtle"
['x','y','z']  [1, 2, 3]
```

Outputs:
```haskell
"T"
[('x', 1), ('y',2), ('z', 3)]
5
(20, "Green")
2
```

__Answers__:
```haskell
polymorphism0 "Turtle" = "T"
polymorphism1 20 "Green" = (20, "Green")
polymorphism2 [True, True, False] True = 2
polymorphism3 ['x','y','z'] [1, 2, 3] = [('x', 1), ('y',2), ('z', 3)]
polymorphism4 2 3 = 5
```


## Question 4: Turning Functions Polymorphic

We have seen many haskell functions so far, but until now none have been polymorphic. Let's fix this situation! Take these list functions you and make them polymorphic:

__Answers__:

```haskell
reverse :: [a] -> [a]  
reverse ls = case ls of  
    []      -> []  
    x:xs    -> reverse(xs) ++ x
```

```haskell
length :: [a] -> Int
length []   = 0
length x:xs = 1 + (length xs)
```

```haskell
elementRepetition :: Int -> a -> [a]  
elementRepetition i s
    | i == 0    = []
    | i > 0     = i : (elementRepetition (i-1) s)
    | otherwise = error "Input is negative"
```


## Question 5: Your Own Polymorphic Functions

Now it is time for you to write your own polymorphic functions! Try write a function ```isPallindrome``` that detects if a list if a pallindrome - the same forwards and backwards.

Here are some examples to test against:

```haskell
isPallindrome "racecar" = True
isPallindrome [1,2,3,3,2,1] = True

isPallindrome "not a tonne" = False
isPallindrome [Just True, Nothing, Nothing] = False
```
__Answer__:
```haskell
isPallindrome :: [a] -> Bool 
isPallindrome x = x == reverse x 
```
(Hint: use the function ```reverse``` that flips a list).
