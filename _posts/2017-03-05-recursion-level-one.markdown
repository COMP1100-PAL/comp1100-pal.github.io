---
layout: post
title:  "Recursion Level One"
date:   2017-03-05 11:25:29 +1100
categories: worksheets recursion wk3
---
## What are lists?
A list is a collection of elements that are all the same type. You can add or remove elements of the list, as well as change its order.
You can only (easily) take out the first element, due to how it is defined in Haskell.

FUN FACT!!! Strings are actually lists of chars!

## Examples of Lists and Functions We Use on Them

```haskell
head :: [a] -> a

head [1,2,3] = 1
-- This gives us the first element of the list

tail :: [a] -> [a]

tail [1,2,3] = [2,3]
-- This gives us all but the first element of the list

++ :: [a] -> [a]
"Tiggy" ++ " Senpai" = "Tiggy Senpai"
-- This "concatenates" two Lists

```

## Time to Write Your Own List Functions
#### ☆: .｡. o(≧▽≦)o .｡.:☆

1. Write a function that finds the length of a list.
2. Write  a function that finds the sum of a list (hint: will you need to be specific as to what's in your list? (╯°□°）╯︵ ┻━┻ )
3. Write a function that squares each number of the list
