# PAL Week 5

# I'm angry, angry about elves

## What is recursion
Recursion is one way how we can repeat statements in programming, in fact, it is the only way to repeat statements haskell. Functions are everywhere in Haskell, when you call the same function within itself you're performing recursion! This session we will explore the properties of recursion and how to create your own recursive functions.

### First off - How do we visualise recursion?
We like to perform something called a __trace__ to explicitly step through the program as it executes. See how in the example we just keep applying the function over and over until it tells us to stop.
```haskell
-- Returns the factorial of a positive number (piecewise style)
factorial :: Integer -> Integer
factorial n = n * factorial (n - 1)
factorial 0 = 1

--Returns the factorial of a positive number (guard style)
factorial :: Integer -> Integer
factorial n 
    | n > 0 = n * factorial (n-1)
    | otherwise = 1

--Returns the factorial of a positive number (case style)
factorial :: Integer -> Integer
factorial n = case n of
    0 -> 1
    _ -> n * factorial (n - 1)
    
-- there is no functional difference between all these functions, they are indentical in their outputs, they are just a refresher on guarded vs patternmatched decision making in haskell
-- Now the trace:

-- evaluate: factorial 4
factorial 4 
= 4 * factorial (4 - 1)
= 4 * 3 * factorial (3 - 1)
= 4 * 3 * 2 * factorial (2 - 1)
= 4 * 3 * 2 * 1 * factorial (1 - 1)
= 4 * 3 * 2 * 1 * 1

= 24
```

Question 1.
a) Write a recursive function called `sum`, which takes in an integer and sums all the numbers up to that numbers together. E.g.,

``sum 4 >> 10``

b) Does your function have a base case? What would happen if your function did not have a base case? Is your function primitive recursive? Why/why not?

Question 2.
Is the following function primitive recursive?

``gnu :: Integer -> String``
``gnu x = gnu (i-1) ++ "is" ++ "not" ++ "linux" ``

Question 3.
a) Define a data type called Direction, which consists of the direction North, East, South and West.
b) Write a function called Turn, which inputs an integer `n` and a Direction, and outputs the new direction after turning clockwise 90 degrees `n` times.

E.g.,
``Turn 3 North >> West``

Question 4.
Write a function which inputs a tuple of integers, and outputs their product. However, you are not allowed to use `*`! For example:

``multiply (3,4) >> 12``

Question 5.
Write a function that determines whether an Integer input is even or odd that uses recursion.

Question 6.
Write a function called `digits` which determines the number of digits in an integer. For example:
``digits 14324 >> 5``


Question 7.
a) Write a function that takes an Integer input and calculates the Fibonacci number corresponding to the input.
Remember,
`Fib 0 = 0`
`Fib 1 = 1`
`Fib n = the sum of the previous two Fibonacci numbers`

b) This is an example of a function that does the same computation multiple times. Why might this slow down the function? Draw a tree diagram to demonstrate the recursive nature of this function. Do you see duplicated trees? What does this represent?
