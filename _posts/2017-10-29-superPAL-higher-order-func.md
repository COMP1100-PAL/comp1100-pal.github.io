---
layout: post
title:  "SuperPAL Higher-order functions"
date:   2017-10-29 15:17:29 +1100
categories: week 12, comp1100
---

## In-Built Functions
In-built functions are already defined for you in the Prelude, you can use them in the exam if you remember that they exist! 
Write the following functions
1.  `length :: [a] -> Int` 

  This finds the length/size of the list.
  
  e.g. `length [4,7,9,10] = 4`
  
2.  `(!!) :: [a] -> Int -> a`

This finds the nth element of a list.

e.g. `[9,4,8,1] !! 3 = 8`

3.  `minimum :: [a] -> a`

This finds the least element in a list. [There is also maximum]

e.g. `minimum [6,2,9,1] = 1`

4.  `(++) :: [a] -> [a] -> [a]`

This combines two lists together.

e.g. `[1,2,3,4] ++ [5,6,7,8] = [1,2,3,4,5,6,7,8]`

5.  `drop :: Int -> [a] -> [a]`

This deletes the first n elements from a list.

e.g. `drop 3 [2,7,5,7] = [7]`

6. `take :: Int -> [a] -> [a]`

This takes the first n elements from the list

e.g. `take 3 [2,7,5,7] = [2,7,5]`

7. `last :: [a] -> a`

Gets the last element of the list

e.g. `last [1,2,3] = 3`

8. `isElem :: a -> [a] -> Bool`

Checks is an elemet is in the list.

e.g. `isElem 3 [1,2,3,4] = True`



## Higher-Order Functions

Higher-order functions are useful functions that are already defined in the Prelude and you can use in the exam. Given that you remember them!
Write the following functions

1.  `map :: (a->b) -> [a] -> [b]`

Applies a function to each element of a list

e.g. `map (*2) [1,2,3] = [2,4,6]`

2.  `filter :: (a -> Bool) -> [a] -> [a]`

Applies a Boolean function to each element of a list and returns a list of elements that returned true.

e.g. `filter (isEven) [1,2,3,4] = [2,4]`

3. `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]`

Combines too lists together with a function.

4. `foldl :: (a -> b -> b) -> [a] -> b`

Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold. Fold left does this by applying the function to a recursive call.

e.g. `sum = foldl (+)`

5. `foldr :: (a -> b -> b) -> b -> [a] -> b`

Fold right does this with an identity/accumulator and is tail recursive.

e.g. `sum = foldr (+) 0`
