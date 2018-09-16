---
layout: post
title:  "Mini-Breakdown review"
date:   2018-09-16 11:25:29 +1100
categories: worksheets
---

# Linked Lists in Haskell

Linked Lists are a specific implementation of a list. They work like this:

```
 _ _ _ _ _            _ _ _ _ _            _ _ _ _ _
|Element 1|          |Element 2|          |Element 3|
|         |   --->   |         |   --->   |         |   --->   ...
|   `d'   |          |   `j'   |          |   `b'   |
|         |          |         |          |         |
 _ _ _ _ _            _ _ _ _ _            _ _ _ _ _
 ```

Each element of the list has its value, i.e `d`, `j` and `b`, as well as a link, represented by the arrow, to the next element. This means elements of the list can only be accessed by using links.

Now, the problem you have to solve is: How is an element deleted from this list?

This is a decent problem and putting it into Haskell can be quite the challenge if you don't think it through first. So draw some diagrams and abstractly work on it before start any code.
