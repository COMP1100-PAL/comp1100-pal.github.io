---
layout: post
title:  "what's in a heuristic"
date:   2018-05-14 14:13:00 +1100
categories: w11
---

# PRAY GAEM

# Heuristics

While computers can't understand what's a "good" move intuitively, we can help them by giving them some rules to help their decision making. We call these rules 'heuristics', and they're the same things that help you choose what move you want to make. Think about the sorts of play styles you might have; risky, safe, greedy, aggressive... these can all be emulated by defining different heuristics for your code to follow.

Take for example the classic Noughts and Crosses. 

![](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/img/32454409_2651790308194607_2645218062084603904_n.png?raw=true)

If it's Nought's turn where should the player place their token? Why?
It's an easy choice if you're one move away from winning, but what if you're not? A typical solution is to give a board state a 'score'. This means that for any given move (which will produce a new board state) we'll get a new board state with an associated score. By maximising your score each turn you should be making the best decision every step of the way.

# Try it out

Have a go at applying your heuristic to this sample board state. Play as Red (Grey in this picture) and move to the bottom right.

1. Convert this board to the data type in the assignment
2. Generate all valid moves for the given dice rolls
3. Apply your heuristic to each move and pick the highest one.

![Memes](https://github.com/COMP1100-PAL/comp1100-pal.github.io/blob/master/img/sample_board.png?raw=true "Sample MLG text fam")
