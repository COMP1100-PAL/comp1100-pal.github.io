---
layout: post
title:  "Side Effects & Lambdas"
date:   2018-03-07
categories: worksheets, lambda, comp1130
---

# COMP1130 PAL Week 4: Lambda Calc (continued)

## Lambda Intro

λ-calculus is essentially very high level mathematics.

Remember: basic λ syntax is equivalent to `**let x = e1 in e2 is short for (λx.e2) e1**`

## EXERCISE: Write lambdas that will represent multi-argument functions.

```
f(x,y)=(x*y)/x
f(x,y,z)=(x*y)/x*z
f(x,y)=(x^(y*z)
f(x,y,z)=((x*z)*z)
f(x,y)=(x cos(x)*y)
```

## EXERCISE: Write functions that represent lambdas.

```
λx.λy(x+y)
λx.λy.λz.((x*x*y)/ z / x) 6  8  1
λx.λy.λz.((x*x*y)/ z / x)  6  1
```

## Beta reduction

Beta reduction is the use of a lambda application to convert a lambda expression into a simpler form. Recall Tony’s lectures to beta reduce the following functions. If in doubt, ask a pal!

```
(λx.λy x)(λz.u)
(λx.x x)(λz.u)
(λy.y a)((λx.x)(λz.(λu.u) z)) (There are three solutions to this expression)
(λx.λy.x y)
(λx.x (λx.x) z)
(λx.x (λx.x)) z
```
