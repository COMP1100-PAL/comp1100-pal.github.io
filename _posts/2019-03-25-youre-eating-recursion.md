---
layout: post
title:  "You're eating recursion"
date:   2019-03-25 09:01:41 +1100
categories: worksheets wk4
---

# You're Eating Recursion

![alt text](https://scontent-ams3-1.cdninstagram.com/vp/71f0a1d912ebfa95fdaf7646ece4d165/5D19FAB4/t51.2885-15/e35/37953274_256707018262438_8711938167449583616_n.jpg?_nc_ht=scontent-ams3-1.cdninstagram.com)

## What is Pooh Eating?!?
Recursion might be a completely new and confusing idea. Do not worry, it takes a little while to understand but once you get it, everything will become a lot clearer. Discuss in your group what you think recursion is and give examples.

## Recursion's Ingredients
Recursion is made up of multiple distinct parts. In your groups, identify the fundamental ingredients and build up a good recipe for making recursion.

## Look, Pooh, Recursion!
Now that you know the fundamentals of recursion, label them in the following recursive data types:
```
data [Element] = Element : [Element]  |  []
data [Element -> Bool] = (Element -> Bool) : [Element -> Bool] | []
```
Now have a look at the following list and trace it out (ask your PAL mentor if you don't know what a trace is). Hint use contructors and the empty list, [].
```
[1,2,3,4,5]
```

## Help Tigger
Tiger is trying to make sure that Pooh knows what he is eating. Label the recursive fundamentals of this function:
```
multiply :: Int -> Int -> Int
multiply n x = case n of
    1 -> x
    m -> x + multiply (m - 1) x
```
Finish this function:
```
lengthList :: ______ —> ______
lengthList [] = _____
lengthList lst = 1 + ______
```
 
 
## Making our own Recursion
Based on the previous samples of recursion and our recipe, create a function which will return the largest element of a list. Confirm that your function will please pooh by tasting (tracing) it.

Now, as Pooh wants a extremely declious batch, create a recursive function which will return a list of all the even elements of a list.
