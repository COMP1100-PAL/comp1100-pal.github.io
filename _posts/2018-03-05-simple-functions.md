# PAL Week 3: Simple Functions

### Activity 1: Putting the  _fun_ in functions
Haskell is a functional programmming. This means we should have a good idea of what a function _is_. In groups, discuss the following topics on the whiteboard: 

-What is a function in simple terms?
-Give examples of functions in mathematics (e.g., f(x) = 5x), and real life (e.g., f (smiling) = happy, f (frowning) = angry).
-How do functions relate to programming in Haskell.

### Activity 2



### Activity 3: Functional Composition
Consider a mathematical function that doubles a number
f(x) = 2 x.
We can write a new function that uses f(x) twice in order to quadruple a number. This is called _functional composition_. For example,
g(x) = f( f (x) ).

a) Write a function in haskell that doubles a number.
b) Quadruples a number by writing a new function composed of the function you wrote in (a).
c) You're able to use functions that you don't understand every aspect of to compose a new function. If you understand the inputs and outputs of a function you can use this to determine what the function does, and use it in a new function _composition_. In this exercise, imagine you have an object called a 'list'. It holds an unknown quantity of numbers, like a list. If you have one function called 'count' that, given a list, returns how many numbers are in that list, and another function called 'sum', that returns the sum of all the numbers in that list, can you create a new function called 'average' that returns the average of the list of numbers?
Hint : the average of our list is the sum of numbers in the list, divided by the length of the list.
Hint 2 : What are the inputs and outputs of 'count' and 'sum'?
