---
title: "Breaking Down Problems Solutions"
date: "2020-05-18 9:00:00 +1100"
layout: post
output: pdf_document
categories: worksheets
---

## Questions: Breaking Down with Trees

Last week, we asked the question:

We have a biased coin: it has probability ```h``` that it shows a head and ```1-h``` that it shows a tail. If we flip the coin 10 times, what is the probability that the sequence will have the subsequence ```HTHTT```. For example,```TTTHTHTTHH``` has the required subsequence but ```THTHTHTHTH``` doesn't.

We tried to solve this problem using lists, but gave up as lists weren't a very easy structure to use for this problem. Now however, with a lot of new knowledge about trees, we challenge you to solve this slight variation:

__Problem__: We have a biased coin: it has probability ```h``` that is shows a head and ```1 - h``` that it shows a tail. Write a function that finds the probability of finding a certain subsequence after ```n``` throws. (The subsequence needs to have length ```<= n```).

> __Answer__:

There are multiple parts to this problem:

- Generating the sequences.
- Detecting if a sequence contains a subsequence
- Calculating the probability of a sequence and then a list of sequences.

Each part is separate: the outputs from one part will be used as inputs for another, but that is the only connection - no functions will be reused. So we will consider each of these parts in turn.

Note: all code for our solution can be found [here](https://raw.githubusercontent.com/COMP1100-PAL/comp1100-pal.github.io/master/_posts/2020-05-18-SequenceProbabilities.hs). Follow the explanation below and run the functions to guarantee that they work.

### Generating Sequences

First, we need to generate all sequences of an arbitrary length. We can do this by generating a a depth ```n``` game tree, where each branch represents a coin flip.

So to begin, we need to define our data types - one for the coin flip and one for the binary tree:

```haskell
data Coin = Heads | Tails deriving (Eq, Show)

data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Show)

beginning :: BinaryTree [Coin]
beginning = Node Null [] Null
```

We define our trees with ```[Coin]``` so that the leaves record the entire sequence, otherwise we would need to go back up the entire tree to find them.

Now we define a function that can take a tree and adds a layer by flipping another coin:

```haskell
flipCoin :: BinaryTree [Coin] -> BinaryTree [Coin]
flipCoin tree = case tree of
    Node Null ls Null           -> Node (Node Null (Heads:ls) Null) ls (Node Null (Tails:ls) Null)
    Node leftTree ls rightTree  -> Node (flipCoin leftTree) ls (flipCoin rightTree)
    _                           -> error "tree is not balanced"
```

Now to generate a tree of arbitrary depth:

```haskell
generateTree :: Int -> BinaryTree [Coin]
generateTree n
    | n <= 0    = error "sequence must be of length at least 1"
    | otherwise = accumHelper n beginning
    where
        accumHelper :: Int -> BinaryTree [Coin] -> BinaryTree [Coin]
        accumHelper n tree
            | n == 0 = tree
            | n > 0     = accumHelper (n - 1) (flipCoin tree)
            | otherwise = error "this should never happen"
```

Now we just need to get the leaves and we have all our sequences:

```haskell
leaves :: BinaryTree a -> [a]
leaves binaryTree = case binaryTree of
    Null                        -> []
    Node Null a Null            -> [a]
    Node leftTree _ rightTree   -> (leaves leftTree) ++ (leaves rightTree
```

So now we can find all the possible length ```n``` sequences:

```haskell
generateSequences :: Int -> [[Coin]]
generateSequences n = leaves (generateTree n)
```

So this part is done!

### Detecting If a Sequence Contains A Subsequence 

Now let's turn to the second part of the problem. Here we have some sequence ```seq :: [a]``` of length ```n``` and we want to detect if a different sequence ```sub :: [a]``` is or isn't a subsequence of the first. Note that we don't solve this problem using ```[Coin]``` but rather polymorphic ```[a]```. This will generalise the functions, but also prevent us from using any ```Coin``` specific properties (which we shouldn't need to use).

The easiest method for determining whether a sequence has a subsequence is check if the start of a list is the subsequence. This way, we can just move element by element through the sequence, checking if the subsequence is there. If we go through the entire list and the subsequence hasn't appeared, then we know it isn't there.

So let's write a function that detects if a sequence begins with the elements of another sequence:

