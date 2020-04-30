---
title: "Comprehending Lists"
date: "2020-05-05 8:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---

__**NOTE**__: This is an extension worksheet: List comprehensions are not assessed in COMP1100/1130. The content here is not mandatory.

That said, list comprehensions are very useful tools in Haskell and they can be applied to many problems (including assignments and labs). We highly recommend you take a look at them.

## List Comprehension

We can simply consider list comprehension as another alternative for higher order functions on lists.

Let’s start off with a simple example: if you were asked to write a function that generates the first n odd numbers, one basic approach you could use is:

```haskell
take 10 [1,3..] = [1,3,5,7,9,11,13,15,17,19]
```

But now we know about higher order functions, so we can make it more general with the following approach:

```haskell
oddNumGenerate :: (Num a) => a -> a 
oddNumGenerate x = 2*x - 1

map oddNumGenerate [1..10] = [1,3,5,7,9,11,13,15,17,19]
```

This higher order approach is nice and general, but it is rather cumbersome. But we can eliminate this issue with the aid of lists comprehensions:

```haskell
[2*x - 1| x <- [1..10]] = 1,3,5,7,9,11,13,15,17,19]
```

We can read this list comprehension as follows:
- ```x <- [1..10]```: take elements ```x``` from the list ```[1..10]```
- ```2*x - 1```: for each of those elements, put ```2*x - 1``` into the list.

So the general format of a list comprehension is as follows:

```haskell 
[ <output function> | <input lists>, ..., <predicate>, ... ]
```

So the second part, after ```|```, is the ```filter``` and sampling part, saying how we get the input elements:
- Input lists, e.g ```x <- [1..]``` meaning ```x``` from the positive integer.
- Predicates, e.g ```x % 2 === 0``` meaning ```x``` that are even.

So for a ```x``` to be an input element, it must come from the input list and satisfy the predicate.

The first part, before ```|```, says what function we apply to the input elements and so what output elements we get in the list, e.g. ```x + 1``` means that we add one to all the input elements.

In general, a list comprehension has the following form:

```haskell
[f x | x <- xs, pred x]
```

where ```f :: a -> b``` is the output function we apply, ```xs :: [a]``` is the list we get the input elements from and ```pred :: a -> Bool``` is the filter we apply to the input elements. So intuitively, this can be read as:
> "the list of all ```f x``` such that ```x``` is drawn from ```xs``` and satisfies ```pred```"

(This concept is somewhat similar to that of 'set comprehensions' used in mathematics).

Let's look at another example:

```haskell
[2*x - 1 | x <- [1..], x <= 10]
```

This gives the same output as before: ```[1,3,5,7,9,11,13,15,17,19]```. This time however, instead of getting input elements from the finite list ```[1..10]```, we get them from the infinite list ```[1..]``` and then filter out values above 10, ```x <= 10```. To be clear:
- ```x <- [1..]``` says how we sample the input elements ```x```
- ```x <= 10``` says how we filter the input elements
- ```2*x - 1``` says what the output elements are given the input elements.

Let's look at yet another example:

```haskell
[2*x - 1 | x <- [1..], (2*x - 1) < 20]
```

Again the same result! Here we have changed the predicate from ```x <= 10``` to ```(2*x - 1) < 20```. This shows how the predicates can be quite complicated: they all must take ```x``` as an input and output a `bool`, but otherwise they can be anything!

Finally an example without the same output:

```haskell 
[2*x-1| x <- [1..10] , x /= 2, x /= 7] 
```

The output of this would be: ```[1,5,7,9,11,15,17,19]```. This shows more predicate examples: we can omit a particular input values from the list! 

So what changed here?? Haskell generated ```(2x-1)```  for all the integer values between ```1``` and ```10``` excluding the instances where ```x``` is equal to ```2``` and ```x``` is equal to ```7```, as we specified in the predicates ```x /= 2```  and ```x /= 7```.

In this example we only specified two predicates, but there is no limit to the number of predicates we can add to a list comprehension!!


### Still having second thoughts about learning list comprehensions?

Let’s say you had to generate ```[1,5,7,9,11,15,17,19]``` without the aid of list comprehensions. A common approach would be:

```haskell
-- Generates odd numbers in order
oddNumGenerate :: (Num a) => a -> a
oddNumGenerate x = 2*x - 1

-- Produces the list [1,3,4,5,6,8,9,10] by filtering out 2 and 7
ls = filter ((flip notElem)  [2,7]) [1..10]

-- Produces the required [1,5,7,9,11,15,17,19]
output = map oddNumGenerate ls
```

(Note that ```flip``` is a ```Prelude``` function that changes the order of arguments of a function)

Crikey! Wasn't that so much easier with list comprehensions? This more common approach requires multiple functions, including a higher order list function. It is very complicated and hard to understand!

