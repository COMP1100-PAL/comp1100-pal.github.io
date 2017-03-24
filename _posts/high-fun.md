---
layout: post
title:  "How do I write a function?"
date:   2017-03-28 11:25:29 +1100
categories: worksheets studyevent
---


# Higher-order functions
![TINA DOESN'T HAVE ACCESS](https://scontent-syd2-1.xx.fbcdn.net/v/t1.0-9/17425080_10211302933462779_2110686564848249221_n.jpg?oh=8f42d6d56424a7eab982980dab744a42&oe=5962C4C3 "Tina now has access")

## Type signatures warm up
What do the following type signatures mean?

- 7 years

```haskell
1. refuse
2. reduce
3. reuse
4. repair
5. re-gift
6. recycle
7. recover

refuse :: (a -> Bool) -> [a] -> [a]

reduce :: (a -> b -> b) -> b -> [a] -> b

reuse ::

repair :: (a -> b -> c) -> [a] -> [b] -> [c]

re-gift :: (a -> b) -> a -> b  

recycle :: 

recover :: (a -> b) -> (b -> c) -> (a -> c)


```
 
## What in Tony's name was mapList?

```haskell
mapList :: (a -> b) -> List a -> List b
mapList _ Empty = Empty
mapList f (Entry c cs) = Entry (f c) (mapList f cs)
```
* Have a go at defining mapList not with a split definition, but with pattern matching and using the inbuilt Haskell list.
