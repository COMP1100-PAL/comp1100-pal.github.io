---
layout: post
title:  "Reaching Pure Abstraction with Polymorphism"
date:   2017-03-20 11:25:29 +1100
categories: worksheets polymorphism wk5
---
### Prelude
Tony puts his hand on your shoulder.
"You're doing well, kiddo, but we need to make this garbage collecting more effective. We need to make use of... *__a b s t r a c t i o n__*. Come, I will show you something I've been working on."
He takes you back to the dump- stacks are everywhere, exceptions tripping you up, overflows obscuring the path at points- to a small, quiet, untouched garage. It is perfectly clean, and clearly isn't used very often.

Tony claps his hands- a master of laziness- the roller door goes up- you both gasp at it- at its sole object. It is a garbage truck- it is first class. The finest you've ever seen. It can be used for general, recyclable... even hazardous garbage. It's so... *__abstracted__*.

You both step back from the garbage collecting truck- together- united in your determination to plough through life in a functional, side-effect free, *__abstracted__* way.

### What is *Polymorphism*?
We call something polymorphic if there is more than one type it can have- like a function that takes in __any kind of number__. It's used a lot in Haskell, as it allows us to make our functions and types more *generalised*.

### How do we use it?
You can imagine a polymorphic function/type as having a variety of possible types until the caller of the program gives it one.
Note, however, the Haskell is *parametric*- a polymorphic thing will behave the same way no matter what type you pass to it. We cannot write code that varies depending on the type we give it!

### What were all those fancy words Tony just said???
*Total functions?!*
*Infinite loops?!*
*#FEELING TOTALLY LOOPED IN THIS INFINITE FUNCTION*
So Tony used the example:
```haskell
riddle4 :: a -> b
```
To describe how such a function is not (sensibly) possible in Haskell- we can't take in any type, then output any other type, unless we use an __infinite loop__:
```haskell
riddle4 :: a -> b
riddle4 x = riddle4 x
```
Such a function is called a __partial function__- one that never evaluates, or one that throws an exception. All other functions- ones that return something- are called __total functions__.

## Some problems
1. Can you write a function that takes a tuple of any two types, and swaps the order of its values?

2. Can you write a function which takes two tuples, and returns one tuple containing them?

3. Can you write a polymorphic definition of the list type? (note that this also has recursion, *HOW SNAZZY!*)

4. Can you write a function which takes a value x and a integer y, and returns a list of y number of x?
