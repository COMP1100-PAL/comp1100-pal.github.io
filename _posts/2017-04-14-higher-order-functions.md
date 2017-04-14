---
layout: post
title:  "Higher-order Functions"
date:   2017-03-24
categories: worksheets wk7 lists
---

## Haskell in-built List functions

Haskell prelude comes with a number of functions which make working on lists much easier. We can nearly always access these functions, however it may be useful to actually code these, so that we have a full understanding of them for when we use them. 

*Below are a number of in-built functions on lists, with their descriptions.*

1. `length :: [a] -> Int` 
This finds the length/size of the list.
e.g. 'length [4,7,9,10] = 4

2. ' (!!) :: [a] -> Int -> a'
This finds the nth element of a list.
e.g. '[9,4,8,1] !! 3 = 8'

3. 'minimum :: [a] -> a'
This finds the least element in a list. [There is also maximum]
e.g. 'minimum [6,2,9,1] = 1'

4. '(++) :: [a] -> [a] -> [a]'
This combines two lists together.
e.g. '[1,2,3,4] ++ [5,6,7,8] = [1,2,3,4,5,6,7,8]'

5. 'drop :: Int -> [a] -> [a]'
This deletes the nth element from a list.
e.g. 'drop 3 [2,7,5,7] = [2,7,7]'
