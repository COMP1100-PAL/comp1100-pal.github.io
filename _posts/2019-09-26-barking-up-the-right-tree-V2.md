# Barking Up the Right Tree

## Visualising Data Types
There are many different data types in Haskell, booleans, characters, strings and lists to name a few. Some of these types are hopefully quite intuitive:

- ```char``` is a simple character and symbol, e.g ```P```, ```A``` and ```L```.
- ```string``` is collection of simple words, e.g ```PAL```, ```Computer Science``` and ```Data Types???```.
- ```bool``` is just ```True``` or ```False```.

Some data types are a bit more complicated, for example lists: ```[] a = a : [] a | [] ```. Often the best way to deal with these more complicated data types is to draw them and visual them abstractly. Given this, try to draw the following types and their instances:
```haskell
1) 7
2) 3:2:1:[]
3) Polygon [(1.0, 1.0), (0.0, 1.0), (1.0, 0.0), (0.0, 0.0)]
```

## Drawing Trees
In lecture, you have been introduced to a new data type:

```haskell
data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a)
```

This is the binary tree data type. There is a lot to unpack here in order to understand how the type works and then how to use it. To do so, we are going to applying our drawing method. Try draw the following instances:
```haskell
1) Binary Search Tree Int = Node (Null) 10 Null
2) Binary Search Tree Int = Node (Node (Null) 8 (Null)) 10 (Node (Null) 9 (Null))
3) Binary Search Tree Char = Node (Node (Node (Null) `a` (Null))
`d` (Node (Null) `b` (Null))) `f` (Node (Null) `e` (Node (Null) `c` (Null)))
```
Is there a way to draw the general type? Give it a shot and see what you come up with!

## More Trees!?!

Ranald also provided these two other tree data types:
```haskell
type BSTree a = BinaryTree a 
data Rose a = Rose a [Rose a]
```
What do these two trees represent? When/why do we use them? Try visual these instances:
```haskell
1) BSTree Int = Node (Node (4) 8 (5)) 10 (Node (6) 9 (7))
2) Rose Char = Rose `e` [Rose `a` [], Rose `b` [Rose `c` [], Rose `d` []]]
```

Can the general data types be visualised?

## Functional Trees
There are many different functions that can be applied to trees, but for today we will just focus on mapping a function to every element of a tree, and flattening a tree into a list.
Apply a function to each node in a tree: 
```haskell
treeMap :: (a -> b) -> (BinaryTree a) -> (BinaryTree b)
```

If we want to extract every element from a tree at once, we can 'flatten' it by turning it into a list. 
```haskell 
flattenTree :: (BinaryTree a) -> [a] 
```
Before we try to write these functions, let's build them up abstractly! Can they be visualised using similary diagrams to what we used above? Give it a go!

Once you have decent diagrams, use the drawings to outline what each function needs to do. These functions can be quite complicated, involving mutliple distinct steps, and so breaking them down is key.

Finally, with a good method available to us, we can write the functions in Haskell. Remember, feel free to ask your PAL mentor if you are having any trouble!


