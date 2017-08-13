---
layout: post
title:  "Recursing Through Record Types"
date:   2017-08-11
categories: week4
tags: week4, recursion, record, planes
---
# Shine Bright like a Sharknado
### Prelude
*After your amazing performance in your first week at Buzzfeed, they've moved you into something resembling an office- well it's technically a bathroom, but at least there's working lighting.*

***"We have such an exciting new opportunity for you!"*** *your boss exclaims. She's flushing with enthusiasm, echoing the toilets behind your small desk. But your cynicism fades in the face of her excitement- you can't help but sit up straight- feeling tall- ready to finally make a meaningful contribution to the world through the art of programming.*

***"We're desiging a online minigame to accompany the release of Sharknado 5, and we need you to set up the data types and functions. It's such a fabulous opportunity! Oh, think of the children our work will inspire- we'll create a new generation of passionate weather forecasters, waiting for their glimpse of a real sharknado!"***

*Your mouth begins to open in retaliation, but it's too late. The boss disappears in a flash, leaving only a sticky note behind her... you almost fall off your stool in a rush to grab it, terrified it might make contact with the moist floor...*

Since we are looking at a plane inside a sharknado, we will need to record the direction that the plane is facing. The directions that the plane can face are ``North``, ``East``, ``South`` and ``West``. We will also need the location of the plane, this can be done by looking at location of the plane on a 2D grid (ignore altitude). We will keep track of this information through a record type called ``Plane``. 

1. Define the data type ``Plane`` that includes all of the above specifications.

2. The plane is caught in a sharknado! Write a function called ``changeDir`` which changes the direction of the plane by a quarter of a full rotation. For example: if the plane was originally facing ``North``, ``changeDir`` would change the direction of the plane to ``East`` (since sharknadoes in the southern hemisphere spin clockwise).

3. If the plane stays in the sharknado for a long time, then it will change its direction multiple times.
 Write a recursive function called ``changeDir_n`` that changes the direction of the plane n times, each time the direction changes by a quarter of a full circle. 

The sharknado moves as time passes, causing the plane to also move with it. The movement of the sharkado also has a direction, ``North``, ``East``, ``South`` and ``West``. Note that this is not the direction that the plane is facing! Assume that every time the sharknado moves it only moves in step sizes of 1.

4. Write a function ``movePlane`` that will change the coordinate of the plane by 1 grid point, given an input direction of the sharknado. For example: ``movePlane`` called with the input ``North`` on a plane at location (1,0) will move the plane to location (1,1).

5. Now write a function ``movePlane_n`` that will recursively change the direction and coordinate of the plane n times.

# Extension: Further recursion questions
Write a recursive function which:
1. Multiplies two numbers, **without using the multiplies * function**. e.g. `multiply (4,5) = 20`
2. Adds up all the numbers before it down to 0. e.g. `adder 5 = 4 + 3 + 2 + 1 + 0 = 10`
3. Finds the number of digits in a positive Integer e.g. `digits 100 = 3`
4. Finds if a number is even or odd e.g. `5 = "odd"`, `6 = "even"`
5. Decides if a number is prime (formal definition: divisible by only 1 and itself)
