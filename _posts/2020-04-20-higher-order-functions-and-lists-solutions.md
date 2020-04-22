---
layout: post
title:  "Higher Order Functions and Lists Solutions"
date:   2020-04-20 12:00:00 +1100
categories: worksheets
---


### Question: Writing List Recursion Functions

Here are some questions to help you revise list recursion. Note that the __Answers__ are just one of many possible implementations.

1. Implement the function ```addOne :: [Int] -> [Int]``` which takes a list and adds one to each element. E.g ```addOne [1, 2] = [2, 3]```.

__Answer__:
```haskell
addOne :: [Int] -> [Int]
addOne [] = []
addOne (x:xs) = (x + 1) : (addOne xs)
```

---

2. Implement the function ```multiplyN :: Int -> [Int] -> [Int]``` which takes a list and multiplies each element by a constant so ```multiplyN  3 [1, 2] = [3, 6]```.

__Answer__:
```haskell
multiplyN :: Int -> [Int] -> [Int]
multiplyN n [] = []
multiplyN n (x:xs) = (x * n) : (multiplyN n xs)
```

---

3. Implement the function ```addList :: (Num a) => [a] -> [a] -> [a]``` which takes two lists and adds each element to the corresponding element in the other list, so ```addList  [3, 5] [1, 2] = [4, 7]```. Note that ```addList``` should produce an error if the lists have different lengths.

__Answer__:
```haskell
addList :: (Num a) => [a] -> [a] -> [a]
addList l1 l2 = case (l1, l2) of
    ([], [])     -> []
    (x:xs, y:ys) -> (x + y) : (addList xs ys)
    _            -> error "Lists do not have the same length"
```

---

4. Implement the function ```removeNegative :: [Int] -> [Int]``` which takes a list and removes all the negative elements, so ```addList  [1, -2, 3, -4] = [1, 3]```.

__Answer__:
```haskell
removeNegative :: [Int] -> [Int]
removeNegative [] = []
removeNegative (x:xs)
    | x < 0 = removeNegative xs
    | otherwise = x : (removeNegative xs)
```

### Questions: Type Signatures for Higher Order Functions

Below, we have a variety of function definitions. All of these define higher order functions. For each, add the type signature. Remember to use polymorphism to make them as general as possible!

```haskell
apply :: ____________
apply f x = f x
```

__Answer__:
```haskell
apply :: (a -> b) -> a -> b
```
---
```haskell
curry :: ____________
curry f x y = f (x,y)
```

__Answer__:
```haskell
curry :: ((a,b) -> c) -> a -> b -> c
```
---
```haskell
multiplyTwice :: ____________
multiplyTwice n = (\x -> x * n * n)
```

__Answer__:
```haskell
multiplyTwice :: (Num a) => a -> (a -> a)
```

### Questions: Type Signatures to Function Definition

Now we have the opposite: a lot of type signatures but no function definitions! Fill in the blanks and define the functions below based on their names, inputs and type signatures:

```haskell
add :: Int -> (Int -> Int)
add n = ____________
```

__Answer__:
```haskell
add n = (\x -> x + n)
```

---

```haskell
choose :: Int -> [a -> b] -> a -> b
choose i listOfFunctions x = ____________
```

__Answer__:
```haskell
choose i listOfFunctions x = (listOfFunctions !! i) x
```

### Questions: Your Own Higher Order Function

Write the type signature for and define a higher order function that does the following: takes in two functions and a tuple and then applies the first function to the left tuple value and the second function to the right tuple value. This will return a tuple. For example:

```haskell
func (+1) toUpper (0, 'i') = (1, I)
```

__Answer__:
```haskell
func :: (a -> b) -> (c -> d) -> (a,c) -> (b,d)
func f1 f2 (a,b) = (f1 a, f2 b)
```

### Questions: Writing Higher Order Functions on Lists

Now that you have some familiarity with higher order functions which operate on lists, have a go at writing your own version of the functions! Do this for  ```map```, ```zipWith```, ```foldl``` and ```foldr```.

__Answers__:
```haskell
map :: (a -> b) -> [a] -> [b]
map f ls = case ls of
    []     -> []
    (x:xs) -> f x : map f xs

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipwith f (x:xs) (y:ys) = (f x y) : (zipwith f xs ys)
zipwith _ _ _           = []
    
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f z ls = case ls of
    []     -> z
    (x:xs) -> foldl f (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z ls = case ls of
    []     -> z
    (x:xs) -> f x (foldr f z xs)
```