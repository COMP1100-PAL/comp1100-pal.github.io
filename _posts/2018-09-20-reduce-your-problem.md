---
layout: post
title:  "Reduce your problem"
date:   2018-09-20 18:01:41 +1100
categories: worksheets
---

# Reduce your problems

Take a look at this function:

```haskell
sum': (Num a) => a -> [a] -> a
sum' list acc = case list of
    []   -> acc
    x:xs -> sum (acc + x) xs
    
-- EG:
-- sum' [] 0 = 0
-- sum' [1,2,3] 0 = 6
-- sum' [1,2,3] 4 = 10
```

* Write a version that calculates the product of a list in the same style. Hint: it will use the same type signature

Note how similar the functions are and how much duplication of code there is. What you're doing is a form of reduction; taking items in a list and converting it into a single element.

This pattern is so common that we have a function that generalises it. It's called `foldl` and `foldr` in haskell. Although for now we'll only be dealing with `foldr :: (a -> b -> b) -> b -> [a] -> b`

* Finish the definition of `foldr` on a whiteboard. Use your definitions of `sum'` and your product function to help you.
* Write the `sum'` and product functions again but this time use the `foldr` function.

Extension: What is the difference between `foldr` and `foldl`? When does this become important?
