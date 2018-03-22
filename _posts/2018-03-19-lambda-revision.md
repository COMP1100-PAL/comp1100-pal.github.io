# COMP1130 Week 5

## Basics

Welcome back to the land of Lambdas! By now, you should have a fairly solid grasp on lambdas, but we'll still build our way up just to be sure.

As always, remember:

* Your basic λ syntax: **`let x = e1 in e2 is short for (λx.e2) e1`**
* Your **free variables** and **bound variables**

## Alpha-conversion refresher

Note: Alpha conversion can only be performed on **bound variables**.

```
λx.y {x → y}
y {y → z}
λ(Tina).(Edmund) {(Edmund) → z}
λx.λy.x {x → y}
λ(Edmund).λ(Edmund).(Edmund) {x → y}
```

## Harder Beta Reduction

Beta reduce the following lamba expressions:

```
(λx.xx)(λy.yx)z
(λx.x x) ((λy.y) z)
(λx.x y x) (λy.x (y u))
λz.((λx.λy.x (y v)) (λu.λv.y u z))
```

## Normal Form

Normal form involves using beta reduction to rewrite them. When no more reduction can be performed, it is in normal form. 

e.g. the following are in normal form: `λx.x`, `y` `λy.yx` (they are "closed" in a sense)

Try to rewrite the following lambdas to get them to normal form:

```
λx.λy.xxy
λx.λy.xxy 6
λx.λy.y
λx.λy.y 8 5
(λx.xx) (λy.yy)
(λx.(x x) λx.(x x))
```

_Note: Not all lambdas have a normal form! Can you think of why?_

## Beta-Equivalence

Beta-equivalence basically refers to 2 different lambda expressions that reduce to the same normal form.

Reduce the following:

* `(λx.x) y`
* `(λz.λw.z) y y`

This is an example of beta-equivalence.

## Y-Combinator

Not all lambda expresions have a normal form as not all lambdas have a sequence of reductions that will lead to one AND some sequences won’t even lead to a Normal form

Try to reduce the following lambdas:

```
λx.λy.λz.x z (y z)
(λx.λy.x) 1
(λ(it's me again).(it's me again) (it's me again)) (λ(it's me again).(it's me again) (it's me again))
```

