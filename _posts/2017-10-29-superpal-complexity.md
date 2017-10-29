# Complexity Revision

Luckily for you, complexity is one of the least complex topics in COMP1100. Colloquially, complexity is just a measure of how many resources a program 

## Reverse `(++)`

```haskell
reverse :: [a] -> [a]
reverse list = case list of
  [] -> []
  x:xs -> (reverse xs) ++ [x]
```

Find the complexity of the reverse function above. Is there a better way to implement this? What would be the lowest complexity for the reverse function?

## Mergesort
Conceptually, mergesort works as follows:
1. Divide the unsorted list by halving the list until there are n sublists of 1 element (an element of 1 is considered sorted)
2. Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

Here's an example of how it works:
!["ALT TEXT"](https://upload.wikimedia.org/wikipedia/commons/e/e6/Merge_sort_algorithm_diagram.svg "WOWO")

Implement the mergesort algorithm in Haskell, if you can. Using this function or otherwise, determine the complexity of the algorithm.

## Quicksort

Conceptually, quicksort works as follows:

1. Pick the first element of the list as a "pivot"
2. Reorder the array so that all elements with values less than the pivot come before the pivot, while all elements with values greater than the pivot come after it (equal values can go either way). After this partitioning, the pivot is in its final position. This is called the partition operation.
3. Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.

Here's an example of how it works:
!["ALT TEXT"](https://nevalalee.files.wordpress.com/2013/08/quicksort.jpg "WOWO")

Implement the quicksort algorithm in Haskell, if you can. Using this function or otherwise, determine the complexity of the algorithm. Is there a better way to implement this? What are the average and worst case complexities for the quicksort function?

_Hint: Use list comprehensions!_

# Bogosort


_Hint: Does bogosort ever terminate?_
