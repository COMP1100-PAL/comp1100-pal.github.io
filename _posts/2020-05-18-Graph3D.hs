module Graph3D where

-- 1D Case

type Range a = (a, a, a)

graphing1D :: (Ord a, Num a, Enum a) => (a -> Bool) -> Range a -> [(a, Bool)]
graphing1D function range = applyFunctionTo1DGrid function (generate1DGrid range)

generate1DGrid :: (Ord a, Num a, Enum a) => Range a -> [a]
generate1DGrid (minimum, maximum, stride)
    | minimum > maximum = error "Can't generate grid where minimum > maximum"
    | stride > (maximum-minimum) = error "Can't generate grid where stride > (maximum-minimum)"
    | otherwise = [minimum,(minimum+stride)..maximum]

applyFunctionTo1DGrid :: (Ord a, Num a, Enum a) => (a -> Bool) -> [a] -> [(a, Bool)]
applyFunctionTo1DGrid function grid = zip grid (map function grid)

-- 2D Case

graphing2D :: (Ord a, Num a, Enum a) => (a -> a -> Bool) -> Range a -> Range a -> [((a, a), Bool)]
graphing2D function rangex rangey = applyFunctionTo2DGrid function (generate2DGrid rangex rangey)

generate2DGrid :: (Ord a, Num a, Enum a) => Range a -> Range a -> [(a, a)]
generate2DGrid rangex rangey = generate2Combinations (generate1DGrid rangex) (generate1DGrid rangey)

generate2Combinations :: [a] -> [b] -> [(a,b)]
generate2Combinations list1 list2 = concatMap (combineElementWithList list1) list2

combineElementWithList :: [a] -> b -> [(a,b)]
combineElementWithList list element = case list of
    [] -> []
    x:xs -> (x,element) : combineElementWithList xs element

applyFunctionTo2DGrid :: (Ord a, Num a, Enum a) => (a -> a -> Bool) -> [(a, a)] -> [((a, a), Bool)]
applyFunctionTo2DGrid function grid = zip grid (map (uncurry function) grid)

-- 3D Case

graphing3D :: (Ord a, Num a, Enum a) => (a -> a -> a -> Bool) -> Range a -> Range a -> Range a -> [((a, a, a), Bool)]
graphing3D function rangex rangey rangez = applyFunctionTo3DGrid function (generate3DGrid rangex rangey rangez)

generate3DGrid :: (Ord a, Num a, Enum a) => Range a -> Range a -> Range a -> [(a, a, a)]
generate3DGrid rangex rangey rangez = map extract (generate2Combinations (generate1DGrid rangex) (generate2Combinations (generate1DGrid rangey) (generate1DGrid rangez)))
    where
        extract (a, (b, c)) = (a, b, c)

applyFunctionTo3DGrid :: (Ord a, Num a, Enum a) => (a -> a -> a -> Bool) -> [(a, a, a)] -> [((a, a, a), Bool)]
applyFunctionTo3DGrid function grid = zip grid (map (uncurry3 function) grid)
    where
        uncurry3 function (a, b, c) = function a b c

addEqual :: Int -> Int -> Int -> Bool
addEqual a b c = (a + b == c)