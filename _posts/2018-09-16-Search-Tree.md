---
layout: post
title:  "Search dat tree"
date:   2018-09-16 11:25:29 +1100
categories: worksheets wk7 review
---

# Search a tree
Now we're upping the ante, below is the definition of a binary tree
```haskell
type BinaryTree a = Node a BinaryTree a BinaryTree a | Nothing
```
Search a binary tree and see if it contains a particular element. Finish the function defintion below on the whiteboard.
```haskell
searchBinaryTree :: BinaryTree a -> Bool
searchBinaryTree tree = case tree of
    Nothing ->
    Node element leftSubTree rightSubTree ->
```

## Hints
* Before jumping in to just trying to solve this problem thing about what sub-problems will arise while tying to solve it
* Draw a diagram of your strategy
