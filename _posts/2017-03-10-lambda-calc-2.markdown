---
layout: post
title:  "Lambda Calc 2"
date:   2017-03-11 18:01:41 +1100
categories: week4
tags: week4, lambda calc, 1130
---

# COMP1130 PAL Lambda Calculus (cont.)

λ-calculus is essentially very high level mathematics. Lambda calculus is the basis for all functional programming revising languages and some would argue that it is intrinsic to an understanding of computer science and the core components of any programming language. In this session we will be what you have covered in the COMP1130 lecture. In this session we will be helping understanding how to move ahead when you have no idea what is going on in front of you by drawing upon the foundations of last week.

## Multi-argument functions

Multiple argument functions are created by “Currying” together many single argument lambdas. It is possible for the body of one lambda to be passed as an argument to another

For example:

    λx.λy.(x+y)/2

This is a function that averages two numbers. If we give it parameters, it becomes:

    ((λx.λy.(x+y)/2) 2  8)

Now notice the 2 is bound to x, and the 8 is (for the moment) free. Thus we are left with:

    (λy.(2+y)/2) 8.

Now the 8 is bound to y and we can replace each y with 8:

    (2+8)/2=5

What if we only supplied one parameter to this function instead of two?
Well the same things happen, we just leave the lambda unevaluated.

    ((λx.λy.(x+y)/2) 8)

8 is bound to x so we replace x in the lambda by 8:

    λy.(8+y)/2

We are left with a function that takes a number, adds 8 and finally divides it by 2.

### EXERCISE: Write lambdas that will represent multi-argument functions.
	f(x,y)=(x*y)/x
	f(x,y,z)=(x*y)/x*z
	f(x,y)=(x^(y*z)
	f(x,y,z)=((x*z)*z)
	f(x,y)=(x cos(x)*y)

### EXERCISE: Write functions that represent lambdas.
	λx.λy(x+y)
	λx.λy.λz.((x*x*y)/ z / x) 6  8  1
	λx.λy.λz.((x*x*y)/ z / x)  6  1

## Beta reduction
Beta reduction is the use of a lambda application to convert a lambda expression into a simpler form. Recall Tony’s lectures to beta reduce the following functions. If in doubt, ask a pal!

	(λx.λy x)(λz.u)
	(λx.x x)(λz.u)
	(λy.y a)((λx.x)(λz.(λu.u) z)) (There are three solutions to this expression)
	(λx.λy.x y)
	(λx.x (λx.x) z)
	(λx.x (λx.x)) z

## Normal Form
Normal form involves using beta reduction to rewrite them, when no more reduction can be performed, it is in normal form. Not all lambdas have Normal forms, as not all lambdas have a sequence of reductions that will lead to one AND some sequences won’t even lead to a Normal form. Try to rewrite these following lambdas to get them to normal form.

	λx.λy.xxy
	λx.λy.xxy 6
	λx.λy.y
	λx.λy.y 8 5
	(λx.xx) (λy.yy)
	(λx.(x x) λx.(x x))

## Church Numerals and true/false
Church numerals are defined as in the table below. There are in fact many ways to express numerals using lambda calculus, however church numerals are by far the canonical example of numeric expression in lambda calculus.
 
 ![alt text](https://github.com/COMP1100-PAL/comp1100-pal.github.io/raw/master/img/church.png "Church numerals baby")

Express in using a lambda expression, each of the following numbers.

    5
    10

The idea of the questions below, is that there should be some function such that when evaluated the resulting lambda expression, is the respective church encoding of the desired numeral.

    How might you define the successor function in lambda calculus?
    How might you define the addition function in lambda calculus?
    How might you define the multiplication function in lambda calculus?
    How might you define the power/order function in lambda calculus (i.e. mn)?
