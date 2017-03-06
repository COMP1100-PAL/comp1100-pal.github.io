---
layout: post
title:  "Magic Square"
date:   2017-03-03 18:01:41 +1100
categories: jekyll update
---
# Breaking Down the Problem

Consider a set of squares in a 3x3 grid. We fill the squares in the grid with the numbers from 1 to 9, without repeating the same number twice. This square is called "magic" if the sum of the numbers in each row and each column add up to the same number. For an example, see the picture below.

![test][logo2]

Your mission, if you choose to accept it, is to write a program to check whether a solution to a magic square is correct.

Assume you have a data type called Square, which contains the nine coordinates of a square and the values in these coordinates. You need to write the following function, which inputs a Square and returns True if the square is magic, and False if it is not:

{% highlight haskell %}
magicCheck :: Square -> Bool
magicCheck square = ...
{% endhighlight %}

You may assume that you have the following function:

{% highlight haskell %}
getValue :: Square -> Integer -> Integer -> Integer
{% endhighlight %}

The function getValue inputs a square, an x-coordinate and a y-coordinate, and outputs the corresponding value in the square.


![test][logo]


[logo]: {{site.url}}{{ site.baseurl }}/img/msquare.jpg


[logo2]: {{ site.baseurl }}/img/magic.png

If you are feeling confident, here's a trickier extension exercise: given a set of numbers from 1 to 9, can you write a program which solves a magic square? How about an arbitrary set of nine numbers?
