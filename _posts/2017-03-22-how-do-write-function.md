---
layout: post
title:  "How do I write a function?"
date:   2017-03-20 11:25:29 +1100
categories: worksheets studyevent
---

# How do I write a function?
!["ALT TEXT"](https://imgs.xkcd.com/comics/haskell.png "Spooderman")

Hello fellow confused individuals. Tonight you will grow out of being younglings and become PALawans. What is a function? How do I write one? What are the options available to me? If you can ask yourself these questions and not be able to answer them then you're in the right place.

## Brief recap

The actual syntax of writing a Haskell function may seem confusing to you but don't worry, thats what you're here for. Take a look at this function here, which just doubles its input.

```haskell
doubleInt :: Int -> Int
doubleInt x = x * 2
```
This simple function encapsulates a whole lot of weird and confusing syntax so lets cover that now and get that out of the way, then we will move on to more interesting features of writing functions. Lets break it down:

```haskell
doubleInt     -- This is the name of the function

:: Int -> Int -- This is the 'Type signature', this one says:
              -- "I am a function that takes one Int as in input,
              -- and I return one Int as output"

doubleInt x = -- This is the input, I call my input "x".
              -- I could have called it anything I liked,
              -- but just "x" is simple.

x * 2         -- This is the "body" of the function,
              -- its what your function returns
```

It's actually a bit more nuanced than this but we'll get to that. For now, try these out for size:

### Write _Type Signatures_ for the following specifications
1. Write a signature for the function that adds two floats
2. Write a signature for the function that multiplies two doubles
3. Write a signature for the function that calculates the triangle inequality
4. Write a signature for the function that determines if two booleans in a tuple are the same
5. Write a signature for the function that reverses a list

### Now for the functions you wrote type signatures for, give them meaningful names.

### Write an input for those functions, give meaningful names to the inputs.

## Interlude: split definitions
A function can actually make a choice on what to return depending what the input actually is. We call this a "split definition". Take a look at this example to see what I mean:

```haskell
doubleIntHalf10 :: Int -> Int    -- Type signature
doubleIntHalf10 10 = 10 `div` 2  -- Input and body
doubleIntHalf10 x = x * 2        -- Input and body again????
```
The line
```haskell
doubleIntHalf10 10 = 10 `div` 2
```

Is a very specific case that will run when the input is 10 and only 10. As opposed to:

```haskell
doubleIntHalf10 x = x * 2
```

Is a very general case that will run for every other input that is not one of the other definitions.

### Write type signatures and function inputs using a split definition style for the following function specifications, you do not have to write the body.
1. Write a split definition for the function that adds 2 to 0 but subtracts 2 from everything else.
2. Write a split definition for the function that returns true when the input is true, and false when the input is false.
3. Write a split definition for a function that returns the first element of a list
4. Write a split definition for the function that returns true when a number is even and false when it is odd.

__Remember to give meaningful names to these functions.__

You can see how writing that last function with a split definition is in fact impossible. It might serve you well to write all your functions without a split definition at all.

## Back on track, more basics
Ok so now we're gonna consolidate our knowledge. Lets play a game of match the type signature to the function. Then try to give that combination a meaningful name and meaningful input names if they need it.

```haskell
-- Signatures
Int -> Int -> Int

String -> String

Integer -> Bool

Bool -> Bool -> Bool

-- Function inputs plus body
me = "Hello " ++ me

interesting = isEven interesting

angry react = angry == react

num_1 num_2 = num_1 + num_2
```

## Putting it all together
Lets spend some time just writing functions and type signatures.

1. Write a function that multiplies two integers together.

2. Write a function that takes an integer and an integer and returns true if the first is greater than the second and false otherwise.

3. Write a function that calculates the area of an equilateral (all sides are the same length) triangle, given the length of its sides.

4. Write a function which outputs the message "I am big" if its input value is greater than 100, or "I am small" otherwise.

5. Write a function which outputs the letter "N" if its input is 90, "S" if its input is 270, "E" if its input is 0 or 360, and "W" if its input is 180. If the input doesn't match any of those numbers then it should output "Incorrect input".

6. Create a data type called Always_Yes that only has one possible value of Yes. Then write a function that always returns Yes

7. Create a data type that has three possible values: Yes, No or Maybe. Create a function closeEnough which takes two integers, and if the first number matches the second number it should have an output of Yes. Otherwise if it doesn’t match that number it has an output of No. If it’s close by (you decide how close!), output Maybe.

8. Write a haskell function to calculate the Pythagoras theorem.

9. Write a type profile for the following haskell functions:

    a. test a b c = a + b + c
    b. fun r = 4.0 * pi * r^2

10. For Q9b, what would occur if the type profile was different?

11. Write a halve-it- down function, which takes in a Float and produces and output of its half. Note: If the function profile were given as (or were forced to be) an integer input, what could go wrong?

## Polymorphic type signatures (BEWARE COMP1130 content ahead)
A lot of these functions will have a concrete type signature meaning that the types of the inputs will not change, but there exists a lot of situations where an application of a particular operation makes sense  to work on a wide range of types. In programming and computer science in general it is best to make your functions as general as possible. Take for example this function which adds two Ints.

```haskell
add :: Int -> Int -> Int
add x y = x + y
```

Why are restricting ourselves to just one type of number? It makes perfect sense to add two floats or doubles. We can introduce a __type parameter__ to make our type signatures more generic. Here is the add function again but made as general as possible.

```haskell
add :: (Num a) => a -> a -> a
add x y = x + y
```

Don't be scared by the ``` (Num a) => ``` notation, it just means that every time the type parameter 'a' shows up in the type signature it has to belong to the ``Num`` __type class__. A type class is just a collection of types which are related to each other. Which is perfect for making our functions more general. A list of useful Type classes are listed below:

!["YESH BOI TYPE CLASSES"](https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Classes.svg/480px-Classes.svg.png "Typeclasses fam")

### Write the functions from before but try to make the type signatures as general as possible

# CONGRATS
You did everything! Go to a different room or stick around and help others.
