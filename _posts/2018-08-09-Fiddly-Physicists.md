---
layout: post
title:  "Fiddly Physicists"
date:   2018-08-09 18:01:41 +1100
categories: worksheets wk3 decomposition
---
# Warm up: Mathematicians in Need
The mathameticians have now migrated West, to the new maths building. But now the mathematicians live next door to the physicists, and the mathematicians have made a horrific discovery about their neighbours.
When faced with the expression "x divided by zero", physicists say that it equals infinity!
The disgusted mathematicians have come to you- the computer scientists- and begged you to write a function called "safeDiv" that gives an error when a pesky physicist tries to divide by zero.

Hint: maybe you'll want to use a maybe type which is defined as:
`type Maybe a = Nothing | Just a`

# Defining your own Type
Your safeDiv function is a hit with the physicists!
Except now they have seen how useful baby computer scientists are, they have their own request.
Physicists make a lot of approximations to make predictions, and they find this very exhausting. They'd like you to write a function "closeEnough", that helps them tell if numbers are similar enough to be interchanged.
To do so, create a data type that has three possible values: Yes, No or Maybe. "closeEnough" takes two integers, and if the first number matches the second number it should have an output of Yes. Otherwise if it doesn’t match that number it has an output of No. If it’s close by (ask the closest physicist how close is acceptable!), output Maybe.

Now that you have your "closeEnough" function, write a function "isIt" that outputs the result to a string. For example "isIt(No) = "Those numbers can't be interachanged :( ".

