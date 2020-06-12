module SuperPAL_Answers where

import Data.Char

---------------
-- Recursion --
---------------

-- Qu 1
pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x: (takeWhile (== x) xs)) : pack (dropWhile (== x) xs)

-- Qu 2
isSorted :: (Ord a ) => [a] -> Bool
isSorted list = case list of
    []      -> True
    [x]     -> True
    x:y:xs  -> (x <= y) && (isSorted (y:xs))

-- Qu 3
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery list count = (take (count-1) list) ++ dropEvery (drop count list) count

-- Qu 4
myScanl :: (a -> b -> a) -> a -> [b] -> [a]
myScanl f argument list = argument : (scanl f (f argument (head list)) (tail list))


----------------------------
-- Higher Order Functions --
----------------------------

-- Qu 1
onlyBigLetters :: String -> String
onlyBigLetters str = map toUpper (filter isLetter str)
    where
        isLetter :: Char -> Bool
        isLetter ch = elem ch (['a'..'z'] ++ ['A'..'Z'])

-- Qu 2
timetables :: Int -> Int -> [[Int]]
timetables m n = map (\x -> map (x*) [1..m]) [1..n]

-- Qu 3
-- This function produces the fibonacci sequence. The function works in Haskell due to lazy evaluation.
fibSeq = 0 : 1 : (zipWith (+) fibSeq (tail fibSeq))

-- Qu 4
list_of_booleans = [True, False, True, False]

andNot :: Bool -> Bool -> Bool
andNot a b = a && not b

foldl_function :: [Bool] -> Bool
foldl_function ls = foldl andNot True ls

-- foldl_function list_of_booleans  = foldl andNot True [True, False, True, False]
--                                  = foldl andNot (True andNot True) [False, True, False]
--                                  = foldl andNot ((True andNot True) andNot False) [True, False]
--                                  = foldl andNot (((True andNot True) andNot False) andNot True) [False]
--                                  = foldl andNot ((((True andNot True) andNot False) andNot True) andNot False) []
--                                  = (((True andNot True) andNot False) andNot True) andNot False
--                                  = ((False andNot False) andNot True) andNot False
--                                  = (False andNot True) andNot False
--                                  = False andNot False
--                                  = False

foldr_function :: [Bool] -> Bool
foldr_function ls = foldr andNot True ls

-- foldr_function list_of_booleans  = foldr andNot True [True, False, True, False]
--                                  = True andNot (foldr andNot True [False,  True, False]
--                                  = True andNot (False andNot (foldr andNot True [True, False]))
--                                  = True andNot (False andNot (True andNot (foldr andNot True [False])))
--                                  = True andNot (False andNot (True andNot (False andNot (foldr andNot True []))))
--                                  = True andNot (False andNot (True andNot (False andNot (True))))
--                                  = True

-- Qu 5
myReverse list = foldl (flip (:)) [] list

-- myReverse [1,2,3]    = foldl (flip (:)) [] [1,2,3]
--                      = foldl (flip (:)) (1:[]) [2,3]
--                      = foldl (flip (:)) (2:1:[]) [3]
--                      = foldl (flip (:)) (3:2:1:[]) []
--                      = 3:2:1:[]
--                      = [3,2,1]

-----------
-- Trees --
-----------

-- Qu 1
-- Binary trees are tree structures that always branch into two nodes. A balanced tree is simply a tree where all subtrees have equal or difference 1 depth. A binary search tree is a tree such that for all subtrees all nodes in the left-subtree are less than the root node and all nodes in the right-subtree are greater than the root node.

-- Provided that the tree data type has an ordering, it is always possible to create a balanced binary search tree.

-- Qu 2
data BinaryTree a = Node (BinaryTree a) a (BinaryTree a) | Null
    deriving (Show, Eq)

example_binarytree_0 = Node (Node (Node (Node Null 8 Null) 6 (Node Null 3 Null)) 3 (Node Null 1 Null)) 2 (Node (Node (Node Null 4 (Node Null 6 Null)) 7 Null) 4 (Node (Node Null 3 Null) 9 (Node Null 2 Null)))

averageDepth :: BinaryTree a -> Double
averageDepth tree = fromIntegral(sum treeDepths) / fromIntegral(length treeDepths)
    where
        treeDepths = getDepths tree

getDepths :: BinaryTree a -> [Int]
getDepths tree = case tree of
    Null -> [0]
    Node l _ Null       -> map (+1) (getDepths l)
    Node Null _ r       -> map (+1) (getDepths r)
    Node l _ r          -> (map (+1) (getDepths l)) ++  (map (+1) (getDepths r))

-- Qu 3
example_binarytree_1 = Node (Node (Node Null 6 Null) 3 (Node Null 1 Null)) 2 (Node Null 4 Null)

example_binarytree_2 = Node (Node (Node Null 1 Null) 3 Null) 4 (Node (Node Null 2 Null) 4 (Node Null 8 Null))

treeZipWith :: BinaryTree a -> BinaryTree a -> (a -> a -> a) -> BinaryTree a
treeZipWith t1 t2 f = case (t1, t2) of
    (Node lt1 x rt1, Node lt2 y rt2)    -> Node (treeZipWith lt1 lt2 f) (f x y) (treeZipWith rt1 rt2 f)
    (Null, _)                           -> Null
    (_, Null)                           -> Null

-- Qu 4
data RoseTree a = Rose a [RoseTree a]
    deriving (Show, Eq)

example_rosetree = Rose 10 [Rose 2 [Rose 3 [Rose 6 [], Rose 1 []], Rose 4 []], Rose 1 [Rose 7 [ Rose 8[]], Rose 5 []], Rose 4 [Rose 3 [Rose 1 []], Rose 5 [], Rose 4 [Rose 2 [], Rose 8[]]]]

function x = (x `mod` 2) == 0

treeFilter :: RoseTree a -> (a -> Bool) -> [RoseTree a]
treeFilter t f = treeFilterHelper [t] f

treeFilterHelper :: [RoseTree a] -> (a -> Bool) -> [RoseTree a]
treeFilterHelper trees f = case trees of
    []                      -> []
    (Rose x subtrees):ts    -> case f x of
        True    -> (Rose x (treeFilterHelper subtrees f)) : treeFilterHelper ts f
        False   -> treeFilterHelper (subtrees ++ ts) f