```haskell
begins :: (Eq a) => [a] -> [a] -> Bool
begins seq sub
    | length(sub) > length(seq)         = False
    | (take (length(sub)) seq) == sub   = True
    | otherwise                         = False
```

The first condition checks if the second sequence is longer than the first, in which case it is clearly impossible for the second be at the start of the first. However, having this condition first also allows us to use ```take (length(sub)) seq``` without worrying about errors.

Now all we need to do is to move through the original list, checking if the subsequence ever satisfies ```begins```:

```haskell
isSubsequence :: (Eq a) => [a] -> [a] -> Bool
isSubsequence seq sub
    | length(sub) > length(seq)     = False
    | begins seq sub                = True
    | otherwise                     = isSubsequence (tail seq) sub
```

And that solves the second part - we can now detect if a sequence contains a specific subsequence!

### Calculating the probability of a sequence and then a list of sequences

Now we need to calculate the probability of a certain sequence. Again, we will generalise to ```seq :: [a]```.

The first hurdle is storing what the individual probability of a single ```element :: a``` is. Our question only has ```Head``` and ```Tails```, but the general problem could have many elements. Thus, we need a good way to store the probabilities of individual elements.

There are many ways to do this, but we have decided to use a dictionary of the form: ```([a], [Double])```. So it is a tuple with a list of all the elements and a list of their probabilities. For example, a possible probability dictionary for our problem could be:

```haskell
probabilityDict :: ([Coin], [Double])
probabilityDict = ([Head, Tails], [0.4, 0,6])
```

Here is another example using days of the week:

```haskell
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving Eq, Show

probabilityDict :: ([Day], [Double])
probabilityDict = ([Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday], [0.1, 0.2, 0.05, 0.1, 0.05, 0.15, 0.35])
```

So, if we use this format for our dictionary, then we will need to construct it at the beginning. So we quickly make a function that takes the probability of ```Head``` and makes a probability dictionary for coin flips:

```haskell
makeProbDict :: Double -> ([Coin], [Double])
makeProbDict h = ([Heads, Tails], [h, 1-h])
```

Now that we know what the probability of all the elements are, we need a function that can find the probability of a specific element:

```haskell
getElementProb :: (Eq a) => ([a], [Double]) -> a -> Double
getElementProb (elements, probs) x
    | not (elem x elements) = error "Element isn't in the probability dictionary"
    | otherwise             = probs !! (find elements x)
    where
        find :: (Eq a) => [a] -> a -> Int
        find ls x
            | (head ls) == x    = 0
            | otherwise         = 1 + find (tail ls) x
```

Now we need to map this function to every element of a sequence and then multiply the result together:

```haskell
getSequenceProb :: (Eq a) => ([a], [Double]) -> [a] -> Double
getSequenceProb probDict seq = foldl (*) 1 (map (getElementProb probDict) seq)
```

### Putting It Together

So we have three functions:

```haskell
generateSequences :: Int -> [[Coin]]
generateSequences n = leaves (generateTree n)

isSubsequence :: (Eq a) => [a] -> [a] -> Bool
isSubsequence seq sub
    | length(sub) > length(seq)     = False
    | begins seq sub                = True
    | otherwise                     = isSubsequence (tail seq) sub

getSequenceProb :: (Eq a) => ([a], [Double]) -> [a] -> Double
getSequenceProb probDict seq = foldl (*) 1 (map (getElementProb probDict) seq)
```

Now we just need to put them all together!

```haskell
probabilityOfSubsequence :: [Coin] -> Int -> Double -> Double
probabilityOfSubsequence subsequence n probabilityOfHeads
    | length(subsequence) > n  = error "subsequence is longer than n"
    | otherwise                    = sum (map (getSequenceProb (makeProbDict probabilityOfHeads)) (filter (\x -> isSubsequence x subsequence) (generateSequences n)))
```

So in words, the function:

1. finds all the possible sequences of length ```n```;
2. filters out all sequences that don't contain ```subsequence```;
3. calculates the probability of each of the remaining sequences;
4. sums the probabilities.

And that solve the problem! Let's look at two examples of it working:

```haskell
probabilityOfSubsequence [Tails, Tails] 2 0.25 = 6.25e-2

probabilityOfSubsequence [Tails, Heads, Heads, Tails] 10 (1/3) =  0.31668614201764694
```