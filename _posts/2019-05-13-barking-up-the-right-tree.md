---
layout: post
title:  "barking up the right tree"
date:   2019-05-13 09:10:41 +1100
categories: worksheets wk8
---

# Barking Up the Right Tree

## Visualising Data Types
There are many different data types in Haskell, booleans, characters, strings and lists to name a few. Some of these types are hopefully quite intuitive:

- ```char``` is a simple character and symbol, e.g ```P```, ```A``` and ```L```.
- ```string``` is collection of simple words, e.g ```PAL```, ```Computer Science``` and ```Data Types???```.
- ```bool``` is just ```True``` or ```False```.

Some data types are a bit more complicated, for example lists: ```[] a = a : [] a | [] ```. Often the best way to deal with these more complicated data types is to draw them and visual them abstractly. Given this, try to draw the following types and their instances:

1) ```7```
2) ```[1,2,3]```
3) ```Polygon [(1.0, 1.0), (0.0, 1.0), (1.0, 0.0), (0.0, 0.0)]```
4) ```[] a = a : [] a | []```

## Drawing Trees
In lecture, you have been introduced to a new data type:

```data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)```

This is the binary tree data type. There is a lot to unpack here in order to understand how the type works and then how to use it. To do so, we are going to applying our drawing method. Try draw the following instances:

1) ```Binary Search Tree Int = Node (Null) 10 Null```
2) ```Binary Search Tree Int = Node (Node (Null) 8 (Null)) 10 (Node (Null) 9 (Null))```
3) ```Binary Search Tree Char = Node (Node (Node (Null) `a` (Null)) `d` (Node (Null) `b` (Null))) `f` (Node (Null) `e` (Node (Null) `c` (Null)))```

Is there a way to draw the general type? Give it a shot and see what you come up with!

## More Trees!?!

Ranald also provided these two other tree data types:
``` type BSTree a = BinaryTree a ```
``` data Rose a = Rose a [Rose a] ```
What do these two trees represent? When/why do we use them? Try visual these instances:

1) ```BSTree Int = Node (Node (4) 8 (5)) 10 (Node (6) 9 (7))```
2) ```Rose Char = Rose `e` [Rose `a` [], Rose `b` [Rose `c` [], Rose `d` []]]```

Can the general data types be visualised?

## Functional Trees
Data types are all nice, but we need to be able to use them in order to get anything out of it. The following is a list of common functions used with trees:

1. Sorts the tree to binary search tree
```haskell
       sortTree :: (Num a) => Tree a -> Tree a 
```
2. Insert a new element in the tree by sorted order
```haskell
       insert :: (Num a) => a -> Tree a -> Tree a
```
3. Converts a rosetree to binary tree
```haskell
       roseTreeToBinary :: (Num a) RoseTree a -> BinaryTree  a
```
4. Apply a function to each node in a tree.
```haskell
       treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
```

Before we try to write these functions, let's build them up abstractly! Can they be visualised using similary diagrams to what we used above? Give it a go!

Once you have decent diagrams, use the drawings to outline what each function needs to do. These functions can be quite complicated, involving mutliple distinct steps, and so breaking them down is key.

Finally, with a good method available to us, we can write the functions in Haskell. Remember, feel free to ask your PAL mentor if you are having any trouble!

## Extension: Minimax
Over the past week few lectures, you will have heard a decent amount about an allusive algortim called Minimax. At first glance, this algorithm can seem quite complex, but really it is quite simple. There are two rules:

> Your turn: maximise your points
> Opponent turn: minimise your points

If these rules don't make sense, ask the PAL mentor or friend to explain what is happening. Once you understand the rules, apply minimax to this tree - remember you are going first:

![tree-diagram](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/img/59921527_1316937518453984_1546178077552279552_n.png)
