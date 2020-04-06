---
layout: post
title:  "Polymorphism"
date:   2020-03-30 08:00:00 +1100
categories: worksheets
---

## Type and Polymorphism

We have seen many types in Haskell: ```Int```, ```Bool```, ```Char```, ```[Char]``` (also called ```String```) and more. Hopefully you have become very comfortable with them over time, using them in your functions and to interpret your output.

Recently, we were also introduced to _**Polmorphic**_ types. To define a polymorphic type, we use type variables to introduce an unconstrained type. Some simple examples are: ```a``` which is any type and ```[a]``` which is a list of any type. Even though the second example is a list, it is still polymorphic as it has a type variable.


## Question 1: Identifying Recursion

We have a list of types and a list of instances. For each type, say whether it is polymorphic and if it is not, link it its instance.

Types:
```haskell
[a]    Maybe a    Bool    String    (Bool, b)    a    Maybe Int    Double    Char    Int    (String, Char)
```

Instances:
```haskell
1    "True"    ("1", '1')    1.0    '1'    True    Just 1
```

## Why We Need Polymorphism

Let’s start off with an example. If you were asked to write a function to extract the last element of a list of ```Int``` your code would most likely be something like:

```haskell
lastElement :: [Int] —> Int
lastElement ls = case ls of
    []  -> error "No Last Element"
    [x] -> x
    _   -> lastElement (tail ls)
```

But let’s say we have a list of ```Bool``` and we want to extract the last element of that list. If we try inputting the list ```[True,False, True]``` into the above function, Haskell will throw the following error:

```haskell 
  * Couldn't match expected type `Int' with actual type `Bool'
    * In the expression: True
      In the first argument of `lastElement', namely
        `[True, False, True]'
      In the expression: lastElement [True, False, True]
```

In order to avoid the above error, we would need to define another function that would extract the last element from a list of Booleans. So:

```haskell
lastElementBool :: [Bool] —> Bool
lastElementBool ls = case ls of
    []  -> error "No Last Element"
    [x] -> x
    _   -> lastElementBool (tail ls)
```

But notice this: ```lastElementInt``` and ```lastElementBool``` are identical except for their type signatures. This would also happen if we wrote ```lastElementString``` or the last element function for any other type. This is dumb: it be annoying and a waste of time to code multiple functions for the same purpose. Wouldn't it much easier if we could write one function that could be used for all data types...

This is where _**polymorphism**_ comes into play!! 
 
Polymorphism allows us to write a generalized function for numerous different input types. We simply use the constrained types in the type signature. For example:

```haskell
lastElementPolymorphic :: [a] -> a
lastElementPolymorphic ls = case ls of
    []  -> error "No Last Element"
    [x] -> x
    _   -> lastElementBool (tail ls)
```

This function can be applied to all types that match the structure of  ```[a]```, i.e any list! Substituting specific types for polymorphic types is all we need to do to define a polymorphic function!

There is issue with polymorphic functions: you don't know what types it will applied to and so you can only use functions that could apply to any type. This means some functions can't be made polymoprhic. For example:

```haskell
impossiblePolymorphic :: String -> String
impossiblePolymorphic str = toUpper (head str) : tail str
```

This function can't be made polymorphic as it relies on the function ```toUpper``` which can only be applied to ```Char```.

At the moment this limitation is quite prohibiting: there are very few functions that can be applied to all types. However, we can get around this. In the type signature, we can specify that certain functions can be applied. Some common examples are ```==``` or ```Show```. This is done like so:

```haskell
polymorphicEquality :: (Eq a) => a -> a -> String
polymorphicEquality x y = case x == y of
    True    -> "They are equal."
    False   -> "They are not equal."
```

```haskell
polymorphicShow :: (Show a) => a -> String
polymorphicShow a = "The input is: " ++ show a
```

So we add ```(Typeclass a) =>``` to impose that this function can only be applied to types that belong to ```Typeclass```. There are many typeclasses: we just saw ```Eq``` and ```Show``` but other common typeclasses are ```Num``` (for doing arithmetic) and ```Ord``` (when an ordering is required - this is a superclass of ```Eq```).

Here are some examples of polymorphic functions:

```haskell
greatestOfThree :: (Ord a) => a -> a -> a -> a
greatestOfThree x y z
    | x >= y && x >= z  = x
    | y >= x && y >= z  = y
    | otherwise         = z
```

```haskell
generateSuccessor :: (Enum a) => a -> Int -> [a]
generateSuccessor x i = helper [x] i
    where
        helper :: (Enum a) => [a] -> Int -> [a]
        helper ls i
            | i == 0    = ls
            | i > 0     = helper (ls ++ [succ (last ls)]) (i-1)
            | otherwise = error "Input is negative"
```


## Question 2: Applying Polymorphic Functions

We will now take a look at some examples of useful polymorphic functions. For each of the functions, see if you can work out what they do:

```haskell
polymorph0 :: [a] -> a
polymorph0 (x:xs) = x
```

```haskell
polymorphi1 :: a -> b -> (a,b)
polymorph1 elem1 elem2 = (elem1, elem2)
```

```haskell
polymorph2 :: (Eq a) => [a] -> a -> Int
polymorph2 lst elem = case lst of 
    [] -> 0
    _
        | head lst == elem -> 1 + polymorph (tail lst) elem
        | otherwise -> polymorph (tail lst) elem
```

```haskell
polymorph3 :: [a] -> [b] -> [(a,b)]
polymorph3 lst1 lst2 
    | lst1 == [] || lst2 == [] = []
    | otherwise = [(head lst1, head lst2)] ++ polymorph3 (tail lst1) (tail lst2)
```

```haskell
polymorph4 :: (Num a) => a -> a -> a
polymorph4 x n
    | n =< 1 = 0
    | otherwise = x + polymorph4 x (n-1)
```

We also have the following list of 5 inputs and outputs:

Inputs:
```haskell
20  "Green"
[True, True, False]  True
2  3
"Turtle"
['x','y','z']  [1, 2, 3]
```

Outputs:
```haskell
"T"
[('x', 1), ('y',2), ('z', 3)]
6
(20, "Green")
2
```

Each output can be produced by applying one of the polymorphic functions above to one of the inputs. For example:

For example:
```haskell
polymorph0 "Turtle" = "T"
```

Can you work out the remaining 4?


## Question 3: Turning Functions Polymorphic

We have seen many haskell functions so far, but until now none have been polymorphic. Let's fix this situation! Take these list functions you and make them polymorphic:

```haskell
reverse :: [String] -> [String]  
reverse ls = case ls of  
    []      -> []  
    x:xs    -> last ls : reverse (init ls)
```

```haskell
length :: [Bool] -> Int
length []   = 0
length x:xs = 1 + (length xs)
```

```haskell
elementRepetition :: Int -> String -> [String]  
elementRepetition i s
    | i == 0    = []
    | i > 0     = s : (elementRepetition (i-1) s)
    | otherwise = error "Input is negative"
```


## Question 4: Your Own Polymorphic Functions

Now it is time for you to write your own polymorphic functions! Try write a function ```isPallindrome``` that detects if a list if a pallindrome - the same forwards and backwards.

Here are some examples to test against:

```haskell
isPallindrome "racecar" = True
isPallindrome [1,2,3,3,2,1] = True

isPallindrome "not a tonne" = False
isPallindrome [Just True, Nothing, Nothing] = False
```

(Hint: use the function ```reverse``` that flips a list).
