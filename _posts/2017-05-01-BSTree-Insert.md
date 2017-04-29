---
layout: post
title:  "BSTree Insert"
date:   2017-05-01 18:01:41 +1100
categories: worksheets wk9 binary trees tree
---

## Flatten
Write a function that flattens a tree, while preserving order. Flattening is the process of converting a tree to a list.
`flatten (Node 5 (Node 3 (Node 2 Null Null) (Node 4 Null Null)) (Node 8 (Node 7 Null Null) (Node 10 Null Null))) = [2,3,4,5,7,8,10]`

Given a list of elements than can be ordered, insert them one by one into a binary search tree. Remember that for a tree to satisfy the condition that it is a binary
search tree it has to have every element smaller than the current element on the left sub-tree and every element larger than the current element on the right sub-tree.

```haskell
data BSTree a = Node a (BSTree a) (BSTree a) | Null

GrowBST :: (Ord a) => [a] -> BSTree a
```

Trace your function with the input `[1, 2, 3, 4]` What does your tree look like? Is there a way to modify your function so that it inserts the elements in a 
balanced way for a list?


## Sieve of Erasthesene

The sieve of Eratosthene is a quick way to find the first `n` prime numbers. It works particularly well in Haskell, which has the concept of infinite lists.

  Here is what wikipedia describes the algorithm as:
  To find all the prime numbers less than or equal to a given integer n by Eratosthenes' method:
    - Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
    - Initially, let p equal 2, the smallest prime number.
    - Enumerate the multiples of p by counting to n from 2p in increments of p, and mark them in the list (these will be 2p, 3p, 4p, ...; the p itself should not be marked).
    - Find the first number greater than p in the list that is not marked. If there was no such number, stop. Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.
    - When the algorithm terminates, the numbers remaining not marked in the list are all the primes below n.

  Implement the sieve to find the first `n` prime numbers.
