---
layout: post
title:  "Lambda Calculus Completed"
date:   2020-05-04 09:00:00 +1100
categories: worksheets
---

### Question: Reducing to Normal Form

State whether each of the following lambda expressions are in normal form and if not, reduce it until it is.

1. ```λx.xxx```

__Answer__:
> This expression is in normal form.

2. ```(λx.xxx) (λx.x)```

__Answer__:
> This expression is not in normal form. It can be further reduced like so: ```(λx.xxx) (λx.x)``` →<sub>β</sub> ```(λx.x)(λx.x)(λx.x)``` →<sub>β</sub> ```(λx.x)(λx.x)```  →<sub>β</sub> ```(λx.x)```

3. ```λx.yz```

__Answer__:
> This expression is in normal form.

4. ```(λx.(λy.yx) (xz)) y z```

__Answer__:
> This expression is not in normal form. It can be further reduced like so: ```(λx.(λy.yx) (xz)) y z``` →<sub>β</sub> ```(λx.xzx) y z``` →<sub>β</sub> ```yzy z```

5. ```(λx.x w)((λy.y)(λz.(λu.u)z))```

__Answer__:
> This expression is not in normal form. It can be further reduced like so: ```(λx.x w)((λy.y)(λz.(λu.u)z))``` →<sub>β</sub> ```(λy.y)(λz.(λu.u)z) w``` →<sub>β</sub>  ```(λz.(λu.u)z) w``` →<sub>β</sub> ```(λz.z) w``` →<sub>β</sub> ```w```

### Question: Lazily and Eagerly Evaluating Lambda Expressions

For each of the following expressions, try to evaluate them using the lazy method of evaluation and the eager method of evaluation. Do they both produce a result? If so, do they come up with the same result? Which was easier?

1. ```(λx.λy.(y x)) ((λz.z) w)```

__Answer__:
> Eager Evaluation: ```(λx.λy.(y x)) ((λz.z) w)``` →<sub>β</sub> ```(λx.λy.(y x)) w``` →<sub>β</sub> ```λy.(y w)```

> Lazy Evaluation: ```(λx.λy.(y x)) ((λz.z) w)``` →<sub>β</sub> ```λy.(y ((λz.z) w))``` →<sub>β</sub> ```λy.(y w)```

2. ```(λx.xy)(λy.zy)```

__Answer__:
> Eager Evaluation: ```(λx.xy)(λy.zy)``` →<sub>β</sub> ```(λy.zy)y``` →<sub>β</sub> ```zy```

> Lazy Evaluation: ```(λx.xy)(λy.zy)``` →<sub>β</sub> ```(λy.zy)y``` →<sub>β</sub> ```zy```

> Notice that both the eager and lazy evaluation are the same

3. ```(λx.y)((λx.xx)(λx.xx))```

__Answer__:
> Eager Evaluation: ```(λx.y)((λx.xx)(λx.xx))``` →<sub>β</sub> ```((λx.y)((λx.xx)(λx.xx))``` which is the exact same, so it repeats forever.

> Lazy Evaluation: ```(λx.y)((λx.xx)(λx.xx))``` →<sub>β</sub> ```y```

> Notice that the eager evaluation does not reach the normal form.

4. ```(λx.x w)((λy.y)(λz.(λu.u)z))```

__Answer__:
> Eager Evaluation: ```(λx.x w)((λy.y)(λz.(λu.u)z))``` →<sub>β</sub> ```(λx.x w)((λy.y)(λz.z))``` →<sub>β</sub> ```(λx.x w)(λz.z)``` →<sub>β</sub> ```(λx.x w)(λz.z)``` →<sub>β</sub> ```(λz.z) w``` →<sub>β</sub> ```w```

> Lazy Evaluation: ```(λx.x w)((λy.y)(λz.(λu.u)z))``` →<sub>β</sub> ```((λy.y)(λz.(λu.u)z)) w``` →<sub>β</sub> ```(λz.(λu.u)z) w``` →<sub>β</sub> ```(λu.u) w``` →<sub>β</sub> ```w```

5. ```((λf.(λx.fffx)) ((λy.yy) z)) z```

__Answer__:
> Eager Evaluation: ```((λf.(λx.fffx)) ((λy.yy) z)) z``` →<sub>β</sub> ```((λf.(λx.fffx)) zz) z```  →<sub>β</sub> ```(λx.zzzzzzx) z``` →<sub>β</sub> ```zzzzzzz```

> Lazy Evaluation: ```((λf.(λx.fffx)) ((λy.yy) z)) z``` →<sub>β</sub> ```(λx.((λy.yy) z)((λy.yy) z)((λy.yy) z)x) z``` →<sub>β</sub> ```((λy.yy) z)((λy.yy) z)((λy.yy) z)z``` →<sub>β</sub> ```zz((λy.yy) z)((λy.yy) z)z``` →<sub>β</sub> ```zzzz((λy.yy) z)z``` →<sub>β</sub> ```zzzzzzz```