---
layout: post
title:  "Lambda Calculus Completed"
date:   2020-05-04 08:00:00 +1100
categories: worksheets
---

## Normal Form

A lambda calculus expression is said to be in __**normal form**__ if it cannot be reduced using beta reduction. For example, the identity function ```λx.x``` cannot be reduced as we don't know what the input is yet, hence ```λx.x``` is in normal form.

However ```(λx.yx) z``` is not in normal form as it can beta reduce to ```yz``` which is then said to be the normal form of ```(λx.yx) z```.

### Question: Reducing to Normal Form

State whether each of the following lambda expressions are in normal form and if not, reduce it until it is.

1. ```λx.xxx```
2. ```(λx.xxx) (λx.x)```
3. ```λx.yz```
4. ```(λx.(λy.yx) (xz)) y z```
5. ```(λx.x w)((λy.y)(λz.(λu.u)z))```

## Church-Rosser Theorem

So far, we have ignored the question about whether the order of evaluation matters or not: we have just let the evaluation happen in any order. But can this lead to different results?

As it turns out, the answer is no: we can't get different results from different evaluation orders. This is due to the __**Church-Rosser Theorem**__:

> If ```a -> *b``` and ```a -> *c```, then there exists ```d``` such that ```b -> *d``` and ```c -> *d```.

where ```*``` is a wildcard, referring to any lambda expression. In normal English, the Church-Rosser theorem states that the order of evaluation doesn't matter as, even if there are different steps in the middle, the final result will be the same. Here is an example:

```(λx.yx) ((λz.zz) a)```

→<sub>β</sub> ```(λx.yx) aa``` →<sub>β</sub> ```yaa```

or 

→<sub>β</sub> ```y((λz.zz) a)``` →<sub>β</sub> ```yaa```

Note that the Church-Rosser theorem isn't a 'Get-Out-Of-Jail-Free' card: it does have one catch. While it does say that the order of evaluation doesn't matter, it doesn't say that every evaluation order will terminate. Some lambda expressions may terminate when evaluated in one order but not in another. For example:

```(λx.y) ((λx.xx)(λx.xx))```

→<sub>β</sub> ```y```

or 

→<sub>β</sub> ```(λx.y) ((λx.xx)(λx.xx))``` →<sub>β</sub> ```(λx.y) ((λx.xx)(λx.xx))``` →<sub>β</sub> ```...```

Note that not all lambda calculus expressions do terminate: some will loop for ever regardless of the evaluation order, e.g ```(λx.xx)(λx.xx)```.


## Lazy vs Eager Evaluation: Haskell Edition

In week 1, you were told that Haskell is a __Pure, Lazy Evaluated, Functional Programming Language__. At the time, the concepts of __Pure__, __Lazy Evaluated__ and __Functional__ probably made little or no sense.

But now, in week 7, you (hopefully) have a much better understanding:

- __Functional__ says that functions are just like another other type, which we used extensively in higher order functions.
- __Pure__ says that Haskell is side-effect free and deterministic, which is what allows us to write ```traces``` to determine function behaviour.
- __Lazy__ says... eh.. wait... What does lazy mean?

So far, we haven't really talked about lazy evaluation and how it affects Haskell, nor have we seen any examples. So let's dive into lazy evaluation and see what it means.

There are two types of evaluation: lazy and eager.

- In eager evaluation, the moment that a function is applied, we evaluate it. This means, when we take in inputs, these inputs will always be as simplified and evaluated as possible.
- On the other hand, lazy evaluation is slack and procrastinates. It keeps on expanding expressions, rather than evaluating anything.

We can see this difference in a simple example:

```haskell
-- Expression: map (+(2*3)) [1..10]

-- Eager Evaluation
map (+(2*3)) [1..10] = map (+6) [1..5]
                     = [1+6, 2+6, 3+6, 4+6, 5+6]
                     = [7,8,9,10,11]

-- Lazy Evaluation
map (+(2*3)) [1..10] = [1+(2*3), 2+(2*3), 3+(2*3), 4+(2*3), 5+(2*3)]
                     = [1+6,2+(2*3), 3+(2*3), 4+(2*3), 5+(2*3)]
                     = [7, 2+6, 3+(2*3), 4+(2*3), 5+(2*3)]
                     = [7, 8, 3+(2*3), 4+(2*3), 5+(2*3)]
                     = [7, 8, 3+6, 4+(2*3), 5+(2*3)]
                     = [7, 8, 9, 4+(2*3), 5+(2*3)]
                     = [7, 8, 9, 4+6, 5+(2*3)]
                     = [7, 8, 9, 10, 5+(2*3)]
                     = [7, 8, 9, 10, 5+6]
                     = [7, 8. 9, 10, 11]
```

