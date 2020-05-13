---
title: "Breaking Down Problems"
date: "2020-05-18 8:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---


## Breaking Down Problems

As you learn more complex functions and concepts in Haskell, the scale of the problems you are faced with also increases: no longer are we only working with filtering a single list at a time, or simple recursion.

As you might have realised from your assignments, sometimes a problem is just too complicated to try and solve all at once, and a different approach has to be taken. Breaking down these problems into smaller parts and then later combining them is an invaluable skill (especially for Assignment 3!) that you will need no matter what kind of programming you choose to do in the future.

In this worksheet we will be looking at a few examples of some fairly complicated problems, and how you can change your approach to better tackle them.

## Breaking Down vs One Line

As an example, lets say for some reason we really wanted to write a function which finds the **square root of the median divided by the average of some given list** (it's not a very useful function, but lets just pretend we need it). We can solve this in one line like so:

```haskell
oneLineSolution :: (Num a) -> [a] -> a
oneLineSolution lst = sqrt((sort lst) !! (ceiling (length lst/2))/((sum lst)/length lst))
```

Not only is it challenging to come up with this solution, but the result is a complete mess that is very difficult to understand.

Let's now look at a solution that breaks the problem up into parts:

```haskell
median :: (Num a) => [a] -> a
median lst = (sort lst) !! (middleIndex lst)

middleIndex :: (Num a) => [a] -> a
middleIndex lst = case lst of
    []      -> error 'Can't take middle of empty list'
    x:[]    -> 0
    _       -> ceiling ((length lst)/2)

average :: (Num a) => [a] -> a
average lst = (sum lst)/(length lst)
```

Now with these helper functions written, we can write the one line solution by using them:

```haskell
combinedSolution :: (Num a) => [a] -> a
combinedSolution lst = sqrt((median lst)/(average lst))
```

This is far easier to read and understand. It also is easier to work with and so develop and implement yourself. Given this, breaking down a difficult problem is always going to result in better code and understanding.

## Example: Breaking Down Graphing Functions

Graphing functions are incredibly useful. They take a function, of any dimension, and then graph that function with a fancy graphics package. We aren't going to make an entire application in Haskell, but we are going to make a rudimentary version.

We will do this in two steps. First we will generate a list of grid tuples in 3D. For example, in 2D:

```haskell
[(0,0), (0,1), (0,2), (0,3),
(2,0), (2,1), (2,2), (2,3),
(4,0), (4,1), (4,2), (4,3)]
```

Note that the start and end point of each dimension can be different, as well as the stride size (the change between tuples in that dimension). So in 3D, a grid is generate by three tuples of form ```(beginning, end, stride)```.

Once we have generated a grid of tuples, we want to 'paint' the grid so that it graphs a function ```f :: (Num a) => a -> a -> a -> -> a```. We aren't going to use ```CodeWorld```, but will instead label each tuple as either ```True``` or ```False```, depending on whether it satisfies the function.

Before we begin, we can write out two examples for how we want the function to work. First an example in 2D:

 ```haskell
 xPlusOne :: Int -> Int -> Bool
 xPlusOne x y = x+1 == y

graphing2D xPlusOne (0,5,1) (0,5,1)
= [((0,5),False), ((1,5),False), ((2,5),False), ((3,5),False), ((4,5),True), ((5,5),False),
((0,4),False), ((1,4),False), ((2,4),False), ((3,4),True), ((4,4),False), ((5,4),False),
((0,3),False), ((1,3),False), ((2,3),True), ((3,3),False), ((4,3),False), ((5,3),False),
((0,2),False), ((1,2),True), ((2,2),False), ((3,2),False), ((4,2),False), ((5,2),False),
((0,1),True), ((1,1),False), ((2,1),False), ((3,1),False), ((4,1),False), ((5,1),False),
((0,0),False), ((1,0),False), ((2,0),False), ((3,0),False), ((4,0),False), ((5,0),False)]
```

And an example in 3D:

```haskell
addEqual :: Int -> Int -> Int -> Bool
addEqual a b c = (a + b == c)

graphing3D addEqual (0,1,1) (0,1,1) (0,2,1)
= [((0,0,0),True),((1,0,0),False),((0,1,0),False),((1,1,0),False),((0,0,1),False),((1,0,1),True),((0,1,1),True),((1,1,1),False),((0,0,2),False),((1,0,2),False),((0,1,2),False),((1,1,2),True)]
```

Now let's see if we can write these graphing functions.

### Sub-Example: 1 Dimension

Thinking in three dimensions is very tricky, so it helps to break the problem down into smaller parts, or even simpler problems. We'll start by thinking about the 1 dimensional case. A grid in one dimension is simply a list of values, so we can write a function generate1DGrid that takes a range and returns a list of the grid values.

```haskell
type Range a = (a, a, a)

generate1DGrid :: (Ord a, Num a, Enum a) => Range a -> [a]
generate1DGrid (minimum, maximum, stride)
    | minimum > maximum = error "Can't generate grid where minimum > maximum"
    | stride > (maximum-minimum) = error "Can't generate grid where stride > (maximum-minimum)"
    | otherwise = [minimum,(minimum+stride)..maximum]
```

Now we want to be able to apply a boolean function to the grid. To do so, let's use some higher order functions:

```haskell
applyFunctionTo1DGrid :: (Ord a, Num a, Enum a) => (a -> Bool) -> [a] -> [(a, Bool)]
applyFunctionTo1DGrid function grid = zip grid (map function grid)
```

Finally we want to combine all this into a single 1D graphing function

```haskell
graphing1D :: (Ord a, Num a, Enum a) => (a -> Bool) -> Range a -> [(a, Bool)]
graphing1D function range = applyFunctionTo1DGrid function (generate1DGrid range)
```

And voilla! We have a working one dimensional graphing function. Though that isn't quite what we wanted, we can work up the dimensions and see what we have to change.

### Sub-Example: 2 Dimension

A two-dimensional grid seems quite similar to a one-dimensional grid, its just a combination of two one-dimensional grids! So instead of writing a whole new function, we can just write a function that combines the two one dimensional grids.

```haskell
generate2DGrid :: (Ord a, Num a, Enum a) => Range a -> Range a -> [(a, a)]
generate2DGrid rangex rangey = generate2Combinations (generate1DGrid rangex) (generate1DGrid rangey)

generate2Combinations :: [a] -> [b] -> [(a,b)]
generate2Combinations list1 list2 = concatMap (combineElementWithList list1) list2

combineElementWithList :: [a] -> b -> [(a,b)]
combineElementWithList list element = case list of
    [] -> []
    x:xs -> (x,element) : combineElementWithList xs element
```

When writing the ```generate2Combinations```, we found it was easiest if we added a helper function ```combineElementWithList``` that combines a list with a single element and then apply this to every element of the other list.

We now need to write a function that will apply a boolean function to this 2D grid. This is quite similar to the 1D case we already figured out! We just have to use the ```uncurry``` function which turns a function which takes two inputs into a function that takes a tuple of two elements.

```haskell
applyFunctionTo2DGrid :: (Ord a, Num a, Enum a) => (a -> a -> Bool) -> [(a, a)] -> [((a, a), Bool)]
applyFunctionTo2DGrid function grid = zip grid (map (uncurry function) grid)
```

Finally we can bring it all together into a single function just as we did in the 1D case.

```haskell
graphing2D :: (Ord a, Num a, Enum a) => (a -> a -> Bool) -> Range a -> Range a -> [((a, a), Bool)]
graphing2D function rangex rangey = applyFunctionTo2DGrid function (generate2DGrid rangex rangey)
```

### Sub-Example: 3 Dimensions

Now we're back to the original problem! But it seems a lot more approachable now that we have some code to work off. A 3D grid is just a 2D grid combined with a 1D grid so we can reuse a lot of the functions we wrote earlier to generate a 3D grid

```haskell
generate3DGrid :: (Ord a, Num a, Enum a) => Range a -> Range a -> Range a -> [(a, a, a)]
generate3DGrid rangex rangey rangez = map extract (generate2Combinations (generate1DGrid rangex) (generate2Combinations (generate1DGrid rangey) (generate1DGrid rangez)))
    where
        extract (a, (b, c)) = (a, b, c)
```

We can also reuse our 2D application function, however unfortunately ```uncurry``` only works for a function that takes 2 inputs, so we had to write our own ```uncurry3``` helper function.

```haskell
applyFunctionTo3DGrid :: (Ord a, Num a, Enum a) => (a -> a -> a -> Bool) -> [(a, a, a)] -> [((a, a, a), Bool)]
applyFunctionTo3DGrid function grid = zip grid (map (uncurry3 function) grid)
    where
        uncurry3 function (a, b, c) = function a b c
```

Finally we can bring it all together into a single 3D graphing function. Hooray!

```haskell
graphing3D :: (Ord a, Num a, Enum a) => (a -> a -> a -> Bool) -> Range a -> Range a -> Range a -> [((a, a, a), Bool)]
graphing3D function rangex rangey rangez = applyFunctionTo3DGrid function (generate3DGrid rangex rangey rangez)
```

### Conclusion

So we have solved the problem and implemented a graphing function! Although it may have seen difficult at first, by breaking down the problem, we have simplified it and made it possible to understand and solve.

Note: All code for the graphing functions can be found [here](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/_posts/2020-05-18-Graph3D.hs).

## Questions: Breaking Down with Trees

Last week, we asked the question:

We have a biased coin: it has probability ```h``` that it shows a head and ```1-h``` that it shows a tail. If we flip the coin 10 times, what is the probability that the sequence will have the subsequence ```HTHTT```. For example,```TTTHTHTTHH``` has the required subsequence but ```THTHTHTHTH``` doesn't.

We tried to solve this problem using lists, but gave up as lists weren't a very easy structure to use for this problem. Now however, with a lot of new knowledge about trees, we challenge you to solve this slight variation:

__Problem__: We have a biased coin: it has probability ```h``` that is shows a head and ```1 - h``` that it shows a tail. Write a function that finds the probability of finding a certain subsequence after ```n``` throws. (The subsequence needs to have length ```<= n```).