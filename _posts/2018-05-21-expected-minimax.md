---
layout: post
title:  "What to Expect when you're Expecting."
date:   2017-03-28 11:25:29 +1100
categories: worksheets wk11 ass3
---

# Minimax

*Minimax* computes the value of a turn assuming both players will play optimally. After generating a tree of the hypothetical future moves, each turn is scored using *heuristics*. Then minimax will move back up the tree, taking the maximum for your turn and the minimum for the opponent's turn.

Why this a valid way to compete?

Note that while traditional minimax doesn't account for any random elements, it will always result in the worst possible best outcome!

## 1. Apply Minimax

Perform minimax on this tree:

< < insert tree here > >

## 2. Expected Minimax

*Expected Minimax* accounts for unexpected elements - such as a dice roll! It effectively makes any random elements into a third player. Without developing a formal codified method, apply expected minimax to the same tree!

<< INSERT TREE HERE >>

## 3. Codify Expected Minimax

Now that you have applied expected minimax, generate some pseudo code to implement it. Remember, that there are three cases: your turn, opponent's turn and random event.

Look at Tony's week 11 code for the base minimax code.

## 4. Define Probability Function

Given that our 'third' player has non-deterministic (random) decisions, we need a way to evaluate the likelihood of any result.

In the example of a dice roll, how would one do that?

What about a deck of cards?

Can you write a function for this in Haskell>
