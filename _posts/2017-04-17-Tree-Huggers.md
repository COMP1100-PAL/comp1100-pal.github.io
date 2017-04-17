# Tree Hugging for Dummies

!["tree hugger dot net"](http://media.treehugger.com/assets/images/2016/07/green-forest-trees.jpg.662x0_q70_crop-scale.jpg "tree hugger dot net")

Jay and Tina are back and greener than ever after the mid-sem break. After splurging at Paddy's Markets in Sydney, they realised how wasteful their current lives were and had a sustainability epiphany.

..... They instead sought to reconnect with nature and learn how to understand trees.

## List comprehension
Before they can understand trees, they must first understand the root of the problem. lists are fundamentaly the same a trees and a mastery over lists provides a strong foundation for understanding trees.

List comprehensions are basically a combination of the higher-order functions `map` and `filter`.

`[elements with function applied where elements are drawn from list with conditions]`

There can be one or more conditions, or even no condition!

`[elements with function applied | elements <- list, condition, condition, etc...]`

```haskell
[ x + 2 | x <- [1..10] , isEven x]
= [4, 6, 8, 10, 12]
```

This will add 2 to every even number between 1 and 10.

```haskell
[ x + 2 | x <- [1..10] , isEven x, x > 5]
= [8, 10, 12]
```

This will add 2 to every even number between 1 and 10 which is greater than 5.

Which do you think happens first - the `map` or the `filter`? Discuss.

Can you figure out a way to output `[6, 8, 10, 12]`?

##### steal some from tiggy

What is the result of this expression?
```haskell
foldl (&) blank ([drawTileAt (x, y) | x <- [-10..10], y <- [-10..10]])
```
Protip: you should remember this from Assignment 1.


## Tree growing crash course
How it's set out:



What it looks like:

![hi](https://www.nczonline.net/images/wp-content/uploads/2009/06/500px-Binary_search_tree.svg_-300x250.png)

kTree are cool.

## Algorithms
Branching off into algorithms....