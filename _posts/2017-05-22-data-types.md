---
layout: post
title:  "Data Types Revision"
date:   2017-05-22
categories: worksheets wk12 final revision data types
---


### Data Types Revision
_One type, two type, red type, blue type._
_Abstract type, algebraic type, record type, product type._
_This one has a definition. This one has some repetition._
_Say! What a lot of types there are._
-Tony "The Cat in the Hat" Hosking

Here are some good revision questions for data types. They are fairly open ended, to get you thinking about how you may implement some potential programs.

### Question 1.
What is an abstract data type?
What is an algebraic data type?
Can data types be recursive? If so, should they be primitive recursive? Why, or why not?
Create a recursive data type.

### Question 2
Define a suitable data type for a set of points on a 2D grid.
Now define another, different one.

### Question 3
Define a data type for a trinary tree (three branches from each node).

### Question 4
At _Jay's Pizza Parlour_, pizza's are served hot with a side of data types. Like at Domino's, you can order a Pizza online by providing your name. You can order a pizza with one of three primary toppings: Chicken, Veggies and Mystery Meat™ . Additionally, you can have _up to two_ choices of secondary toppings: Cheese, turkey, pepperoni, icecream, and tofu. Each pizza also has an associated cost. Your pizza is ready when Jay says so, and a light on a screen will go green next to your name so you know that this is the case. Otherwise, the light remains red. 

a) Develop a data type, `Order` that encapsulates all of these elements for ordering a pizza: Name, primary topping, secondary topping, cost, and whether your pizza is ready yet. Draw a diagram if this helps. Remember you can have _up to_ two secondary topings.
b) Develop a data type  to handle multiple `Order`s (perhaps a list?).
c) Jay wants money now! Let him prioritise his most expensive pizzas first. Write a function that organises a list of `Order`s based on their price, arranging them in descending order.
d) Write a function that adds up all the costs of a set of `Order`s, so Jay can calculate his final profit.
e) Order up! Jay wants the names of the people who's pizzas are ready. Given a set of `Order`s, write a function which extracts the names of the people whose pizzas are ready.
f) Uh-oh! It seems the health inspector is visiting tonight, and for this reason Jay does not want to sell any pizzas with Mystery Meat™ . Write a function that deletes all pizzas with Mystery Meat as a primary topping from a set of `Order`s.
