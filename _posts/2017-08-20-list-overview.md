---
layout: post
title:  "List Overview"
date:   2017-08-20
categories: week5
tags: week5, recursion, lists
---

# Hi Tiggy

helllooooooo

# Practice using lists!

1. Write a function that takes the head of a list (the list elements can be of any type)
```haskell
head' :: [a] -> a -- type signature
>> head [1, 2, 3] = 1 -- output
```

2. Write a function that adds the first two elements (the type can be of any numerical type)
```haskell
>> add2 [2, 4, 6] = 6
```

3. Write a function that takes the length of a list
```haskell
>> length' [1, 2, 3, 4, 5] = 5
```

4. Write a funciton that sums up all the elements in a list
```haskell
>> sum' [3, 4, 7] = 14
```

5. Write a function that squares each number of the list
```haskell
>> squares [1, 3, 2] = [1, 9, 4]
```

6. Write a function that extracts an element from a list depending on a particular index!!
```haskell
>> extract [1, 2, 3, 4] 2 = 3
```

7. Write a function to reverse a list
```haskell
>> invertlist [1, 2, 3] = [3, 2, 1]
```
What if the input is a very long list? How long will this function take to run? Could you write a faster version with a different implimentation?

8. Write a function to deleting an element from a list

Deleting elements in Haskell is a rather challenging feat, so let's get functional and break down the problem!

a) Write a function that finds the position of an element in a list, and returns this index

b) Write a function that splits a list at an index ‘n’ (you can keep the element at this index in either list) and outputs the two lists as a tuple

c) Write a function that deletes an element ‘x’ from a list and returns the list without that element (hint: using your previous functions may be helpful)
