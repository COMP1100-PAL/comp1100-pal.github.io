module SequenceProbabilities where

--------------------------------------
-- Data Types
--------------------------------------

data Coin = Heads | Tails deriving (Eq, Show)

data BinaryTree a = Null | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Show)

--------------------------------------
-- Generating Sequences
--------------------------------------

beginning :: BinaryTree [Coin]
beginning = Node Null [] Null

flipCoin :: BinaryTree [Coin] -> BinaryTree [Coin]
flipCoin tree = case tree of
    Node Null ls Null           -> Node (Node Null (Heads:ls) Null) ls (Node Null (Tails:ls) Null)
    Node leftTree ls rightTree  -> Node (flipCoin leftTree) ls (flipCoin rightTree)
    _                           -> error "tree is not balanced"

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

leaves :: BinaryTree a -> [a]
leaves binaryTree = case binaryTree of
    Null                        -> []
    Node Null a Null            -> [a]
    Node leftTree _ rightTree   -> (leaves leftTree) ++ (leaves rightTree)

generateSequences :: Int -> [[Coin]]
generateSequences n = leaves (generateTree n)

--------------------------------------
-- Detecting Subsequences
--------------------------------------

begins :: (Eq a) => [a] -> [a] -> Bool
begins seq sub
    | length(sub) > length(seq)         = False
    | (take (length(sub)) seq) == sub   = True
    | otherwise                         = False

isSubsequence :: (Eq a) => [a] -> [a] -> Bool
isSubsequence seq sub
    | length(sub) > length(seq)     = False
    | begins seq sub                = True
    | otherwise                     = isSubsequence (tail seq) sub

--------------------------------------
-- Calculating Probability of Sequence
--------------------------------------

makeProbDict :: Double -> ([Coin], [Double])
makeProbDict h = ([Heads, Tails], [h, 1-h])

getElementProb :: (Eq a) => ([a], [Double]) -> a -> Double
getElementProb (elements, probs) x
    | not (elem x elements)        = error "Element isn't in the probability dictionary"
    | otherwise                 = probs !! (find elements x)
    where
        find :: (Eq a) => [a] -> a -> Int
        find ls x
            | (head ls) == x    = 0
            | otherwise         = 1 + find (tail ls) x

getSequenceProb :: (Eq a) => ([a], [Double]) -> [a] -> Double
getSequenceProb probDict seq = foldl (*) 1 (map (getElementProb probDict) seq)


--------------------------------------
-- Putting It Together
--------------------------------------

probabilityOfSubsequence :: [Coin] -> Int -> Double -> Double
probabilityOfSubsequence subsequence n probabilityOfHeads
    | length(subsequence) > n  = error "subsequence is longer than n"
    | otherwise                    = sum (map (getSequenceProb (makeProbDict probabilityOfHeads)) (filter (\x -> isSubsequence x subsequence) (generateSequences n)))
