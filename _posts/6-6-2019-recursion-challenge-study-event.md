---
layout: post
title:  "recursion challenge for study event"
date:   2019-06-06 09:10:41 +1100
categories: worksheets
---

Recursion:

Create a function which will check whether a given string contains an input substring, with the following type signature:
```haskell 
containsSubString :: String -> String -> Bool
```


A double linked list is one which is not defined from left to right or right to left; Every element except for the first and the last is connected to both the element previous and next in the list.  Create a recursive data type to define this structure:
```haskell
data doubleLinkedList a
```
Now that you have defined this data type, you need to use it!  Finish these function definitions with 
```haskell
addElem:: a -> doubleLinkedList a -> doubleLinkedList a
removeElem :: a -> doubleLinkedList a -> doubleLinkedList a
```
