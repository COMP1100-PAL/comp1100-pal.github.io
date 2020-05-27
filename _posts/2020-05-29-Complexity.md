---
layout: post
title:  "Complexity"
date:   2020-05-29 08:00:00 +1100
categories: worksheets
---

## Complexity

Luckily for you, complexity is one of the least complex topics in COMP1100. Colloquially, complexity is just a measure of how many resources a program takes up, and is a measure of efficiency. Efficiency can be measured in many ways - in terms of time (CPU time), memory, or network usage among others.

Here, we mainly focus on **time complexity**: _**What happens as the size of the problem being solved gets larger?**_

The time required by a function/procedure is proportional to the number of "basic operations" that it performs. e.g. reading over a single element in a list. Some functions/procedures perform the same number of operations every time they are called, while other functions may have a different number of operations depending on the input, or by chance.

Complexity is typically represents as a _rate of growth_ proportional to the input size _n_ with **big-O** notation. Here are several classes of functions that are commonly encountered while analysing the complexity of functions:

| Big-O Notation | Name          |
| -------------- |:-------------:|
| O(1)           | constant      |
| O(log(n))      | logarithmic   |
| O(n)           | linear        |
| O(n log(n))    | linearithmic  |
| O(n^2)         | quadratic     |
| O(n^c)         | polynomial    |
| O(c^n)         | exponential   |

where c is a constant

Typically, we are usually interested in the worst case: what is the maximum number of operations that might be performed for a given problem size. This is what is typically represented by ```O(n)```.

Note that different problems often have different complexities, and what constitutes a 'fast' or good time complexity for one problem might be considered a 'slow' or bad time complexity for another problem. Hence, comparing complexities is most useful for working out what implementation of a given problem will be the fastest, or how big an input we can give our program for it to run in a reasonable amount of time (e.g one second). However in this course we will just stick to calculating the time complexity of the programs we write.

For example, say we want to test if a list contains a given element. To check this, we have to look at every element in the list and see if it is the element we are looking for. Hence if there are ```n``` elements in the list, the time complexity will be ```O(n)```: the time taken to check all the elements in the list is proportional to the number of elements in the list.

On the other hand, suppose we want to determine if there exists a subset of our list that has a certain sum. There are ```2^n``` possible distinct subsets of the list that need to be tested, and testing each subset requires adding all the elements of the subset, which is at most ```n```. Hence the time complexity would be ```O(2^n*n)```.

Here is a useful visualisation of how different complexities scale based on the size of the input ```n```.

!["ALT TEXT"](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/_posts/Screenshot%20from%202018-05-29%2016-30-25.png "Complexity Graph")

### Question 1: Tail

What is the complexity of the ```tail``` function?

### Question 2: Adding an element to a list

Write a function to add an element to the end of a list. What is the time complexity of the function you have written?

### Question 3: Reverse `(++)`

We have written the following function:

```haskell
reverse :: [a] -> [a]
reverse list = case list of
  [] -> []
  x:xs -> (reverse xs) ++ [x]
```

Find the complexity of the reverse function above. Is there a better way to implement this? What would be the lowest complexity for the reverse function?

### Question 4: Minimum length list

We have written the following function:

```haskell
short :: [[a]] -> Int
short list = case list of
    []      -> error "No lists in the list"
    x:xs    -> helper (tail(list)) (length(head(list)))
    where
        helper :: [[a]] -> Int -> Int
        helper ls v = case ls of
            [] -> v
            x:xs
                | length(x) < v -> helper xs (length(x))
                | otherwise     -> helper xs v
```

Find the complexity of the ```short``` function above. Note: assume there are `c` lists in the list of lists.

## Sorts

Hopefully, you now have a decent understanding of complexity. One of main applications is in sorting, i.e we have a list ```ls``` and we want to rearrange the elements such they are increasing order. For example:

```haskell
[1,3,5,4,2,0] -> [0,1,2,3,4,5]
```

The standard sorting algorithm is Insertion Sort: it goes through the list, taking each element and placing it in the correct position in the sorted list. Here it is in Haskell:

```haskell
insertionSort :: Ord a => [a] -> [a]
insertionSort ls = foldl insert [] ls
    where
        insert :: Ord a => [a] -> a -> [a]
        insert ls x
            | ls == []          = [x]
            | x <= head(ls)     = x : ls
            | otherwise         = head(ls) : (insert (tail(ls)) x)
```

Clearly, we always want to sort in the smallest amount of time possible. Given this, many different sorting algorithms have been proposed, analysed and tested, each trying to be crowned as the best. Let's examine a few and see how they perform.

### Question 1: Standard Sort

Above, we defined ```insertionSort```. What is its complexity?

### Question 2: Mergesort

Conceptually, mergesort works as follows:

1. Divide the unsorted list by halving the list until there are ```n``` sublists of ```1``` element (an element of ```1``` is considered sorted).
2. Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

Here's an example of how it works:

!["MergeSort"](https://upload.wikimedia.org/wikipedia/commons/e/e6/Merge_sort_algorithm_diagram.svg "mergesort")

Implement the mergesort algorithm in Haskell, if you can. Using this function or otherwise, determine the complexity of the algorithm.

### Question 3: Quicksort

Conceptually, quicksort works as follows:

1. Pick the first element of the list as a "pivot"
2. Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position. This is called the partition operation.
3. Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.

Here's an example of how it works:

!["Quicksort"](https://nevalalee.files.wordpress.com/2013/08/quicksort.jpg "Quicksort")

Implement the quicksort algorithm in Haskell, if you can. Using this function or otherwise, determine the complexity of the algorithm. Is there a better way to implement this? What are the average and worst case complexities for the quicksort function?

_Hint: Use list comprehensions!_

### Challenge Question: Bogosort

This one's an interesting one. Don't worry if you don't recognise all the code in here, focus on the conceptual details. Before you do anything, what does this program actually do?

```haskell
-- http://rosettacode.org/wiki/Sorting_algorithms/Bogosort#Haskell
import System.Random
import Data.Array.IO
import Control.Monad
isSorted :: (Ord a) => [a] -> Bool
isSorted (e1:e2:r) = e1 <= e2 && isSorted (e2:r)
isSorted _ = True

-- from http://www.haskell.org/haskellwiki/Random_shuffle
-- TL;DR it randomly shuffles the list
shuffle :: [a] -> IO [a] -- This is what requires all the imports
shuffle xs = do
        ar <- newArray n xs
        forM [1..n] $ \i -> do
        j <- randomRIO (i,n)
        vi <- readArray ar i
        vj <- readArray ar j
        writeArray ar j vi
        return vj
  where
    n = length xs
    newArray :: Int -> [a] -> IO (IOArray Int a)
    newArray n xs = newListArray (1,n) xs

-- This new ">>=" symbol can be thought of as simply "stripping"
-- the IO type from the output of shuffle, i.e. making it type [a]
bogosort :: (Ord a) => [a] -> IO [a]
bogosort li | isSorted li = return li
| otherwise = shuffle li >>= bogosort
```

What are the average and worst time complexities of this program?
_Hint: Does bogosort ever terminate?
