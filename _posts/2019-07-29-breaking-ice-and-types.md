---
layout: post
title:  "breaking Ice and types"
date:   2019-07-29 09:10:41 +1100
categories: worksheets
---

# Breaking Ice and Types

## What is comptuer science?
Computer science is a very broad area, encompassing lots of different topics and technologies. With its incredible expansion over the past decades, you have very probably been exposed to it in many different ways and in many different environments. Together in a group, create a mind map of all the aspects of computer science that you know of. It doesn't matter if you understand it or can explain it - add everything!

## Types
Types are incredibly important in Haskell (it is in fact statically typed! [can anyone tell the group what this means?]) so we are going to practice identifying them! The table below has two columns: one with instances/examples and the other with types. You may not know them all, some haven't been seen in lectures nor labs yet, so feel free to ask your peers and/or the mentors for help!

Your job is to match each example with the correct type:

| Instances/Examples | Types   |
| -----------------  | ------- |
| `3.14`               | Int     |
| `'π'`                | String  |
| `"pi"`               | List [Char]   |
| `3`                  | Tuple (Double, Int)  |
| `(3,4)`              | Char    |
| `True`               | Integer |
| `[1,2,3]`            | Bool    |
| `99999999999999`     | Double  |
| `False`              | Tuple (Int, Int) |
| `(4.56, 123)`        | List [Int] |
| `['h', 'e', 'l', 'l', 'o']`

## Errors
As Haskell has a strong type system, it can identify when you have the wrong types. This results in errors like the following:
```
Couldn't match expected type `Double' with expected type 'String'
```
Initially, this may be incredibly annoying - especially when you first compile your code and get lots of these errors! However, really it is very helpful. Not only does it tell you where and what the error is, it even tells you exactly what type Haskell was expecting (here it expects a String) and also the type you are giving it (here a Double). This makes debugging it a lot easier - you just need to match type you are giving it with the type it expects or maybe change the function you are inputting your data into.

For example, if we try to write:
```
1 + "one"
```
Haskell will print:
```
Couldn't match expected type `String' with expected type 'Int'
```
This tells us that the ```+``` function expects a ```Int``` type when we are giving it a ```String``` (the "one"). 

Your job is to predict what the error will be from this line of code and to fix it in anyway you please:
```haskell
addTwo :: Int -> Int
addTwo num = num + "2"
```
