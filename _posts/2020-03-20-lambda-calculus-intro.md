---
layout: post
title:  "Lambda Calculus Introduction"
date:   2020-03-20 08:00:00 +1100
categories: worksheets
---

## What is Lambda Calculus?

At first, lambda calculus might look like a confusing jumble of symbols. However think back to when you saw your first haskell program back in week 1. It was probably just as confusing because you don't know what the the syntax is. So how do we break a lambda calculus expression down to understand it's syntax. In lectures last week you were introduced to recursion. Similarly, expressions or "Programs" in the lambda calculus are also defined recursively.

### Base Case
The simplest element or _**Expression**_ in the lambda calculus is a single variable, which is usually denoted by a single letter
```
x, y, z, ...
```
### Recursive Case
There are two ways of combining lambda expressions into new lambda expressions. Firstly, there is a _**Function**_. Suppose ```e``` is a lambda expression and let ```x``` denote a variable that may be contained in the expression ```e```. We can then write a new lambda expression as follows:
```
λx.e
```
This means

>  replace all cases of ```x``` in ```e``` with the "input" of the function

So what is this input? This is where the second definition comes in, the _**Application**_. This is written as
```
e1 e2
```
and means

> apply e2 to e1


If ```e1``` is a function, then this will use the expression ```e2``` as input to the function defined in e1. For example
```
(λx.e1) e2
```
means 
>replace every instance of ```x``` in ```e1``` with ```e2``` 

So 
```
(λx.xyzx) y
``` 
means 

>replace every instance of ```x``` in ```xyzx``` with ```y``` so would have the result ```yyzy```

Now because this is a recursive definition, our expressions ```e1``` and ```e2``` can themselves be combinations of functions and applications, for example
```
(λx.xyx) (λz.w)
```
means
>replace every instance of ```x``` in ```xyx``` with ```(λz.w)```, so would have the result ```(λz.w)y(λz.w)```

We can then build up more and more complex lambda calculus expressions using the exact same method. With practice, we will learn to construct and evaluate them.

## Question: Identifying Valid Lambda Expressions

We have 15 possible lambda expressions below. Which are proper lambda expressions and what form do they follow?

1) ```λ```

2) ```x y```

3) ```λx```

4) ```x.```

5) ```λx.x```

6) ```x (λx.x)```

7) ```λx.y```

8) ```(λx) x```

9) ```λx.(λx.yx)```

10) ```x (y z)```

11) ```(λx.xx) y```

12) ```(λx.(λy.yx)) x```

13) ```λx.(λy.yx) x```

14) ```λ(x.λx.x)```

15) ```λx.(λx.(λx.))```

## Bound and Free Variables

The concept of bound and free variables is incredibly important in lambda calculus. But what exactly are they? When we use function, ```(λx.e1) e2```, we are binding ```x``` to ```e2```, as we will be replacing every instance of ```x```. So a _**Bound Variable**_ is a standard lambda calculus variable that will be replaced once a function is evaluated. The opposite is a _**Free Variable**_, one that isn't bound. With the three different lambda expressions, we can define the set of free variables as:
```
FV(X) = {x}
FV(λx.e) = FV(e) - {x}
FV(e1 e2) = FV(e1) ∪ FV(e2)
```
You don't have to remember this, but it can be a helpful way of remembering which variables are free and which are bound.

When considering how a variable is bound, it is important to remember two rules about lambda calculus:
- Scope: ```λ``` extends as far to the right as possible. Example:
```
λx.λy.x y = λx.(λy.(x y))
```
- Associativity: Function application is left-associative. Example:
```
x y z = (x y) z
```
These two rules mean that variables refer to their closest definition, i.e the ```λ``` that bounds it closest on the right. Note though, that these rules can be overruled by brackets. So:
```
x (y z) ≠ x y z
```
Always keep this in mind!

## Question: Which Variables are Bound?

For each of the following lambda expressions, list what the variables are, whether they are bound or not, and if so which ```λ``` the variable is bound by (first, second, third, etc).

1) ```λx.y```

2) ```λx.x y```

3) ```(λx.(λy.(λx.xy))) e```

4) ```(λx.y) (λy.x)```

5) ```λx.(λy.x)```

## Closed Expressions

Now that we know which variables are free and which are bound, we can define what a _Closed Expression_ is. Luckily, it is very easy: an expression is closed if it has no free variables. The simplest example is:
```
λx.x
```
In this expression, ```x``` is the only variable and it is bound, so the expression is closed.

The benefit of a closed expression is that it can be totally evaluated; no variables will be left and an answer can be calculated.

## Question: Identifying Closed Expressions

Which of the following expressions are closed?

1) ```λx.yx```

3) ```y (λx.x)```

3) ```(λx.x) (λy.y)```

4) ```(λy.y) (λx.y)```

5) ```(λy.(λy.xy)) x```