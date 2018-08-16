---
layout: post
title:  "Guards vs Cases"
date:   2018-08-16 18:01:41 +1100
categories: worksheets wk3 decomposition
---
# Guards vs Cases

It it often hard to see the difference between guards and cases. Both are just pattern matching outputs, right??? While this may seem to the case, guards and cases are quite different.

Guards rely on boolean expression; the LHS of each guard must result in either True or False. Additionally, each guard can be a different expression.

On the other hand, cases pattern match over a specific expression. This expression can evaluate to any type but then each case must be an instance of this one type.

With this in mind, try to solve the following problem using both cases and guards:

Q) The following table gives scores for people sitting next to each other. Given a list of the three people (as strings), calculate the score of the sitting arrangement.

|			| Jay	| Tiggy	|  Edmund	|
|:---------:|:-----:|:-----:|:----------|
| Jay		|		| 2		| 3			|
| Tiggy		| 2		|		| -1		|
| Edmund	| 3		| -1	|			|
