---
layout: post
title:  "Buggy Code"
date:   2017-03-28 11:25:29 +1100
categories: worksheets debugging
---

# Prelude
_To debug, or not to debug: that is the question:
wheher 'tis nobler in the code to suffer 
The types and constructors of outrageous programming,
Or to take arms against a sea of errors,
and by debugging end them.
-Tony "Shakespeare" Hosking._

Do not be afraid of error messages, they are your friend! Understanding what Haskell errors mean will make you a programming ace in no time.

#### Type Errors
Haskell is a strongly typed language. Consider the code below:

```
func :: Integer -> Integer
func x = "groovy, man!"
```

The compiler gives me the following type error.

```
buggy.hs:2:10: error:
    • Couldn't match expected type ‘Integer’ with actual type ‘[Char]’
    • In the expression: "groovy, man!"
      In an equation for ‘func’: func x = "groovy, man!"
```

This message is telling me there is an error at line 2, character number 10. I have told Haskell in my type signature that I will be outputting an `Integer`, when in fact I have output in my function definition a string (list of characters)! So Haskell _expected_ my type to be an `Integer`, but I have not _met_ those expectations.


### Out of Scope Errors
Out of scope errors occur when I define things that Haskell doesn't understand. For example, consider my attempt to use the prelude function `sum`, which adds all the values of a list:

```
>>summ [1,2,3]
error:
    • Variable not in scope: summ :: [Integer] -> t
    • Perhaps you meant ‘sum’ (imported from Prelude)
```
This tells us that `summ` is not 'in scope', and gives us a suggestion to use `sum` instead. Neat!

### Parse errors
Parse errors are more difficult to diagnose. They commonly occur when you use the incorrect syntax for the situation you are in. Take for example the following code and its error message.

```
abs :: Integer -> Integer
abs x
	| x >= 0 -> x
	| x < 0 -> -x
	
buggy.hs:3:18: error: parse error on input ‘->’
```
Clearly, I have used the arrow syntax for case statements in a guard statement, which is a major Haskell _faux pas_. I receive a parce error. It can easily be fixed by changing `->` to `=`.

#### Multiple Declarations
Multiple declaration errors occur when I call two different things the same name. Take this code for example:
```
turtle :: Int -> Int
turtle x = x + 1

turtle :: String -> String
turtle word = "turtle"
```
I receive the error
```
buggy.hs:5:1: error:
    Multiple declarations of ‘turtle’
    Declared at: buggy.hs:2:1
                 buggy.hs:5:1
```
Clearly, I have to rename my function names to something different.

#### Warnings: Non-Exhaustive Cases
Warnings are not errors, and your code will not fail to compile. However, Haskell will tell you possible areas where your code may fail. Take for example the following code:

```
data Tree = Oak | Pine | Willow

pricing :: Tree -> Integer
pricing x = case x of
 Oak -> 10
 Pine -> 20
 ```
I obtain the warning:
```
Warning: Non-exhaustive patterns in case
```

Clearly, I have missed the case statement for `Willow`. My code still compiles, but lets see what happens when I run `pricing Willow`:
```
*** Exception: buggy.hs:(5,13)-(7,11): Non-exhaustive patterns in case
```
Uh-oh, should of listened to that warning!

Here's a handy table to refer back to.
|                                                                  Type Error                                                                  |                                     Out of Scope Error                                    |                                                      Parse Error                                                      |                            Multiple Declarations Error                            |                                                          Non-Exhaustive Cases                                                         |
|:--------------------------------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------:|
| You're type signature inputs and outputs are different than your functional definition inputs and outputs. Check the types in your function! | You are trying to use a function which does not exist. Make sure you check your spelling! | You have misused syntax. Look for arrows in guard statements, equals signs in case statements, and hanging brackets! | You have defined the same function or data type twice. Change one of their names! | You have not considered all the possibilities in your function. Look back at your data type to make sure you haven't missed anything! |

### Debugging the code!
All these pieces of code have errors in them. Debug them, and identify the type of error!
 ### 1)
 ```
 -- Describes a person's head size
 headSize :: Integer -> Integer
 headSize circ
    | circ <= 19.5 == "You must be tiny!"
    | circ <= 25.0 ""Normal"", or so they say..."
    |circ <= 30.0 == "Above average, but that's fine"
    | otherwise == "Brainiac!"
```
### 2)
```
Data choices = First String | Second | Third | Fourth
whichChoice ch =
case ch of
first _ -> "First!"
second -> " Second!"
_ -> "Something else :("
```
### 3)
```
lastNite :: String -> String
lastNite word = word + 1
```
### 4)
```
tupleTroubleOne :: (a,b) -> (c,d) -> ((a,b),(c,d))
tupleTroubleOne (x,y) (w,z) = ((x,w),(y,z))
```
### 5)
```
tupleTroubleTwo :: (Int,String) -> Int
tupleTroubleTwo a b
    | a == b = a
    | otherwise = b
```
### 6)
```
upAnddown :: Int -> Int
upAndDown x = case (upAnddown x) of
    1 -> 1
    _ -> upAnddown x
        where upAnddown x = x-1
```
### 7)

```
fac :: Int -> Int -> Int
fac x y = case x of
    0 ->
        | y == 0 = 0
        | otherwise = fac (x-1) fac y
    _ -> fac (x-1) y
```
### 8)
```
getFirstAndDouble :: (Num a) => [a] -> a
getFirstAndDouble x:xs = head xs
```
