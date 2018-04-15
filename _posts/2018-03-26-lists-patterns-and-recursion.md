---
layout: post
title:  "Lists and Patterns"
date:   2018-03-26
categories: week 6, comp1100
---

Today we'll be looking at lists, and practice recursing through them.

1. What is a list?
2. What's the difference between a list and a tuple? What's the difference between a list and a mathematical set?
3. How does a list of Integers look in a type signature? How about a list of Strings?
4. have a go at representing a list using yourself and your fellow PAL's, let someone be the start of the list and use your hands to point to whos next. How do I know who the first is? How about who's 2nd and 3rd?

---------------------------------------------

A list `[a,b,c,d]` is also representable as `a:b:c:d:[]`
The ':' colon denotes concatenation, which means that the above representation literally means "a concatenated with b, concatenated with c, concatenated with d, concated with an empty list".

We can use this notation to work with a list. For example, the above list can be pattern matched against the form 'x:xs', where 'x' is the first item in the list, and 'xs' is every other item in the form `a:b:c:d:[]`.

For example, the function below uses pattern matching to do something. In your groups figure out what they do:

```haskell
function :: [Integer] -> Integer
function ourList = case ourList of
    x:xs -> x
    _    -> error "the list is empty"
```
How about this one?
```haskell
function : [Integer] -> Integer
function ourList = case ourList of
    x:y:xs -> y
    _      -> error "The list is not long enough for this!"
```


# More pattern matching on lists
Write functions that satisfy the following specs using pattern matching (using case expressons):
 1. A function that takes a list as input and returns the 2nd element only
 2. A function that returns true if the list is of length 1 and false otherwise
 3. A function that returns true if the list is empty and false otherwise
 4. A function that takes a list of tuples of the form [(String, String)] and returns the first elements concatenated together
 5. A funciton that returns the last element in the list (You'll need to use recursion for this one!), How about the last 2 elements in a list?
 
# Recursion over lists
Write functions that satisfy the following specs using recursion (you can use cases or guards)
 1. Counts how many elements are in a list of Integers
 2. Finds the sum of all elements of a list of Integers
 3. Finds the average of elements of a list of Integers
 3. Returns true if all elements in a list are monotonically increasing (Integers or Floats, doesn't matter)
 4. Combines two lists (Don't use ++ use : )
 5. Reverses a list
