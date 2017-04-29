---
layout: post
title:  "BSTree Insert"
date:   2017-05-01 18:01:41 +1100
categories: worksheets wk9 binary trees tree
---

Given a list of elements than can be ordered, insert them one by one into a binary search tree. Remember that for a tree to satisfy the condition that it is a binary
search tree it has to have every element smaller than the current element on the left sub-tree and every element larger than the current element on the right sub-tree.

```haskell
data BSTree a = Node a (BSTree a) (BSTree a) | Null

GrowBST :: (Ord a) => [a] -> BSTree a
```

Trace your function with the input `[1, 2, 3, 4]` What does your tree look like? Is there a way to modify your function so that it inserts the elements in a 
balanced way for a list?
