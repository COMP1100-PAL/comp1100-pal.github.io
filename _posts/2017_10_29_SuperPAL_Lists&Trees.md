---
layout: post
title:  "Lists & Trees"
date:   2017-10-29
categories: superPAL
---

# It's Time to Revise: Lists & Trees

#### Question 1: Deleting Elements from a List
a) Write a function that finds the position of an element in a list, and returns this index

b) Write a function that splits a list at an index ```n``` (you can keep the element at this index in either list) and outputs the two lists as a tuple

c) Write a function that deletes an element ```x``` from a list and returns the list without the first instance of that element (hint: using your previous functions may be helpful).

d) *(extension)* Can you write a function that deletes all instances of an element ```x``` from a list?

#### Question 2
Write a function ```treemap :: (a -> b) -> Tree a -> Tree b ``` that takes in a tree and applies a function to every node in the tree.

#### Question 3
Write a function `flatten`, which takes inputs `Tree a` and outputs a list of all the node elements. 

_Extension: If your input tree for question 2 is balanced, can you think of a modification to your `flatten` function that preserves the order of the tree? I.e., can you flatten down the tree into a list of ascending values?_

#### Question 4
Write a function called `flip`, which takes in a binary tree and swaps the position of every subtree. That is, for every subtree, each right node goes to the left, and each left node goes to the right.
