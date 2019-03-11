---
layout: post
title:  "how to put together lots of little bits of infomation"
date:   2019-03-12 11:01:41 +1100
categories: worksheets wk2
---

# Haskell Notation and Symbols: What Are They? What Do They Even Do?? Let's Find Out! (feat. alliteration)

## Super Special Assorted Symbols 
A lot of computer science, especially the programming part, uses a lot of symbols. For example:
```
func :: Type -> Type -> Type
func x y = _________________
```
With so many different symbols and notations sitting around, let's consolidate our knowledge. Try make a mind map using examples and the symbols that compose them.

## So This Symbol Signifies
Now we have uncovered what symbols can be known, let's note what they mean! Manafacture a menu of meanings for your mindmap's symbols. (Define the symbols found in your mind map... we aren't good at alliteration).

## Devious Doctors
Look at these statements; currently they are totally detached. Your task, as type doctor, is to connect each sentence to a type.

Note:
```
data Pal = Edmund | Jay | Cameron | Cassy | Razi | Yichen 
```

1. Identify the problems with the following declaration
```
maybe Integer = Just Int | Nothing
```
2. What is the type of these statements?
```
(4 + 6)
(2*)
'p'
'p' : "als"
Edmund
```

3. What is the differences between these symbols?
```
:: vs :
++ vs +
type vs data
```

With your great skill, you have graduated from type doctor to function doctor! Take this function and disect it:
1. Circle the function name
2. underline the type signature
3. Circle the function body
4. underline the function parameters
5. Discuss in your groups what all these terms mean
6. what would be a better name for this function
```
simple_function :: Float -> Float -> Float
simple_function x y = sqrt ((x - 0.0)**2 + (y - 0.0)**2)
```

## Stealthy and Sneaky Functions
These functions are stealthy and sneky; parts of these are out of sight! Fill in the blanks:
```
it_double :: ___ -> ___
it_double ___ = ___ + ___

_______ :: ____ -> ____
_______ ___ = "hello there, " ++ name
```
Now that you have found these fun and fruity functions, have a go writing the following functions:
1. square an Integer
2. return True if two Bools are equal 
3. find the distance between two points in 2D space
