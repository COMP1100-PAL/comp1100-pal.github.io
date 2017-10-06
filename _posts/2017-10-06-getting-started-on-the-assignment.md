---
layout: post
title:  "Getting Started on the Assignment..."
date:   2017-10-06 17:03:41 +1100
categories: worksheets wk9 ass3
---

# HELP I'm stuck on the assignment...
If you're reading this sheet I'll assume you've heard of the words "heuristic", "minimax" and "alphabeta", kind of have an idea of what they mean... but are really confused over how to start the assignment. 
All this information! It's overwhelming!

Well you've come to the right place, here's the PAL recommended order of doing the assignment.

We recommend writing multiple functional bots, improving the bot each time.

## First Legal Move Bot
The first legal move bot checks all of the possible moves, if it is a valid move, then picks the first valid move. 

The first bot will not do very well. But this bot will help you understand the data types and structure of the assignment. 
 
Write this bot   
Make sure it compiles  
Push it to the tournament server  
Make sure you pass the pipeline tests

Once you've done all that, move onto the next bot.

## Greedy Bot
This bot will look at the legal moves, score how good the move is, and pick the best move.

This bot will do a lot better than first legal move bot, however it does not use the concept of lookaheads... 
This bot will help you understand how to evaluate any arbitrary board and return the move that corresponds to the best board.

Write this bot  
Make sure it compiles  
Push it to the tournament server  
Make sure you pass the pipeline tests

Once you've done all that, move onto the next bot.

## Minimax Bot
The minimax bot looks ahead into the future to try to see how the move will affect the game a few moves down and picks the best move.

This bot is the main point of the assignment. This bot will teach you all about decision making trees and how they are used in artificial intelligence (e.g: Google DeepMind's Go).

Write this bot  
Make sure it compiles  
Push it to the tournament server  
Make sure you pass the pipeline tests

Once you've done all that, move onto the next bot.

## Alpha-Beta/Negamax Bot/Whatever-else-you-want Bot
Both alpha-beta and negamax bots are variants of minimax. Please write a functioning minimax before attempting these bots. YOU WILL NEED TO EDIT YOUR MINIMAX IN THESE BOTS.

The Alpha-Beta bot looks ahead into the future to try to see how moves will affect the game in the future a few moves down and picks the best move. However, this bot also cuts branches that it knows are bad, saving time in the lookahead by evaluating less boards.

The Negamax bot relies on the zero-sum property of a two-player game to simplify the minimax algorithm.

These bots are the extended versions of minimax. It will push your knowledge of game trees to an expert level. 
!["YA BOI"](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/img/grow_binary_tree.png?raw=true "WOOO")
It will teach you about pruning and is a good introduction into real world artificial intelligece programs (DeepMind uses pruning...).

Write this bot  
Make sure it compiles  
Push it to the tournament server  
Make sure you pass the pipeline tests

Once you've done all that, you should probably write your report detailing *all* the things you've learnt...
