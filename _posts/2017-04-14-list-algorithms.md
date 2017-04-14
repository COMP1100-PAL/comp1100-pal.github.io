---
layout: post
title:  "List Algorithms"
date:   2017-04-14
categories: worksheets wk7
---
# List Algorithm

Lists are very useful in Haskell, and also in all of computer science. There are many algorithms that you can run over lists. The following excercises will explore some of those algorithms.

Write a function ``invertlist`` that inverts any given list.
For example, ``invertlist [1,2,3] = [3,2,1]``
What if the input is a very long list? How long will this function take to run? Could you write a faster version with a different implimentation?

Quicksort is a sorting algorithm that sorts a list faster than insertsort does. 
Quicksort picks a number in the list, and sets that as a pivot. Then it arranges all other numbers into two lists, one list containing all numbers smaller than the pivot, the other list containing all numbers bigger than the pivot. After this process, the pivot position is final. Repeat this process for your smaller lists, picking a new pivot from your small list and splitting that list into two lists. Once all the smaller lists are sorted, concatenate all the small lists together.
Write ``quicksort`` as described above.
Sidenote: if this pivot is a bad pivot, e.g picking the pivot 2 from a list [1,2,3,4] takes longer with quicksort than insertsort.

Write a function ``group :: String -> [String]`` that groups all the same characters. 
For example ``group "ahhhhh saaaaaveeeee meeeeee" = ["a", "hhhhh", " ", "s", "aaaaa", "v", "eeeee", " ", "m", "eeeeee"]``