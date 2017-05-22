---
layout: post
title:  "Two's Complement: Binary Trees"
date:   2017-04-24 18:01:41 +1100
categories: worksheets wk8 binary trees tree
---

Lets get comfortable with binary trees! Recall the binary tree type definition

```
data Tree a = Node a (Tree a) (Tree a) | Empty
```
#### Question 1
Draw a binary tree of integers on the white board with at least 4 nodes. Write out your binary tree in full Haskell syntax, in accordance with the type definition given above. Is your binary tree balanced? If not, re-draw your original tree as a balanced tree. Get a PAL mentor to check!

#### Question 2
Write a function `count`, which inputs a binary tree and outputs the total number of nodes in that tree.

#### Question 3
Write a function `sum`, which inputs a binary tree of integers and outputs the sum of all the nodes in that tree.

#### Question 4
Write a function `flatten`, which takes inputs `Tree a` and outputs a list of all the node elements. 

_Extension: If your input tree for question 4 is balanced, can you think of a modification to your `flatten` function that preserves the order of the tree? I.e., can you flatten down the tree into a list of ascending values?_

#### Question 5
Let us call a binary tree symmetric if you can draw a vertical line through the root node and then the right subtree is the mirror image of the left subtree.
Write a function called `QSymmetric` that returns `True` if an input tree is symmetric, and `False` otherwise.

#### Question 6
Write a function called `flip`, which takes in a binary tree and swaps the position of every subtree. That is, for every subtree, each right node goes to the left, and each left node goes to the right.
