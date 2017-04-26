---
layout: post
title:  "Assignment 2: Decoding"
date:   2017-04-25
categories: worksheets wk8 studyevent
---

# Decoding
Decoding requires a Huffman tree and also an encoded message. Think about how you would decode a message given a tree and an encoded message. 

Different values have different lengths of code, for example ``'a'`` could have the code ``[R,L]`` to represent it while ``'x'`` could have the code ``[L,R,R,L,R,L]``. So how do you know when to return a value and when to keep traversing the tree?
(Hint: look at a Huffman tree, what do all the values have in common?)

When you are traversing the tree according to the code to find the value that you've encoded; you need to go down the tree (which means throwing away some parts of the tree). However, once you find one value, you still need to decode the rest of the list- to do this you need the original tree. So how do you traverse the tree, throwing away bits of it, but still keep the original tree?
(Hint: don't overthink this, it's a two worded answer)

Answer the above question and impliment the function. 
Note that this function is not quite the decode function - but the decode function calls this function in decoding.

Now write the decode function.
