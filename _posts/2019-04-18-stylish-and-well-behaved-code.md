---
layout: post
title:  "Stylish and well behaved code"
date:   2019-04-18 09:10:41 +1100
categories: worksheets wk7
---

# Stylish and well behaved code
Discuss in your group what the difference is between black-box and white-box testing is. If you don't know, ask your peers!

# Black-box 
Create a few black box tests for the following functions
```haskell
absoluteValue :: (Num a) => a -> a 

data Triangle = Equilateral | Isoscelese | Scalene
typeOfTriangle :: (Num a) => a -> a -> a -> Triangle

SumOdd :: (Num a) => [a] -> a
```
# White box 
Write some white-box tests for this code, the code has some errors, try and find them! Also, you might want to rename some variables once you find out what it does.
```haskell
function_1 :: [Int] -> Int
function_1 list = case list of
    [] -> error "empty list"
    x:y:[] 
        | x >= y -> x
        | otherwise -> y
    x:y:xs
        | x >= y -> function_1 x:xs 
        | otherwise -> function_1 y:xs
        
function_2 :: Int -> Int
function_2 number 
    | number == 10 = number
    | otherwise = function_2 (number + 1)
    
function_3 :: [(Int,Int)] -> [Int]
function_3 list1 list2 = case (list1,list2) of
    ([], []) -> []
    (x:xs, y:ys) -> (x+y) : (function_3 xs ys)
```

# Stylish code for Stylish kids
Can you improve the style of these functions

```haskell
true_or_not :: Bool -> Bool -> Bool
true_or_not x xx = (x == True) && (xx == True) = True

bad_name_for_a_function :: [Integer] -> Integer
bad_name_for_a_function very_long_integer_list = case very_long_integer_list of
    first_element : rest_of_the_elements -> first_element + (bad_name_for_a_function rest_of_the_elements)
    []                                   -> 0
    
list_more_than_5 :: [a] -> Bool
list_more_than_5 l = case l of
    [w,x,y,z] -> False
    [x,y,z] -> False
    [y,z] -> False
    [z] -> False
    [] -> False
    _ -> True
    
fun1 :: Type1 -> Type2 -> Type3
fun1 var1 var2 = take var2 var1

number_grade_to_letter_grade x = case (x < 50) of
    LT -> Fail
    _  -> case (x < 60) of
        LT -> Pass
        _  -> case (x < 70) of
            LT -> Credit
            _  -> case (x < 80) of
                LT -> Distinction
                _  -> High_Distinction
```
