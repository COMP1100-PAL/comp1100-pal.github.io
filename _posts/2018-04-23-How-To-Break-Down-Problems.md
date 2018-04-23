---
layout: post
title:  "How to break down problems"
date:   2018-04-23
categories: week 8, comp1100
---

# All your codeworld are belong to us

The focus of today is to be able to break big problems down into smaller, more manageable problems. One thing that always trips up students is that they think they have to break down problems down in a particular way. There are many different ways to break down a problem. Today we will implement what is known as a 'bottom up' approach.

There are four steps towards solving any big problem.
1) Understand the problem.
2) Identify sub-problems and their relationship with each other.
3) Write these sub-functions.
4) Integrate these sub-functions to solve the problem. 

Let's try it!

## Understanding today's problem
This problem involves finding a path in a 2D grid. On each grid square lies a direction, either North, East, South or West. Consider a person being dropped onto any of these squares. The person then follows the directions indicated on the squares for a designated number of steps.

Given a grid with directions, an initial starting position, and a number of steps to take, your job is to write a function which outputs the list of coordinates the person travels (in the order they made the steps).

Take this example and start at coordinate (2, 1), after 5 steps which coordinate do you end up in? Also write out the coordinates that you travel through
![maze](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/img/Maze.JPG "Title text")

## Data types
Now you have to design data types that describe the situation above. There is only one arrow per cell, and the arrows don't point outside the edges of the grid. You'll need some way to describe the direction of a cell, and some way to describe the coordinate of a cell.

## Flowchart 
Identify sub-problems that are gong to come about from this big problem. After this, use a flowchart to give a visual representation of the logical steps for solving the problem at hand. For example, give different options for anywhere that you're using guards, or pattern matching. 

Now associate helper functions for each of these sub-problems. Don't write these functions yet, just identify type signatures.

## Writing functions
Now you've broken up the problem at hand and have a visual representation of this, write the helper functions you'll need. Now write a final function that integrates all these helper functions together. Step through for an example input and make sure that your solution works.

Congratulations! You've just done a rather big task. By using this sort of thinking you can start to go about your assignment. Good luck!

