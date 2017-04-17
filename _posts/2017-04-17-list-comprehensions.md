---
layout: post
title:  "List Comprehensions"
date:   2017-03-17
categories: worksheets wk7 lists
---
# List Comprehensions
### 1. What is it?
List comprehension refers to a bit of *"syntactic sugar"* in Haskell- a convenient, useful way of defining an action to be done to items in a list.

For example, if I wished to write an "add2" function, your immediate approach might be something like:
```haskell
add2:: [Int]->[Int]
add2 [] = []
add2 (n:ns) = (n+2):(add2 ns)
```
Or something similar with cases/guards. However, let me reveal... the much more conscise beauty of list comprehensions!!!
```Haskell
add2::[Int]->[Int]
add2 l = [n+2 | n <- l]
```
Isn't that lovely? At first sight, it probably looks a bit daunting and gross, but a good way to read it (esp. if u < 3 math) is: __"add2 is the function that takes l, and adds 2 to each n that is an element of l"__. You can see that "->" even looks a little bit like the "element of"maths symbol " ∋ ".

We can also have a __"predicate"__, or a condition on the n. For example, we could restrict our "add2" function so that it only returns numbers less than 10:
```Haskell
add2 l = [n+2 | n -> l, n+2 < 10 ]
```
By the way- we call the "n -> l" bit the __generator__, as it generates the "n"s we want to operate on. Generators need to come before predicates, as the variable (such as our "n" above) is __out of scope__ otherwise.

Getting a little deeper- what happens if we have *more than one* generator?
We get some funky stuff! For example, let's try to write a zip function. Should look something like this, right?

```Haskell
tryZip l s = [(x,y) | x <- l , y <- s]
```
Nope! Trying some demo inputs, we get:
```Haskell
tryZip [1,2,3] [4,5] = [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
```
That's not what we want at all! So using multiple generators behaves quite differently from "grab elements in the same position of each list and do xxx".
Can you explain what tryZip is really doing? 
### 2. Okay- let's practice!!!
__Remember- you're practicing list comprhension, so you should try and use the syntax shown above for all of them! If you get stuck, feel free to use higher order/in-built functions first!__ 
1. Write a function that doubles each element in a list of integers
2. Write a function that returns a list of tuples of two input lists
3. Write a function that capitalises each letter in a string
4. The following function, which intends to add a space between each letter of a string, doesn't work. Can you guess why?
```Haskell
spacer :: String -> String                  
spacer l = [x:" " | x <- l]
```
5. Write a function that squares any even number
6. For our "bae" (defined below), for what value of "n" will bae contain a tuple "(2,x)", where "x" is any arbitrary number?
```Haskell
bae = take n [ (i,j) | i <- [1,2], 
                  j <- [1..] ]
```

Note that "take n l" is a function that returns the first "n" elements of list "l",
i.e. take 2 [1,2,3,4] = [1,2]
7. What does the following function do? What will it output?
 
```Haskell
    take 10 [ (i,j) | i <- [1..], 
                  let k = i*i, 
                  j <- [1..k] ]
```
Note that "take n l" is a function that returns the first "n" elements of list "l",
i.e. take 2 [1,2,3,4] = [1,2]
8. Write a function that takes a list of integers and returns a list consisting of "HOT" if the number is even, "DIGGITY" if odd.
(Hint: you can use an "if ... then ... else..." where you would usually write what you want to return!)
9. Write a function that, given any list of integers, will not return 6,66, or 666
10. Can you write a length function?


