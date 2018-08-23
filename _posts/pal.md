Recursive Functions
===================


Intro to Recursion
----------------------

So what is the essence of recursion? At its core, it is two steps:

- Base Case: The function terminates with one final output.
- Recursion Case: The function calls itself with a modification of its inputs.

Together, these two steps make recursion. So let's see an example:
```
	recursion :: [a] -> Integer
	recursion ls
		| ls == []  = 0
		| otherwise = 1 + recursion (tail ls)
```
Can you identify the base case and the recursive case? What does the function compute?

A good way to disect recursive function is using a trace. A trace follows through each recursive call of a function given an example input. This enables us to see how the function is computing its output. For example:
```
	recursion "PAL" = 1 + (recursion "AL")
					= 1 + (1 + (recursion "L"))
					= 1 + (1 + (1 + (recursion "")))
					= 1 + (1 + (1 + (0)))
					= 3
```

Writing Your Own Recursive Functions
------------------------------------------------------

Consider the factorial function from mathematics:
```
	n! = n * (n-1) * ... * 2 * 1
```
So,  for example, 3! = 3 * 2 * 1 = 6. We will try to construct a factorial function is Haskell using recursion. Fill in the blanks using the question below!

- What would the type signature be?
- What are the inputs?
- What is the base case?
- What is the recursive case?
- How do we tell what case we are in?
```
	factorial :: ______ -> ______
	factorial xs
		| ______ = 1
		| ______ = ______
```

Using the same methodology, write a recursive function that checks if a string in a palindrome. You can use the following functions that get the first and last elements of list:
```
	head :: [a] -> a
	last :: [a] -> a
```