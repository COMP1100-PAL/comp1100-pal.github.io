---
layout: post
title:  "List Overview"
date:   2017-08-20
categories: week5
tags: week5, recursion, lists
---

## What are lists?
A list is a collection of elements that are *all the same type*, and they're also polymorphic. This means you could have a list of any type you like, no matter how frivolous... for example:
```haskell
data Senpai = "Tiggy_Senpai" | "Tina_Senpai" | "Lachie_Chan" | "Ella_Sensei"
function :: [Senpai] -> String
function senpais = case senpais of
    [] -> "I have no more senpais :("
    (x:xs) -> "Notice me"++x++","++(function xs)
```
Note that this function uses the very convenient syntax (x:xs), where x represents the first element of the list (**of type senpai**), and xs the rest of the list(**of type [Senpai]**). We read (x:xs) as "x cons xs". 
FUN FACT!!! Strings are actually lists of chars!

## Examples of Lists and Super Common Functions We Use on Them

```haskell
head :: [a] -> a
head [1,2,3] = 1
-- This gives us the first element of the list
tail :: [a] -> [a]
tail [1,2,3] = [2,3]
-- This gives us all but the first element of the list
++ :: [a] -> [a]
"Tiggy" ++ " Senpai" = "Tiggy Senpai"
-- This "concatenates" two Lists
```

# Practice using lists!

1. Write a function that takes the head of a list (the list elements can be of any type)
```haskell
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
>> reverse' [1, 2, 3] = [3, 2, 1]
```
What if the input is a very long list? How long will this function take to run? Could you write a faster version with a different implimentation?

8. Write a function to deleting an element from a list

Deleting elements in Haskell is a rather challenging feat, so let's get functional and break down the problem!

a) Write a function that finds the position of an element in a list, and returns this index
```haskell
>> findPosition [1, 2, 3] 2 = 1
```

b) Write a function that splits a list at an index ‘n’ (you can keep the element at this index in either list) and outputs the two lists as a tuple
```haskell
>> splitAt [1, 2, 3] 1 = ([1, 2], [3])
```

c) Write a function that deletes an element ‘x’ from a list and returns the list without that element (hint: using your previous functions may be helpful)
```haskell
delete :: [1, 2, 3, 4] 2 = [1, 3, 4]
```
