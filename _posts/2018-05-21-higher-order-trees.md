---
layout: post
title:  "Higher-Order Higher Order Functions"
date:   2017-03-28 11:25:29 +1100
categories: worksheets wk11 ass3
---

## Functional Composition
Functional composition is a very simple concept, it's simply just using functions together to generate a result. Typically programmers like to create large functions that do EVERYTHING. But this isn't very good in the long run, its harder to debug large functions, and even makes it harder to read. So we like to create smaller functions that do one thing well, and then compose them together to achieve the desired result. Take for example the function that calculates the standard deviation of a set of values: 

![](https://qph.fs.quoracdn.net/main-qimg-763e528ea0b80662d805b1a45e9ff3d6)

You could try can create a function that calculated the standard deviation in one go but I bet you it would take a long time do to and take even longer to debug! If you look closely you can see that the standard deviation is the composition of many functions. Square root, summation, squaring, division...All of these operations are technically their own function and should be treated as such when the probem is decomposed and functionally recomposed together.

### Activity
1. Impliment a function that calculates the Standard Deviation of a distribution of values, use the definition above.
2. (ADVANCED ONLY) Using the definition below calculate the normal probablity density function for a distribution and a value in the distribution
![](https://fthmb.tqn.com/9usa32t1cvBlQmzx6Fs0YjZ262k=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/bellformula-56b749555f9b5829f8380dc8.jpg)

Discuss how you generated your solutions? Did you start by creating the smaller functions first or did you start with the overarching function first and when you got stuck did you create a helper function?


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
3. Checking if all or some of the elements in a collection satisfy some condition

Read through these definitions and try to impliment them using composition of higher order functions.

1. `sum :: (Num a) => [a] -> a` calcualtes the sum of a list of numbers, remember to use fold!
2. `dotProduct :: (Num a) => [a] -> [a] -> a` calculates the dot product of two vectors.
3. `oneMatch :: a -> [a] -> Bool` returns true if at least one element from the input list matches the input target and false if no elements match. Hint what does the `all` and `any` functions do in haskell? They both have the type signature :`(a -> Bool) -> [a] -> Bool`
4. `treeZipWith :: (a -> b -> c) Tree a -> Tree b -> Tree c)` Takes a function and two trees and zips them up into a single new tree. Think about how regular `zipWith` is defined and apply that to `treeZipWith`.
5. `treeFold :: (a -> b -> b) -> Tree a -> b-> b` aims to reduce every single node of a tree into a single value. Where `Tree a = (Node a (Tree a) (Tree a))`. Think about how you actually need to fold the tree up. Can you start at the top or do you need to start at the leaves?
