---
layout: post
title:  "Lambda Calc 1"
date:   2017-03-10 18:01:41 +1100
categories: week3
tags: week3, lambda calc, 1130
---

# COMP1130 PAL Lambda Calculus

# Introduction

Lambda Calculus is a Turing complete system, which essentially means that any computation you can do with a computer/another programming language, you could also do using lambda calculus. That is quite a big thing to say, since λ-calculus is essentially very high level mathematics. Lambda calculus is the basis for all functional programming languages and some would argue that it is intrinsic to an understanding of computer science and the core components of any programming language. In this session we will be revising what you have covered in the COMP1130 lecture. In this session we will be helping understanding how to move ahead when you have no idea what is going on in front of you. To do this we will look at the ideas of Free variables, alpha conversions, substitutions and using multiple arguments. If you get stuck or derailed at any point in this session, we want you to consider a number of questions/ideas (if applicable).

1. What parts of the previous content related to this problem do I understand?
2. What concepts do I need to understand in order to tackle this problem?
3. What parts of the current concept do I understand?
4. From the content on the current concept, which is most useful to my understanding of the
concept?
5. Is there a process in this concept and if so, up to which point do I understand?
(Note that because of the range of topics, these topics a pretty general and will not apply in all situations)

# 2 Free-Variables
For each of the following lambda expressions, name the free and bound variables. If someone doesn’t understand why one is free and one is bound, explain it to them.
* λx.x
* (λx.y)x
* λx.x y
* (λx.x)(λy.yx)
* (λx.x)x
* x
* y
* λxyx.xxyz
* λw.v
* λx.(λy.x)x
* λx.((λx.x)x)
* (λx.x)(λz.zy)

# 3 Alpha-Conversion
(Another name for Alpha-Conversion is Alpha-Renaming) For each of these, convert the variable on the left of the curly brackets with that on the right, if possible. If multiple conversions are possible then list them all. For example λx.x {x → y} becomes λy.y
* λy.y {y → z}
* λx.y {x → z}
* λx.y {x → y}
* y {y → z}
* λx.y {y → z}
* λx.λy.x {x → y}
* λx.λy.x {x → z}
* λx.λx.x {x → y}
# 4 Substitution
Using the standard notation, simplify these expressions using substitution.If the substitution isn’t possible, explain why.
* x[x := 1]
* x[x := y]
* x[x := x + 1]
* y[x := 3]
* y[x := y]
* (x +1)(x)[x := y]
* λx.x[x := y]
* λy.x[x := y]
* (λx.x)(λy.yx)[x := z]
* λy.(y + x)[x := 3]
* λy.(y + x)[x := y + 3]

# 5 Multiple Arguments
By convention λ-Calculus will only ever allow you to input one argument at a time to any lambda. This can be a big problem if we need to give a function more than one input. Luckily there is a trick/hack to get around this. For example f (x, y) = x + y can be expressed as λx.(λy.x + y) Convert the following functions into the λ-syntax, if possible.
* f (x) = x + 3
* f (x,z) = x + z
* f (x, y) = x y
* Challenge: f (x) = if x == 0 then 1 else x ∗ f (x − 1) (This question is more food for thought than a problem which needs to be done)
6 Extension
If you get up to this section, ask your PAL mentor to trip you out with some more advanced stuff.