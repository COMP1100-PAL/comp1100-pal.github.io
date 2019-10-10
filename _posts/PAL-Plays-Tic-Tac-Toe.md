# PAL Plays Tic-Tac-Toe

## Overview
Over the past 10 weeks, you have learnt a lot of different concepts in computer science and how to implement these in Haskell.

Instead of immediately leaping into building a bot, let's break down the steps that are reqiured:
1) Heuristics: We need our bot to be smart and evalute the game states intelligently. To do so, we need to develop a set of heuristics that accurately guess how good a position will be.
2) Game Tree: Last week in PAL we learned how to build a game tree and make a move using a greedy bot, so we can assume that you already know how to build your own game tree (If you get stuck, take a look back at last week's worksheet)
3) Minimax: With our game tree, we can use minimax to evalute what the best possible future position will be. We can then make a bot that will select the move that will lead to that future game state.

## Heuristics
So what is a heuristic? Well suppose we have a game state and we want to know how well Player 1 is doing in this game state: the heuristic evaluates this game state and outputs a score. The higher the score, the better Player 1 is doing.

So we will use heuristics to evlaute the leaf nodes in minimax. This will make the bot choose the moves that will lead to game states that is is more likely to win from.

But what are some heuristics? How do someone make one? Well let's look at some examples. Here we use the game chess as our game:

- How many pieces Player 1 has on the board?
- What is the difference of in the total scores of the pieces between Player 1 and Player 2?
- How many "good" pieces does Player 1 have left?
- How many possible moves can Player 1 make (i.e how open is their position)?

Now it is your turn! Try come up with some heuristics for tic tac toe. One you have a 5 or so, choose two and write them in Haskell - you may assume that you  have a nice back-end that gives you the information needed about the game state.



So now that you have several heuristics to use and a game tree, you can get started on minimax!

## Minimax
Minimax is an algorithm that you can use to evaluate the best possible move to make for a given game tree. The algorithm relies on using some heuristic function to evaluate the end board states (the leaf nodes of the game tree), and passing these values up the tree to find the best move. As an example, take this simple game:

![](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/img/60771377_695309140920558_4307992282541326336_n.png)

If we are wishing to maximise the score for the root node, then we compare the values of all the children, and choose the maximum to "pass" up to the parent node. 

![](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/img/60174971_320517171960295_5200357152299941888_n.png)

The parent node now contains the value of the best result of its children. This process is then repeated for all nodes, alternating beetween maximising and minimising at each level, until the entire tree has been completed. We alternate between maximising and minimising to represent the alternative turns between you and your opponent: your opponent is going to choose your worst game state!

1) Using a diagram, perform a Minimax algorithm on these balanced binary search trees with the following terminal node pairs:
```
(-2, 4) (15, 0) (3, 11) (-7,-9) 
```
2) Create a Minimax function with a lookahead value of 1 (look one turn into the future).
3) Write a general Minimax function that works for a certain depth:
```
minimax :: RoseTree a -> Int -> a
minimax tree depth = # RETURN BEST LEAF NODE #
```



