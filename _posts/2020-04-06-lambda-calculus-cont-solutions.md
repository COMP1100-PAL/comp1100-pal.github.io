---
layout: post
title:  "Lambda Calculus Continued Solutions"
date:   2020-04-07 08:00:00 +1100
categories: worksheets
---


## Question: Easy Beta

1. ```(λx.xyzx) w```

    __Answer__: ```(λx.xyzx) w``` →<sub>β</sub> ```wyzw```
2. ```(λx.xxx) (yz)```

    __Answer__: ```(λx.xxx) (yz)``` →<sub>β</sub> ```yzyzyz```
3. ```(λy.xyz)```

    __Answer__: ```(λy.xyz)``` cannot be beta reduced as there is no application.
4. ```(λx.x) (λz.zw) y```

    __Answer__: ```(λx.x) (λz.zw) y``` →<sub>β</sub> ```(λz.zw) y``` →<sub>β</sub> ```yw```
5. ```(λx.x u) (λz.wzwz) yv```

    __Answer__: ```(λx.x u) (λz.wzwz) yv``` →<sub>β</sub> ```(λz.wzwz) u yv``` →<sub>β</sub> ```wuwu yv```
6. ```(λy.(λw.ywy)) x u```

    __Answer__: ```(λy.(λw.ywy)) x u``` →<sub>β</sub> ```(λw.xwx) u``` →<sub>β</sub> ```xux```
7. ```(λx.(λy.xyxy)) y z```

    __Answer__: ```(λx.(λy.xyxy)) y``` =<sub>α</sub> ```(λx.(λw.xwxw)) y z```  →<sub>β</sub> ```(λw.ywyw) z``` →<sub>β</sub> ```yzyz```


## Question: Converting

In each of the following, use alpha conversion to make all sets of bound variables have unique names.

Note: We have explicitly done the alpha conversion in two steps, to re-iterate the principle. See page 13 of the [lambda slides](https://cs.anu.edu.au/courses/comp1100/lectures/lambda.pdf) to understand this explicit form.

1. ```(λx.zx) x```

    __Answer__: ```(λx.zx) x``` =<sub>α</sub> ```(λa.zx[x\a]) x``` →<sub>β</sub> ```(λa.za) x```
2. ```(λy.yxy) yy```

    __Answer__: ```(λy.yxy) yy``` =<sub>α</sub> ```(λa.yxy[y\a]) yy``` →<sub>β</sub> ```(λa.axa) yy```
3. ```((λx.xy) z) ((λy.xy) z)```

    __Answer__: ```((λx.xy) z) ((λy.xy) z)``` =<sub>α</sub> ```((λa.xy[x\a]) z) ((λb.xy[y\b]) z)``` →<sub>β</sub> ```((λa.ay) z) ((λb.xb) z)```
4. ```(λx.yx) (λx.xyx) z```

    __Answer__: ```(λx.yx) (λx.xyx) z``` =<sub>α</sub> ```(λa.yx[x\a]) (λb.xyx[x\b]) z``` →<sub>β</sub> ```(λa.ya) (λb.byb) z```
5. ```(λx.(λy.xx)) ((λy.uyw) v)```

    __Answer__: ```(λx.(λy.xx)) ((λy.uyw) v)``` =<sub>α</sub> ```(λx.(λz.xx[y\z])) ((λy.ayc) b)``` →<sub>β</sub> ```(λx.(λw.xx)) ((λy.ayc) b)```


## Question: Alpha and Beta Together

Now that we can do alpha conversion and beta reduction, we can tackle many interesting and challenging lambda expressions. See if you can reduce the following:

1. ```(λx.xx) (λz.z) y```

    __Answer__: ```(λx.xx) (λz.z) y``` →<sub>β</sub> ```(λz.z) (λz.z) y``` =<sub>α</sub> ```(λw.w) (λz.z) y``` →<sub>β</sub> ```(λz.z) y``` →<sub>β</sub> ```y```
2. ```(λx.(λy.xy)) y z```

    __Answer__: ```(λx.(λy.xy)) y z``` =<sub>α</sub> ```(λx.(λw.xw)) y z``` →<sub>β</sub> ```(λw.yw) z``` →<sub>β</sub> ```yz```
3. ```(λx.(λy.x y)) (λz.z y) v```

    __Answer__: ```(λx.(λy.x y)) (λz.z y) v``` =<sub>α</sub> ```(λx.(λw.x w)) (λz.z y) v``` →<sub>β</sub> ```(λw.(λz.z y) w)  v``` →<sub>β</sub> ```(λz.z y)  v``` →<sub>β</sub> ```v w```
4. ```(λy.x) (λy.((λy.z) y)) yx```

    __Answer__: ```(λy.x) (λy.((λy.z) y)) yx``` =<sub>α</sub> ```(λu.x)(λv.((λw.z) v)) yx``` →<sub>β</sub> ```x yx``` We converted all ```λy``` in one batch, renaming them and the variables they have bound all.
5. ```(λx.xx) (λx.xx)```

    __Answer__: ```(λx.xx) (λx.xx)``` =<sub>α</sub> ```(λy.yy) (λx.xx)``` →<sub>β</sub> ```(λx.xx) (λx.xx)``` And we're back where we started! Continuously evaluating this would result in an infinite series of beta reductions. Not every expression can be finitely beta reduced!