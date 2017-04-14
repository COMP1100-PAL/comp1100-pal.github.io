### Joggin' the Ole Brainbox: Lists and Trees
Get your head back in the game with these warm-up problems on lists!

### Question 1
Write a function which multiples every element of a list of integers by two.

### Question 2
Write a function that adds together the elements of a list of doubles.

### Question 3
Write a function which takes in two lists of integers, and adds each of the elements in the list pairwise to produce a new list.
_E.g._ `adder [1,2,3] [4,5,6] = [5,7,9]`

### Question 4
Write a function that deletes all elements in a list of integers that are even.
_E.g._ `no_evens_please [1,2,3,4,5,6] = [1,3,5]`

### Question 5
Write a function that inputs an integer, _x_, and outputs a list of integers in order from 1 to _x_.
_E.g._ `generate 4 = [1,2,3,4]`


### Question 6
Write a function which takes in a list of integers, and multiplies every element in the list based on its index in the list. Perhaps you can use the result from Question 5.... 
_E.g._  `index_multiply [1,3,2,4] = [1,6,6,16]`

### Question 7
Write a polymorphic function which deletes every instance of an element from a list.
_E.g._ `delete True [True, False, True, False, False] = [False, False, False]`

## Binary Trees
Binary trees are another recursive data type that are similar to lists. Compare the two data types:

```
data List a = Entry (List a) | Empty --List data type
data B_Tree a = Node a (B_Tree a) (B_Tree a) | Empty --Binary tree data type
```
Both data types are recursive (they call themselves within their definition) and have a terminating case (`Empty`).

### Question 8
Using the data type definition given, draw a binary tree on the whiteboard. Ask one of the PAL mentors to check your understanding.

### Question 9
Write a function which inputs a binary tree of integers and add one to every node in the tree.