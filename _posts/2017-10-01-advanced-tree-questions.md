---
layout: post
title:  "BSTree Insert"
date:   2017-10-01 15:19:41 +1100
categories: worksheets wk9 advanced tree questions
---

## Flatten
Write a function that flattens a tree, while preserving order. Flattening is the process of converting a tree to a list.
`flatten (Node 5 (Node 3 (Node 2 Null Null) (Node 4 Null Null)) (Node 8 (Node 7 Null Null) (Node 10 Null Null))) = [2,3,4,5,7,8,10]`

## Grow
Given a list of elements than can be ordered, insert them one by one into a binary search tree. Remember that for a tree to satisfy the condition that it is a binary
search tree it has to have every element smaller than the current element on the left sub-tree and every element larger than the current element on the right sub-tree.

```haskell
data BSTree a = Node a (BSTree a) (BSTree a) | Null

GrowBST :: (Ord a) => [a] -> BSTree a
```

For example the list `[5, 2, 6, 1, 3, 8]` should output:
!["YA BOI"](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/img/grow_binary_tree.png?raw=true "WOOO")


Trace your function with the input `[1, 2, 3, 4]` What does your tree look like? 

# Balancing Trees
Lopsided trees are weird, and annoying... Can we balance the tree somehow to make the branches more even?

There are multiple ways to balance. Try think of a method and write a function that does this. 

How efficient is your current function? Is there a way to make this better and/or faster?

There is a method to balance trees using rotation. The idea is that if the 2 branches of a node have depths that differ by more than one, you rotate the branch so that the branches have a difference in depth of less than 1. 

Try to impliment a function that does this. 
