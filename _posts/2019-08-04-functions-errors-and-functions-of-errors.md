---
layout: post
title:  "Functions, Errors and the Functions of Errors"
date:   2019-08-05 09:10:41 +1100
categories: worksheets
---

# Functions, Errors and the Functions of Errors

## Functions
Everything in Haskell relies on functions - it is a functional programming language after all! So we are going to this session examining how they work and how to get them to work for you.

In lectures, you approached haskells functions from a very mathematical perspective: sets, relations, functions, composition, domains... This background is very imporant and useful, but not very applicable when writing Haskell. So let's look at a function in Haskell:

```haskell
multiply :: Double -> Double -> Double
multiply input1 input2 = input1 * input2
```

This function simply multiplies its two inputs, e.g ```multiply 2 3 = 6```. Let's break it down:
- ```multiply```: Name of the function
- ```::```: Haskell syntax to say that this is a type signature.
- ```Double -> Double -> Double```: Type of the function; takes in two ```Double```s and returns a ```Double```.
- ```input1```: First input, corresponding to the first ```Double``` in the type.
- ```input2```: Second input, corresponding to the second ```Double``` in the type.
- ```=```: Haskell syntax to say that this is a function definition.
- ```input1 * input2*```: Definition of the function that outlines what it does and how it computes it.

As you can see, there is a lot that goes into each function. It may seem complex at the moment, but it all makes Haskell easier to write: Haskell requires you to follow this guideline so you always know what is needed and what you need to do.

We can write a general abstract function to represent all functions:
```haskell
func :: Type A -> Type B -> Type C
func par1 par 2 = <DEFINITION>
```
Can you identify what each part is based on the example above?


## Exercise 1: Fill in Blanks
Here we have a list of functions with blanks. The answers are at the bottom - see if you can find where each one goes. Note: There are 4 extra answers - together these will make a new function!

```haskell
add :: Double -> Double -> Double
add x y = _______
```
```haskell
printHello :: _______________
print name = "Hello " ++ name
```
```haskell
________ :: Double -> Double
________ me = 2*me
```
```haskell
cubed :: Double -> Double
cubed input = _____**3
```
```haskell
root :: ________
root x = sqrt(x)
```
Answers: ```Double -> Double```, ```equal```, ```String -> String```, ```input```, ```a  b```, ```x + y```, ```doubleMe```, ```Double -> Double -> Bool```, ```a == b```

## Errors
When working with Haskell, you will encounter all kinds of weird and wonderful errors. Being able to read and understand these errors is essential to be able to debug and fix your program. Identify the error you would get from the following functions:
```haskell
funcA :: Int -> String -> Int
funcA x y = x + y 
```
```haskell
funcB :: Int -> Integer -> Int
funcB x y = x + y
```
```haskell
    funcC :: Int -> Int
funcC x = x * y
    where 
  y :: Int
  y = 2
```
```haskell
FuncD :: Int -> Int
FuncD x = x + x
```


## Functions Types and Composition
We have already seen quite a few type signatures, e.g ```Double -> Double -> Double```. But we are yet to introduce one of the most interesting things we can do with types: giving functions as inputs or outputs. When we bracket types, e.g ```(A - > B)```, this becomes one type itself: a type for a function that has a type of ```A -> B```. So if we put brackets in our type signatures, then we can write functions that take in or output functions.

Let's look at an example:
```haskell
id :: (A - > B) -> (A -> B)
id f = f
```
This function does nothing - it takes in an input and returns it the exact same. However, now the input is a function! More specifically, it is a function of type ```A -> B```. This may seem confusing - how can functions be inputs!?! - but hopefully the below exercises will help ypu get a good grasp of it.

## Exercise 2: Mix and Match
Below are two lists: one has function definitions and one has function types. Can you match them up?

| Function Definition              | Function Types                               |
| -----------------                | -------                                      |
| ```compose f g = f . g```    | ```(A,C) -> (A -> B) -> (C -> D) -> (B, D)``` |
| ```applyTwice f x = f(f(x))```   | ```(A -> B) -> A -> B```                     |
| ```tupleApplication (x,y) f g``` | ```(B -> C) -> (A -> B) -> (A -> C)```         |
     

## Exercise 3: Functional Composition
Final activity! Using only the functions you have seen so far, you need to write the following functions - that is when completing the functions, you can't use anything other than the functions names above. See what you can do!

```haskell
mutliplyBy4 :: Double -> Double
multiplyBy4 a = ________________
```
```haskell
squareAndCube :: (Double -> Double) -> (Double -> Double)
squareAndCube (x,y) = _______
```
```haskell
addingCubeAndRoot :: Double -> Double
addingCubeAndRoot input = ___________
```
That is all for the week! Hopefully it was helpful!
