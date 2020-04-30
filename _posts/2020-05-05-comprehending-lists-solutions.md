---
title: "Comprehending Lists Solutions"
date: "2020-05-05 9:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---

__**NOTE**__: This is an extension worksheet: List comprehensions are not assessed in COMP1100/1130. The content here is not mandatory.

That said, list comprehensions are very useful tools in Haskell and they can be applied to many problems (including assignments and labs). We highly recommend you take a look at them.

## Questions: Writing List Comprehensions

For all the following questions, the answers have been provided with and without list comprehensions. This will allow you to understand both approaches and also identify when it is best to use list comprehensions.

1) We have the list ```[0,2..]```. We want the lists ```[0,-2,-4,-6,-8,-10]```. How can we do this?

> __Answer__:

```haskell
standardOutput = map (*(-1)) (filter (<11) [0,2..])

listComprehensionOutput = [ -x | x <- [0,2..], x < 11 ]
```

2) We have the function ```isVowel :: Char -> Bool``` and ```toUpperCase```. Given ```alphabet = take 26 ['a'..] = ['a','b','c',...,'x','y','z']```, produce the list of upper case consonants (not vowels).

> __Answer__:

```haskell
standardOutput = filter (isNotVowel) (map toUpper alphabet)
  where
    isNotVowel x = not (isVowel x)

listComprehensionOutput = [toUpper x | x <- alphabet, not (isVowel x) ]
```

Recall that ```not :: Bool -> Bool``` flips booleans, i.e. ```not True = False``` and ```not False = True```.

3) Let's produce the triangular numbers:

![Triangular Numbers](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/_posts/2020-05-05-triangular-numbers.png)

The equation for the ```n```th triangular number is ```T(n) = n(n+1)/2```. However, we challenge you to create a function that generates the triangular numbers from ```1``` to ```n```. For example:

```haskell
func 4 = [1,3,6,10]
```

> __Answer__:

```haskell
triangularNumber n = n*(n+1)/2

standardOutput n = map triangularNumber [1..n]

listComprehensionOutput n = [triangularNumber x | x <- [1..n] ]
```

## Questions: Putting It All Together

Let's attempt some more questions now! As before, we provide answers both using and not using list comprehensions.

Note: these questions can be quite difficult. We suggest you give them a good attempt before looking at the answers, but don't worry if you don't get them immediately.

1) a. Generate a list of all the squares on a chess board. (Board notation: the rows are identified by the letters `A` to `H`, and the columns by the numbers 1 to 8. With this each cell is uniquely identified as 'A1', 'A2' and so on...)

> __Answer__:

```haskell
standardOutput = map (generate ['A'..'H']) [1..8]
  where
    generate :: [a] -> b -> [(a,b)]
    generate list value = case list of
      [] -> []
      x:xs -> (x,value) : generate xs value

listComprehensionOutput = [ (x,y) | y <- ['A'..'H'],x<- [1..8] ]
```

1) b. Do you recall **gridList**, which was an extension question mentioned in the [week 5 lab](https://cs.anu.edu.au/courses/comp1100/labs/05/)? It is a very similar problem to the above chess board problem. We can use list comprehensions to produce ```gridList``` in a single line of code (try work it out yourself)!

2) Write a function that takes two lists and outputs a list of common elements in two lists, i.e. the intersection of two sets. For example: ```intersect [1,2,3] [1,4,5] = [1]```.

> __Answer__:

```haskell
standardIntersect xs ys = filter ( (flip elem) xs) ys

listComprehensionIntersect xs ys = [x | x <- xs, elem x ys]
```

3) Let's move on to a slightly harder question. Try to generate a list of all the Pythagorean triples, i.e. triples of three numbers, ```a,b,c```, that satisfy the equation ```a^2 + b^2 == c^2```. Assume that the side lengths are less than ```15```.

> __Answer__:

```haskell
listComprehensionOutput = [(a,b,c)| a <- [1..15], b <- [1..15] , c <- [1..15] , a^2 + b^2 == c^2, a <= b ]


-- BEGIN STANDARD OUTPUT FORMATION:

--- Generates a list of tuples from a list and a single element
generateTwo :: [a] -> b -> [(a,b)]
generateTwo list value = case list of
  [] -> []
  x:xs -> (x,value) : generate xs value

-- Generate a list of triples from a list of tuples and a single element
generateThree :: [(a,a)] -> a -> [(a,a,a)]
generateThree list value = case list of
  [] -> []
  x:xs -> ((fst x), (snd x), value) : generateThree xs value

-- Generates Cartesian product of [1..n] x [1..n]
tupCreate:: Int -> [(Int,Int)]
tupCreate n = concatMap (generate [1..n]) [1..n]

-- Generates Cartesian product of [1..n] x [1..n] x [1..n]
generateCombined:: Int -> [(Int,Int,Int)]
generateCombined n = generateThree (tupCreate n) n

--- The predicate for whether the Pythagorean condition is satisfied
pythagoreanTest :: (Int, Int, Int)  -> Bool
pythagoreanTest (a,b,c) = (a^2 + b^2) == (c^2)

--- Finally putting it all together
pythagoreanTriples :: Int -> [(Int , Int , Int)]
pythagoreanTriples n = filter pythagoreanTest (generateCombined n)
```

**CRIKEY!!!** From this we can see how it is so much easier to use list comprehensions to generate combinations and/or sequences.

4) Write a function that generates the list of divisors:

> __Answer__:

```haskell
standardOutput n = filter (helper) [1..n]
  where
    helper x = n `mod` x == 0

listComprehensionOutput n = [d | d <- [1..n], (n `mod` d) == 0]
```

Though both are fairly similar, this question hopefully shows why list comprehensions are generally better. List comprehensions allow you to write functions much more elegantly and simply. In this question specifically, we could write a formula with the variable, instead of having to define a helper function.
