---
layout: post
title:  "Lambda Calculus Continued"
date:   2020-04-06 08:00:00 +1100
categories: worksheets
---

## Beta Reduction

In the last Lambda calculus worksheet, we defined the two recursive elements of Lambda calculus, namely _functions_ and _applications_. But how do we combine the two? We briefly stated that a function application behaves as follows

```
(λx.e1) e2
```

means

> replace every instance of ```x``` in ```e1``` with ```e2```

Evaluating this application is what we refer to as _**Beta Reduction**_: we are reducing the expression into something simpler. For example, take the Lambda expression

```
(λx.xyzx) w
```

In this case, ```e1``` is ```xyzx``` and ```e2``` is ```w```, so the expression can be read as

> replace every instance of ```x``` in ```xyzx``` with ```w```

So the expression beta reduces to ```wyzw```

We can write this beta reduction as ```(λx.xyzx) w``` →<sub>β</sub> ```wyzw```

We can also us beta reduction for more complicated expressions, where there may be two or more ```λ``` functions. For example

```
(λx.x y) (λz.zw)
```

Function application is left associative so we evaluate the leftmost application first. This means we replace every instance of ```x``` in ```x y``` with ```(λz.zw)``` which gives us

```(λx.x y) (λz.zw)``` →<sub>β</sub> ```(λz.zw) y```

We can then perform a second beta reduction by replacing every instance of ```z``` in ```zw``` with ```y``` which gives us

```(λx.x y) (λz.zw)``` →<sub>β</sub> ```(λz.zw) y``` →<sub>β</sub> ```yw```


## Question: Easy Beta

1. ```(λx.xyzx) w```
2. ```(λx.xxx) yz```
3. ```(λy.xyz) ```
4. ```(λx.x) (λz.zw) y```
5. ```(λx.x u) (λz.wzwz) yv```
6. ```(λy.(λw.ywy)) x u```
7. ```(λx.(λy.xyxy)) y z```


## Alpha Conversion

That last question was much more difficult than the others. Why? Because you needed to be careful about which variables were bound and which were free.

Let's look at it again:

```
(λx.(λy.xyxy)) y z
```

The correct reduction is ```yzyz```. A seemingly very reasonable answer is ```zzzz```, however this is *wrong*: we have clashed clashed and free variables. 

Let's look at another similar example:

```
(λx.(λw.xwxw)) y z
```

Although the expressions are incredibly similar, this one has a much clearer result: ```yzyz```. It is very difficult to mistakenly clash the bound and free variables.

As it turns out, these two expressions are __*Alpha Equivalent*__: they are the same, up to the renaming of bound variables. To get from the first to the second, we just renamed all bound ```y``` to ```w```:

```(λx.(λy.xyxy)) y z``` =<sub>α</sub> ```(λx.(λw.xwxw)) y z```

The renaming is called __*Alpha Conversion*__ and is formally defined as:

```λx.e``` =<sub>α</sub> ```λy.(e[y\x]),   if y is not a free variable in e```

Note: the expression ```e[y\x]``` is the semi beta-reduction of ```(λy.e) x```, requiring one beta-reduction to step to reduce the statement. 

So, unpacking the formal definition, a word definition of valid alpha conversion is:

> 'replace every x in e' is alpha equivalent to 'replace every y in e, where y has replaced every x in e'

This is rather technical, but the main ideas are:
1. Expressions are equivalent up to the renaming of bound variables.
2. Alpha conversion is the method of renaming bound variables.

To finish off, here is a concrete example:

``` λy.xyz ``` =<sub>α</sub> ```λb.(xyz[b\y])``` →<sub>β</sub> ```λb.xbz```


## Question: Converting

In each of the following, use alpha conversion to make all sets of bound variables have unique names.

1. ```(λx.zx) x```
2. ```(λy.yxy) yy```
3. ```((λx.xy) z) ((λy.xy) z)```
4. ```(λx.yx) (λx.xyx) z```
5. ```(λx.(λy.xx)) ((λy.uyw) v)```


## Question: Alpha and Beta Together

Now that we can do alpha conversion and beta reduction, we can tackle many interesting and challenging lambda expressions. See if you can reduce the following:

1. ```(λx.xx) (λz.z) y```
2. ```(λx.(λy.xy)) y z```
3. ```(λx.(λy.x y)) (λz.z y) v```
4. ```(λy.x) (λy.((λy.z) y)) yx```
5. ```(λx.xx) (λx.xx)```