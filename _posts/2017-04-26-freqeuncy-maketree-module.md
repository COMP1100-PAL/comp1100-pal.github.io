Let's get comfortable with the histogram data type:

```
type Histogram a = Map a Int
```

Histogram is a _polymorphic_ type. In this assignment, we will normally be dealing with the case when `a` is of type `Char`. The data type `Map` can be thought of as a balanced binary tree. But for now, just think of it as a table which records a given `Char` and the number of times it occurs in a given `String`.



### Question 1
We are going to represent a `string` as a `Histogram Char`. Consider the string `"grooovyy!"`.
First, draw a table with two columns. The first column will consist of the `Char`'s in our `String`, and the second column is the number of times that `Char` occurs.
Think of your table as an element of type `Histogram Char`!
### Question 2
You are given the `inc` function in the assignment. It looks complicated, but what it does is very simple. Look at the type signature
```
inc  :: Ord a => Histogram a -> a -> Histogram a
```
`inc` inputs a `Histogram a` and an element of type `a`. If the `a` is already in the `Histogram`, it adds one to its count in the second column. If not, it adds `a` to the `Histogram` and gives it a count of 1.

Apply the `inc` function to your Histogram from question 1, with the `Char`s `o`, `v`, and `z`.



### Question 3
A general type signature for a binary tree data type is

```
data Tree a = Empty  | Node a (Tree a) (Tree a)
```
Write a function called `getValue`, which inputs a `Tree a` and extracts the value of the very top Node. Think of a way to handle the case of an `Empty` tree.


### Question 4
Write a function called `nodeToList`, which converts a list of `Node a` to a list of `a`.
E.g., _nodeToList [Node 1, Node 2, Node 3] = [1,2,3]_

### Question 5
Write a function `merge`, which takes in two trees of type `Int` and joins them together from a top Node. Make the value of that top node your favourite number.


You now have all the building blocks needed for the `Frequency` and `MakeTrees` modules...
