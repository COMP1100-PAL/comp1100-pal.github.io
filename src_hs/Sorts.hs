module Sorts where

-----------------------------------
-- Imports for Bogo Sort
import System.Random
import Data.Array.IO
import Control.Monad
-----------------------------------

-----------------------------------
-- Insertion Sort
-----------------------------------

insertionSort :: Ord a => [a] -> [a]
insertionSort ls = foldl insert [] ls
    where
        insert :: Ord a => [a] -> a -> [a]
        insert ls x
            | ls == []          = [x]
            | x <= head(ls)     = x : ls
            | otherwise         = head(ls) : (insert (tail(ls)) x)


-----------------------------------
-- Merge Sort
-----------------------------------

mergeSort :: Ord a => [a] -> [a]
mergeSort ls = helper (makeIndividualList ls)
    where
        -- Initial Split Into Single Element Lists
        makeIndividualList :: [a] -> [[a]]
        makeIndividualList ls = case ls of
            []      -> []
            x:xs    -> [x] : (makeIndividualList xs)

        -- Merges Two Sorted Lists
        merge :: Ord a => [a] -> [a] -> [a]
        merge ls1 ls2
            | ls1 == []                     = ls2
            | ls2 == []                     = ls1
            | (head(ls1)) <= (head(ls2))    = head(ls1) : (merge (tail(ls1)) ls2)
            | otherwise                     = head(ls2) : (merge ls1 (tail(ls2)))
        
        -- Merges Lists of Lists in groups of 2
        mergeLists :: Ord a => [[a]] -> [[a]]
        mergeLists ls = case length(ls) of
            0 -> []
            1 -> ls
            _ -> (merge (head(ls)) (head(tail(ls)))) : (mergeLists (drop 2 ls))
        
        -- Recurses through mergeList until there is only one list, i.e the sorted list
        helper :: Ord a => [[a]] -> [a]
        helper ls = case length result of
            0 -> error "List is Empty"
            1 -> head(result)
            _ -> helper result
            where
                result = mergeLists ls


-----------------------------------
-- Insertion Sort
-----------------------------------

quickSort :: Ord a => [a] -> [a]
quickSort ls = case (small, big) of
    ([], [])    -> [v]
    (_, [])     -> (quickSort small) ++ [v]
    ([], _)     -> v : (quickSort big)
    (_, _)      -> (quickSort small) ++ [v] ++ (quickSort big)
    where
        -- Pivot
        (v, small, big) = (head(ls), [ x | x <- tail(ls), x <= (head(ls)) ], [ x | x <- tail(ls), x > (head(ls)) ])

altQuickSort :: Ord a => [a] -> [a]
altQuickSort ls = case ls of
    []  -> []
    _   -> altQuickSort([ x | x <- tail(ls), x <= (head(ls))]) ++ [head(ls)] ++ altQuickSort([ x | x <- tail(ls), x > (head(ls))])


-----------------------------------
-- Bogo Sort
-----------------------------------

-- http://rosettacode.org/wiki/Sorting_algorithms/Bogosort#Haskell
isSorted :: (Ord a) => [a] -> Bool
isSorted (e1:e2:r) = e1 <= e2 && isSorted (e2:r)
isSorted _ = True

-- from http://www.haskell.org/haskellwiki/Random_shuffle
-- TL;DR it randomly shuffles the list
shuffle :: [a] -> IO [a] -- This is what requires all the imports
shuffle xs = do
        ar <- newArray n xs
        forM [1..n] $ \i -> do
        j <- randomRIO (i,n)
        vi <- readArray ar i
        vj <- readArray ar j
        writeArray ar j vi
        return vj
  where
    n = length xs
    newArray :: Int -> [a] -> IO (IOArray Int a)
    newArray n xs = newListArray (1,n) xs
    
-- This new ">>=" symbol can be thought of as simply "stripping"
-- the IO type from the output of shuffle, i.e. making it type [a]
bogosort :: (Ord a) => [a] -> IO [a]
bogosort li
    | isSorted li   = return li
    | otherwise     = shuffle li >>= bogosort