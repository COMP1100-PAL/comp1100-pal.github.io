---
layout: post
title:  "Lambda Calculus Introduction Solutions"
date:   2020-03-30 08:00:00 +1100
categories: worksheets
---

## Question 1 Solutions: Identifying Valid Lambda Expressions

Yes stands for it is a proper lambda expressions and no stands for it is not.

1) ```λ```: No

2) ```x y```: Yes, this is ```y``` applied to ```x```.

3) ```λx```: No

4) ```x.```: No

5) ```λx.x```: Yes, this is a function.

6) ```x (λx.x)```: Yes, this is the function ```λx.x``` apply to the expression ```x```.

7) ```λx.y```: Yes, this is a function.

8) ```(λx) x```: No.

9) ```λx.(λx.yx)```: Yes, this is a function.

10) ```x (y z)```: Yes, this is ```z``` applied to ```y```, and then that result applied to ```x```.

11) ```(λx.xx) y```: Yes, this is ```y``` applied to ```λx.xx```.

12) ```(λx.(λy.yx)) x```: Yes, this is ```x``` applied to the function ```(λx.(λy.yx))```.

13) ```λx.(λy.yx) x```: Yes, this is a function (look at the bracketing).

14) ```λ(x.λx.x)```: No. 

15) ```λx.(λx.(λx.))```: No.

## Question 2 Solutions: Which Variables are Bound?

For each of the following lambda expressions, list what the variables are, whether they are bound or not, and if so which ```λ``` the variable is bound by (first, second, third, etc).

1) ```λx.y```: ```y``` is free.

2) ```λx.x y```: ```x``` is bound to the first ```λ``` is ```y``` is free.

3) ```(λx.(λy.(λx.xy))) e```: ```x``` is bound to the third ```λ```, ```y``` is bound to the second ```λ``` and ```e``` is free.

4) ```(λx.y) (λy.x)```: ```x``` and ```y``` are both free as they are outside the scope of the respective ```x``` and ```y``` lambda-functions. 

5) ```λx.(λy.x)```: ```x``` is bound to the first ```λ```.

## Question 3 Solutions: Identifying Closed Expressions

Which of the following expressions are closed?

1) ```λx.yx```: Not closed.

3) ```y (λx.x)```: Not closed.

3) ```(λx.x) (λy.y)```: Closed.

4) ```(λy.y) (λx.y)```: Not closed.

5) ```(λy.(λy.xy)) x```: Not closed.