Furthermore, we know that list comprehensions can do much more complicated tasks while still being easy to write and understand. Image how complicated a normal approach would be if the list comprehension had more than 2 predicates!

In fact, let's see how simple it is to program with list comprehensions, in comparison to normal other Haskell approaches.

For instance let's say we want the following:

- Integers 50 to 100.
- Integers whose remainder is 3 when divided by 7.

These predicates are very specific and odd, but they are very easy to implement with list comprehensions:

```haskell
[ x | x <- [50..100], x `mod` 7 == 3]
```

This list comprehension generates: ```[52,59,66,73,80,87,94]```. Let's go further with this example. Suppose we now wanted to apply a complicated function, ```f```. We could build on our list comprehension with ```map``` like so:

```haskell
map f [ x | x <- [50..100], x `mod` 7 == 3]
```

But, as we have seen, list comprehensions have beautiful and easy way to do this:

```haskell
[ f x | x <- [50..100], x `mod` 7 == 3]
```

Neither higher order functions nor standard functions are needed! This ```f``` could be incredibly complicated, possibly even written by someone else, but we can incorporate it easily in the list comprehension.


## Questions: Writing List Comprehensions

For all the following questions, the answer sheet has solutions with and without list comprehensions. Try to answer the questions in both ways.

1) We have the list ```[0,2..]```. We want the lists ```[0,-2,-4,-6,-8,-10]```. How can we do this?

2) We have the function ```isVowel :: Char -> Bool``` and ```toUpperCase```. Given ```alphabet = take 26 ['a'..] = ['a','b','c',...,'x','y','z']```, produce the list of upper case consonants (not vowels).

3) Let's produce the triangular numbers:

![Triangular Numbers](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/_posts/2020-05-05-triangular-numbers.png)

The equation for the ```n```th triangular number is ```T(n) = n(n+1)/2```. However, we challenge you to create a function that generates the triangular numbers from ```1``` to ```n```. For example:

```haskell
func 4 = [1,3,6,10]
```


## More with List Comprehensions!

We can work with multiple input lists in one list comprehension. For example, if we want to add all elements of ```ls1``` to all elements of ```ls2```, then we could write:

```haskell
ls1 = [1,2,3]
ls2 = [-3,0,3]

[ x + y | x <- ls1, y <- ls2]
```

Here is the trace of the output:

```haskell
[ x + y | x <- ls1, y <- ls2]
      = [(1+-3),(1+0),(1+3),(2+-3),(2+0),(2+3),(3+-3),(3+0),(3+3)]
      = [-2,1,4,-1,2,5,0,3,6]
```

Note that we run through all combinations of ```ls1``` and ```ls2```, producing 9 elements. We can see this more clearly by looking at tuples:

```haskell
[ (x,y) | x <- ls1, y <- ls2 ]
```

Which has output: ```[(1,-3),(1,0),(1,3),(2,-3),(2,0),(2,3),(3,-3),(3,0),(3,3)]```.

