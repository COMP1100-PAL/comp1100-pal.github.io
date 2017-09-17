---
layout: post
title:  "Typeclasses, Lambda Calc, and Binary -> English"
date:   2017-09-16
categories: worksheets wk7
---

# Getting Classy with Typeclasses
Typeclasses are great. We use them in Haskell to support **overloading**, where a function has multiple meanings with different type signatures. Don't worry, Haskell always chooses a meaning at compile time, based on how the function is used.

The best way to understand typeclasses is to understand *how they relate to each other*. So, today we ask that you draw a diagram of how the following typeclasses are related:

- Enum
- Integral
- RealFrac
- RealFloat
- Floating
- Fractional
- Num
- Show
- Eq
- Ord
- Ix
- Real

If you get stuck, try to think of examples of the typeclasses- do these types appear to be sub/superclasses of other typeclasses?

# A New Level of Abstraction with Lambdas!

Lambda abstractions, otherwise known as anonymous functions, are another way you can write functions in Haskell. As the name anonymous function suggests, no name is required! The λ is represented in Haskell with the backslash (`\`). A few advantages of using lambdas in your code are:
- Can make code shorter and more concise
- Faster, simpler alternative to helper functions
- No need to explicitly define new variables
- Convenience!

## eta-conversion

Since each lambda abstraction is just a simplified version of a regular Haskell function, they can be translated back.

e.g.
```haskell
\x -> x*6
```
translates to `(+6)`

Let's have a go with translating a few functions from lambda abstractions to Haskell functions that you are more used to:

1. `\x -> x`
_Additional: What is this function also known as?_

2. `\x -> x * x + 5 / x`

3. `addOneList lst = map (\x -> x + 1) lst`

_Note: Can you see how lambda abstractions have shortened the function, especially for Problem 3? This is especially common in higher-order functions such as `map` and `foldl` where the argument function can be written directly without explicitly defining the function elsewhere_

P.S. You would have seen that these appear in Steven's functions that you need to explain for the assignment (and if you haven't, please do the assignment!), so hopefully this gives you good foundation for understanding what is going on.

# Binary -> English

Remember the poem Tiggy-senpai delivered to the class years ago? It was posted on Piazza in binary form. 
The link for reference:
https://piazza.com/class/j53tz2pnw591bb?cid=27

Binary isn't human readable, so if you wanted to relive the epic moment again, you'd have to translate it to English... 
why do that by hand when you have a computer?

Your task, should you choose to accept, is to write a function that will translate binary in English. 
(Hint: Split this up into multiple functions)

Think about how you would go about doing this, and ask for help when you get stuck. Discuss ideas with each other!
