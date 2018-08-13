---
layout: post
title:  "Translation, Damnation!"
date:   2018-08-09 18:01:41 +1100
categories: worksheets wk3 decomposition
---
# Translation, Damnation!

## Recursion??

In your labs this week, you have encountered *Recursion*! 
Let's quickly go through its two critical parts:

1) Base Case: This it the case when the recursion will stop. This will usually apply to the simplest or lowest form of the problem.
2) Recursive Step: Every other step! This must the function again, changing variables for the next iteration.

Recusion goes hand in hand with pattern matching. For example, the following function

	add :: Integer -> Integer -> Integer
	add n m
		| 0 m = m
		| otherwise = (add (n-1) (m+1))
		
is actually equivalent to
	
	add n m = n + m

But it uses recursion! Can you see how that works?


## Questions

The following functions use pattern matching to implement recursion but they are incomplete! Fill in the gaps and then explain what each function does:


	mult :: Integer -> Integer -> Integer -> Integer
	mult m n
		| _______ = n
		| otherwise = n + mult (m-1) n

	Indices :: Integer -> Integer -> Integer
	BOOM m n
		| n == 1    = m
		| otherwise = _______

	sum :: [Integer] -> Integer
	sum ls
		| _______ = 0
		| otherwise = (head ls) + (sum (tail ls))
