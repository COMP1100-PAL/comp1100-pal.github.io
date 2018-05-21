---
layout: post
title:  "Higher-Order Higher Order Functions"
date:   2017-03-28 11:25:29 +1100
categories: worksheets wk11 ass3
---

## Super powered higher-order functions

As we know, higher-order functions generalise popular programming patterns. Common patterns might be familiar to you, for example: 
1. Removing items from a list based on a predicate
2. Applying a function to every element in a list

### side topic - list comprehensions compose both map and filter for lists!
A typical list comphrension has a form of 
`[map function (elements) | elements <- list.. , filter elements...]` For example, 
`[2 * x | x <- [1..10], x > 5]` 

Which reads as: "for every element in this list, map `times 2` over them, the elements are drawn from [1..10], but filter them first, only use elements bigger than 5".
Or a more advanced one:

`[(x,y) | x <- [1..10], y <- [1..10], x + y == 5]`
Which reads as: the tuples of numbers from 1 to 10 where the total is 5. This works because list comprehensions create the cartesian product of elements when drawing elements from many lists.

Have a go at writing functions with list comprehensions that do the following:
1. Return a list of every element from the input list halved but only for elements that don't equal 0
2. Return a list of every tuple from two lists where at least one of the elements is 5

### Ok, back on track
But it gets better! we can generallise even further. These patterns apply to more abstract concepts, for example, instead of a "list", we can refer to a "collection" of items, we don't actually care how they're arranged.
1. Removing items from a collection based on a predicate
2. Applying a function to every element in a collection

Read through these definitions and try to impliment them using composition of higher order functions.

1. `sum :: (Num a) => [a] -> a` calcualtes the sum of a list of numbers, remember to use fold!
2. `dotProduct :: (Num a) => [a] -> [a] -> a` calculates the dot product of two vectors.
3. `treeFold :: (a -> b -> b) -> Tree a -> b-> b` aims to reduce every single node of a tree into a single value. Where `Tree a = (Node a (Tree a) (Tree a))`. Think about how you actually need to fold the tree up. Can you start at the top or do you need to start at the leaves?
4. `treeZipWith :: (a -> b -> c) Tree a -> Tree b -> Tree c)` Takes a function and two trees and zips them up into a single new tree. Think about how regular `zipWith` is defined and apply that to `treeZipWith`


