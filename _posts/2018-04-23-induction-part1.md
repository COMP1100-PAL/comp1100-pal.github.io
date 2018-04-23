# COMP1130 PAL: Formal Verification and Induction

Induction in Haskell is the same as mathematical induction - remember, Haskell is basically just higher level maths!
There is a base case and inductive case (Just like recursion!). A way you can think about induction is that it is _reverse-recursion_. While recursion counts **down to** the base case, induction counts **up starting from** the base case.

## Warmup question

How would you consider a program to be correct?

_This is essentially the theme of this worksheet - proving programs to be correct._

## Induction Basics

We want to prove that some property holds true `∀n ≥ 0` (for all positive integers). To do this, we need to prove 2 things - the *base case* and *inductive case*.

A common example of this is:
*Base case:* Prove property true for `n=1`.
*Inductive case:* Assuming property holds true for `n=k`, prove property also holds true for `n=k+1`

The case base can vary (e.g. prove true for `n=0`) depending on the property, but the inductive case always remains the same.

## Induction on Numbers

Given the following definitions:

```haskell
-- Calculates the nth fibonacci number (really slow algorithm)
fibSlow :: Integer -> Integer
fibSlow x
| x > 0 = case x of
1 -> 1 -- SF1
2 -> 1 -- SF2
n -> fib (n-1) * fib (n-1) -- SF3
| otherise = error "fibSlow: negative input"

-- a function returning the infinite fibonnaci sequence
fibseq :: [Integer]
fibseq = 1:1:zipWith (+) fibseq (tail fibseq) -- FF1

-- Calculates the nth fibonacci number (really fast algorithm)
fibFast :: Integer -> Integer
fibFast n = fibseq !! n-1 -- FF2
!! :: [a] -> Integer -> a
xs !! n | n < 0 = error "Prelude.!!: negative index"
[] !! _ = error "Prelude.!!: index too large"
(x:_) !! 0 = x -- IX1
(_:xs) !! n = xs !! (n-1) -- IX2
```

1. Verify the code is correct, using formal verification and certification.
2. Fix the code so that it does what it is meant to do according to the specifications (in comments), and test
to check whether the code is correct.
3. Now using the fixed code, prove that the following holds:
`fibSlow n == fibFast n`

You may assume that the fibseq list is infinite.

## Induction on lists

### Counting and joining

Given the following definitions:

```haskell
-- joins two lists together
[] ++ ys = ys -- A1
(x:xs) ++ ys = x : (xs ++ ys) -- A2
-- counts the number of elements in a list
count [] = 0 -- C1
count (x:xs) = 1 + count (x:xs) -- C2
```

1. Verify the code is correct, using formal verification and certification.
2. Fix the code so that it does what it is meant to do according to the specifications, and test
to check whether the code is correct.
3. Now using the fixed code as statements A1, A2, C1, C2 above, prove that the following
holds: count (xs ++ ys) == (count xs) + (count ys)

### Filtering and lengths

Given the following definitions:

```haskell
-- counts the number of True elements in a list
countTrue [] = 0 -- C1
countTrue (x:xs)
| x == True = 1 + countTrue xs -- C2
| otherwise = countTrue xs -- C3

-- same as above with higher order functions
easyCountTrue xs = length (filter (== True) xs) -- EC1

-- calculates the length of a list
length [] = 0 -- L1
length (x:xs) = 1 - length xs -- L2

-- filter a list based on a boolean function
filter p [] = [] -- F1
filter p (x:xs)
| p x = x : filter xs p -- F2
| otherwise = filter p xs -- F3
```

1. Verify the code is correct, using formal verification and certification.
2. Fix the code so that it does what it is meant to do according to the specifications, and test
to check whether the code is correct.
3. Now using the fixed code, prove that the following holds:
`easyCountTrue xs == countTrue xs`
