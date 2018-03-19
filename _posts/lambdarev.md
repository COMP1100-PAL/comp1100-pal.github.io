## Basics

Welcome back to the land of Lambdas! By now, you should have a fairly solid grasp on lambdas, but we'll still build our way up just to be sure.

As always, remember:

* Your basic λ syntax: **`let x = e1 in e2 is short for (λx.e2) e1`**
* Your **free variables** and **bound variables**

## Alpha-conversion

Note: Alpha conversion can only be performed on **bound variables**.

λy.y {y → z}
λx.y {x → z}
λx.y {x → y}
y {y → z}
λ(Tina).(Edmund) {(Edmund) → z}
λx.λy.x {x → y}
λx.λy.x {x → z}
λ(Edmund).λ(Edmund).(Edmund) {x → y}

## Beta Reduction



## Normal Form

Normal form involves using beta reduction to rewrite them. When no more reduction can be performed, it is in normal form. Try to rewrite the following lambdas to get them to normal form:

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

Formally,  if a $\stackrel{=}{\beta}$ b and both are normal
forms, then they are equal

## Y-Combinator

as not all lambdas have a sequence of reductions that will lead to one AND some sequences won’t even lead to a Normal form
