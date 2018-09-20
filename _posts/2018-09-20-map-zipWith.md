---
layout: post
title:  "The Map to Good Programming"
date:   2018-09-20 18:01:41 +1100
categories: worksheets wk3 decomposition
---

# The Map to Good Programming
Firstly, we're going to rewrite a function ``mapAddTwo`` 
```Haskell
addTwo :: Num a => a -> a
addTwo x = x+2
```
1. Write a function that uses this one to add two to each list (don't use the pre-defined ``map`` function!). It will have type signature: ``mapAddTwo :: Num a => [a] -> [a]``.
2. Now try writing the function ``mapAddThree`` to add three to each element of a list.

You can see how similar ``mapAddTwo`` is to ``mapAddThree``. This is a sign that you can generalise these two functions. If you ever notice you're copy and pasting lots of code, you should __check to see if you can write a more generalised function, that you can reuse.__
3. Write a function ``map:: (a->b) -> [a] -> [b]`` that generalises your functions from (1) and (2).
# Zipping Up Your Problem
Next, we're going to write a function ``zipAdd:: Num a => [a] -> [a] -> [a]``. This function takes in two lists of numbers, then adds the matching components, and another list. For example:
```Haskell
zipAdd [1, 2, 3] [1, 2, 0] = [2, 4, 4]
```
4. Write the function ``zipAdd``. Make sure to discuss what to do when one list is longer than the other.

5. Now write the function ``zipTuple:: [a] -> [b] -> [(a,b)]`` that takes two lists, and outputs a new list where elements in the same position are put in a tuple. For example:
```Haskell
zipTuple [0, 1] [Nothing, Just 2] = [(0, Nothing), (1, Just 2)]
```
6. Can you see the repetition in your code? Now write a more general function ``zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]`` that takes a function, two lists, and combines elements in the same positions using the function.
