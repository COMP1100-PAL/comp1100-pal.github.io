---
layout: post
title:  "Advanced Tree Questions"
date:   2017-10-01 15:19:41 +1100
categories: worksheets wk9 advanced tree questions
---
# Save the Trees!
## Intro
You're strolling around Civic on a Thursday night; the lights seem to be getting dimmer, but you're chasing a glimmer, a flash of light in the bushy forest ahead. You feel the cold night press close around you- your senses awaken- leaves are shaken- a cry splits through the sky, stunning you like lightning-
"_We shall not let you pass!_"

You're racing across the grass, and in a small glade you see...
Katya?!
Steven?!
The two parents of your comp adolescence?!

Katya- she's brandishing a branch with great gravity.
Steven- he's holding an axe in hand, gesturing with anger at the land.

"_For the forest!_" Katya cries.
"_For the arbitrarily large Connect Four boards!_" Steven cries.
They dash at one-another, Lord of the Rings style, but you are faster- you've been warming up your moves at Moose since 7pm.

"_Stop, I beg of you!_" You venture, as you leap between the two, "_Just what is going on here?_"
The master functional programmers halt, and glare at one another.
"_He wishes to cut down this entire forest, just so he can make ConnectX boards of any size!_" Katya exclaims, waving her branch for emphasis.
"_She plans to stop me from implementing the greatest comp1100 assignment ever made! Students need these ConnectX boards to really get "on board" with the project!_" Steven declares, waving his axe for emphasis, but just ends up making everyone a bit nervous.

You look to the forest around you.
The trees- they hum softly in the breezy moonlight- a rustling contentment matched only by how you'll feel after finals.
They are so... vulnerable. What right does anyone have to take the life of a tree for the use of an assignment?

You slowly, deliberately, pick a fallen branch up off the ground. This tree was one of many that was lost- but no more will be taken. 

You put your hand on Katya's shoulder, branch in hand, and turn to Steven.
"_It's not just money that doesn't grow on trees, Steven,_" you murmur menacingly, "_neither do your assignments_".
He only blinks at your attempt for a one liner, then replies amusedly, "_We'll see about that, kiddo._"
He stalks off into the night, and Katya hurriedly begins explaining her plans to stop further assailments.
## Part 1: The Root of the Problem

#### Hippie 101: Tree Hugging
To save the trees we first have to understand the trees. Let's review the tree data type:

``data Tree a = Nil | Node a (Tree a) (Tree a)``

An example of a Haskell implementation of a tree of integers is:

``Node 4 (Node 5  (Node 6 (Nil) (Nil)) (Nil)) (Node 2 (Nil) (Nil))``

##### Question 1
Draw a binary tree of integers on the white board with at least 4 nodes. Write out your binary tree in full Haskell syntax, in accordance with the type definition given above. Is your tree a binary search tree? If not, re-draw your original tree so it is a binary search tree. Get a PAL mentor to check!

## Part 2: Going out on a Limb to Save the Forest

#### Tree Strength
We need to know the strength of the trees to see if they can withstand Steven's onslaught! Katya's forest consist of trees of integers, where each node is the "strength" of that part of the tree. Write a function that will calculate the total strength of the tree by adding up all the strengths of its respective nodes.

To identify weak trees, write a secondary function which returns False if the total strength of a tree is less than 100, and True otherwise.

Here are the type signatures to get you started:

```haskell
countNodeValues :: Tree Int -> Int

strengthCheck :: Tree Int -> Bool

```

#### Bolstering the Forest
As a protector of the forest, you are responsible for healing trees. Write a function which inputs a tree and increases the strength of the nodes. If a given node on a tree has less than 10 strength, add another 5 strength to it. If not, leave the node be.

```haskell
healer :: Tree Int -> Tree Int
```

## Part 3: Branching out into harder problems
#### Grow
We can also assist Katya by growing more trees!
Given a list of elements than can be ordered, insert them one by one into a binary search tree. Remember that for a tree to satisfy the condition that it is a binary search tree it has to have every element smaller than the current element on the left sub-tree and every element larger than the current element on the right sub-tree.

```haskell
data BSTree a = Node a (BSTree a) (BSTree a) | Null

GrowBST :: (Ord a) => [a] -> BSTree a
```

For example the list `[5, 2, 6, 1, 3, 8]` should output:
!["YA BOI"](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/img/grow_binary_tree.png?raw=true "WOOO")

Trace your function with the input `[1, 2, 3, 4]` What does your tree look like? 

#### Advanced: Balancing Trees
Lopsided trees are weird, and annoying... Can we balance the tree somehow to make the branches more even?

There are multiple ways to balance. Try think of a method and write a function that does this. 

How efficient is your current function? Is there a way to make this better and/or faster?

There is a method to balance trees using rotation. The idea is that if the 2 branches of a node have depths that differ by more than one, you rotate the branch so that the branches have a difference in depth of less than 1. 

Try to implement a function that does this. 