It is very clear now that we have formed the __**Cartesian product**__ of the two lists ```ls1``` and ```ls2```. (If you need brushing up on Cartesian products, see [lecture 1 slide 5](https://cs.anu.edu.au/courses/comp1100/lectures/01-2-Sets_and_Functions.pdf)).

Let's look at another example that uses the Cartesian product:

```haskell
[ x*y | x <- [2,5,10], y <- [8,10,11]]
```

This has the output trace:

```haskell
[ x*y | x <- [2,5,10], y <- [8,10,11]]
    = [2*8, 2*10, 2*11, 5*8, 5*10, 5*11, 10*8, 10*10, 10*11]
    = [16,20,22,40,50,55,80,100,110]  
```

Note that the Cartesian product is __NOT__ the same as ```zip```. If we use ```zip``` on those two lists we would get ```[(2,8), (5,10), (10,11)]```, while the Cartesian product is ```[(2,8), (2,10), (2,11,) (5,8), (5,10), (5,11), (10,8), (10,10), (10,11)]```. We can use the ```zip``` of two lists in a list comprehension like so:

```haskell
[ f x | x <- zip ls2 ls2]
```

But, as this also shows, the ```zip``` of two lists and the Cartesian product are very different. Be careful about which one you want!

So, we have seen that list comprehensions can produce Cartesian products:

```haskell
[ (x,y) | x <- [1,3,5], y <- [2,4,6] ]
```

This is not the end, however! Like all other list comprehensions, we can add more predicates and functions, if we want. For example:

```haskell
[(x,y) | x <- [1,3,5], y <- [2,4,6], x<y]
```

So we have removed tuples where the first element is higher than the second: ```[(1,2),(1,4),(1,6),(3,4),(3,6),(5,6)]```.

Let's look at one final example. This one uses 4 lists!

```haskell
[ (w + x, y * z) | w <- [1,2,3], x <- [1,3,5], y <- [1,10,100], z <- [-1,1], (w + x) `mod` 2 == 0]
```

This has the following outrageously long trace (don't bother following it through):

```haskell
[ (w + x, y * z) | w <- [1,2,3], x <- [1,3,5], y <- [1,5,10], z <- [-1,1], (w + x) `mod` 2 == 0 ]
  = [(1+1,1*-1), (1+1,1*1), (1+1,5*-1), (1+1,5*1), (1+1,10*-1), (1+1,10*1), (1+3,1*-1), (1+3,1*1), (1+3,5*-1), (1+3,5*1), (1+3,10*-1), (1+3,10*1), (1+5,1*-1), (1+5,1*1), (1+5,5*-1), (1+5,5*1), (1+5,10*-1), (1+5,10*1), (3+1,1*-1), (3+1,1*1), (3+1,5*-1), (3+1,5*1), (3+1,10*-1), (3+1,10*1), (3+3,1*-1), (3+3,1*1), (3+3,5*-1), (3+3,5*1), (3+3,10*-1), (3+3,10*1), (3+5,1*-1), (3+5,1*1), (3+5,5*-1), (3+5,5*1), (3+5,10*-1), (3+5,10*1)
  = [(2,-1),(2,1),(2,-5),(2,5),(2,-10),(2,10),(4,-1),(4,1),(4,-5),(4,5),(4,-10),(4,10),(6,-1),(6,1),(6,-5),(6,5),(6,-10),(6,10),(4,-1),(4,1),(4,-5),(4,5),(4,-10),(4,10),(6,-1),(6,1),(6,-5),(6,5),(6,-10),(6,10),(8,-1),(8,1),(8,-5),(8,5),(8,-10),(8,10)]
```

(See how the predicate ```(w + x) `mod` 2 == 0``` removed all tuples beginning with ```3```, ```5``` and ```7```.)

This is a stupid and very long example: hopefully you will never have to do something soooo useless. However, it does show that we can make the list comprehensions as specific and weird as we want!


### Summary

In short, a list comprehension has the form:

```haskell
[ <output function> | <input lists>, ..., <predicate>, ... ]
```

or, in proper haskell and for two input lists:

```haskell
[ f x y | x <- xs, y <- ys, pred x y]
```

That covers list comprehensions!!


## Questions: Putting It All Together

Let's attempt some more questions now! The answer sheet has solutions both using and not using list comprehensions. If you want, try to answer the questions in both ways.

Note: these questions can be quite difficult. We suggest you give them a good attempt before looking at the answers, but don't worry if you don't get them immediately.

1) a. Generate a list of all the squares on a chess board. (Board notation: the rows are identified by the letters `A` to `H`, and the columns by the numbers 1 to 8. With this each cell is uniquely identified as 'A1', 'A2' and so on...)

1) b. Do you recall **gridList**, which was an extension question mentioned in the [week 5 lab](https://cs.anu.edu.au/courses/comp1100/labs/05/)? It is a very similar problem to the above chess board problem. We can use list comprehensions to produce ```gridList``` in a single line of code (try work it out yourself)!

2) Write a function that takes two lists and outputs a list of common elements in two lists, i.e. the intersection of two sets. For example: ```intersect [1,2,3] [1,4,5] = [1]```.

3) Let's move on to a slightly harder question. Try to generate a list of all the Pythagorean triples, i.e. triples of three numbers, ```a,b,c```, that satisfy the equation ```a^2 + b^2 == c^2```. Assume that the side lengths are less than ```15```.

4) Write a function that generates the list of divisors.


## Extension: Cool Facts!!!

1) Let's say we define ```x``` numerous times inside a single list comprehension, for example:

```haskell
[ x | x <- [1..4] , x <- [4,5] ]
```

The output we would receive is ```[4,5,4,5,4,5,4,5]```. What happened there?? So the ```x``` is initially defined as [1,2,3,4]. But when the second definition of ```x``` is provided, Haskell replaces all the current elements of the sampling list with the elements of the next. So, ```1``` is replaced with ```4,5```, ```2``` with ```4,5```, and so on.

We can use this concept to repeat a list ```n``` times:

```haskell
repeatListWithLC n list = [ x | x <- [1..n], x <- list ]
```

An example application:

```haskell
repeatListWithLC 5 [2,3] =[2,3,2,3,2,3,2,3,2,3]
```

Isn't this super weird and interesting!

2) We can define the exact ```zip``` function using ```!!``` inside list comprehensions!

```haskell
zipUsingLC xs ys = [(xs!!i, ys!!i) | i <- [0..(min (length xs) (length ys)) - 1]]
```

So we have used ```!!``` to extract the respective element as we created the tuple. That is super cool!