At this point, lazy evaluation may seem very bad: the lazy route was outrageously inefficient and long! However, consider this example:

```haskell
-- Expression: (10 > 3) || (sum [1..10]) `mod` 2 == 0

-- Eager Evaluation
(10 > 3) || (sum [1..10]) `mod` 2 == 0 = True || (sum [1..10]) `mod` 2 == 0
                                       = True || (1+2+3+4+5+6+7+8+9+10) `mod` 2 == 0
                                       = True || 55 'mod' 2 == 0
                                       = True || 1 == 0
                                       = True || False
                                       = True

-- Lazy Evaluation
(10 > 3) || (sum [1..10]) `mod` 2 == 0 = True || (sum [1..10]) `mod` 2 == 0
                                       = True
```

In this example, the lazy evaluation never evaluates the expression ```(sum [1..10]) `mod` 2 == 0``` because it never needs to: it already has its answer!

Let's look at another example:

```haskell
eitherOr :: Bool -> Int -> Int
eitherOr b i j = case b of
    True    -> i
    False   -> j

-- Expression: eitherOr (True || sum [1..100] == 5050) (sum [1,3..9]) (sum [0,2..10])

-- Eager Evaluation
eitherOr (True || sum [1..100] == 5050) (sum [1,3..9]) (sum [0,2..10])
        = eitherOr (True || 5050 == 5050) (sum [1,3..9]) (sum [0,2..10])
        = eitherOr (True || True) (sum [1,3..9]) (sum [0,2..10])
        = eitherOr True (sum [1,3..9]) (sum [0,2..10])
        = eitherOr True 24 (sum [0,2..10])
        = eitherOr True 24 30
        = 24

-- Lazy Evaluation
eitherOr (True || sum [1..100] == 5050) (sum [1,3..9]) (sum [0,2..10])
        = eitherOr True (sum [1,3..9]) (sum [0,2..10])
        = (sum [1,3..9])
        = 24
```
Note that we need to evaluate ```(True || sum [1..100] == 5050)``` in lazy as well, as nothing can be expended until that value is known.

So these examples have shown how eager evaluation jumps in and calculates the result for any expression the moment it is seen, while lazy evaluation sits back and waits until it has to.

Hopefully now you understand the difference between lazy and eager evaluation. However, are there any effective differences between them? Is one faster than the other? Is one better?

In general, lazy evaluation is superior. First and most importantly, it terminates more often. This is incredibly significant and useful. Additionally, it allows more tricks to be played, e.g infinite lists. Finally, it tends to be faster as less is computed (not always true though).

Lazy evaluation does have its downsides though. Annoyingly, it is hard to implement efficiently. Haskell is fine in this regard - its lazy evaluation is implemented very well - but some other attempts at lazy programming fall short. Additionally, it is hard to determine operation time and operation order. Because expressions are only evaluated when needed, rather than when seen, you don't know exactly when it will be computed. This can cause problems with side-effects, e.g trying to print something during a program at a very specific point, and arguing about the logic.


## Lazy vs Eager Evaluation: Lambda Edition

Just like in Haskell traces, we can evaluate lambda expression either with lazy or eager evaluation. The rules are the exact same: lazy procrastinates until it is forced to do something, while eager evaluates everything the moment it sees it.

Here is an example expression: ```(λx.xx) ((λy.zy) w)```. We can then evaluate this in two ways.

Eager Evaluation: ```(λx.xx) ((λy.zy) w)``` →<sub>β</sub> ```(λx.xx) zw``` →<sub>β</sub> ```zwzw```

Lazy Evaluation: ```(λx.xx) ((λy.zy) w)``` →<sub>β</sub> ```((λy.zy) w)((λy.zy) w)``` →<sub>β</sub> ```zw((λy.zy) w)``` →<sub>β</sub> ```zwzw```

Hopefully, the difference between lazy and eager evaluation is rather clear and evident after the Haskell explanation, so we will leap straight into questions.

### Question: Lazily and Eagerly Evaluating Lambda Expressions

For each of the following expressions, try to evaluate them using the lazy method of evaluation and the eager method of evaluation. Do they both produce a result? If so, do they come up with the same result? Which was easier?

1. ```(λx.λy.(y x)) ((λz.z) w)```
2. ```(λx.xy)(λy.zy)```
3. ```(λx.y)((λx.xx)(λx.xx))```
4. ```(λx.x w)((λy.y)(λz.(λu.u)z))```
5. ```((λf.(λx.fffx)) ((λy.yy) z)) z```