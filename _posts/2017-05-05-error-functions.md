---
layout: post
title:  "error functions"
date:   2017-05-05 19:36:05 +1100
categories: worksheets wk10 error messages
---
```haskell
--Adds all elements of a list of integers.
listAdd :: [Int] -> Int
listAdd list = case list of
  [] -> 0
  x:xs -> x + lisAdd xs
 ```
 
```haskell
--Finds the first element in a list
head:: [a] -> a
head x:xs = x
```

```haskell
shadowed_function :: (Ord a, Integer b) => a -> a -> b -> x
shadowed_function x y z = case (compare x y) of 
    GT -> (fromIntegral z) + 1
    LT -> (fromIntegral z) - 1
    z  -> (fromIntegral z)
    
shadowed_function :: b -> u -> t -> t
shadowed_function = undefined
```

```haskell
index :: [a] -> [(a,Int)]
index list = case list of
    [] -> error "lol"
    (x:xs) -> helper (x:xs) 1
        where helper list acc = case list of
                  [] -> error "u wot m8"
                  (x:xs) -> (x,acc) : helper xs acc+1
```
```Haskell
--Returns the name of your fav pal mentor
palMentor:: (Char, Int) -> Maybe String
palMentor (initial, number) = case initial of
'R' -> Just "Rohit-sama"
'E' -> Just "Ella-san"
'J' -> Just "Jay-chan"
'L' -> Just "Lachie-chan"
'T' | number == 1 -> Just "Tiggy-senpai"
    | otherwise -> Just "Tina-senpai"
_ -> Nothing
```

```haskell
--adds the number 1 to a list of integers
--and calculates the length of the resulting list
addsLength :: [Int] -> Int
addsLength a = lenth (1:a)
```


```haskell
sum1 :: [a] -> a
sum1 list = case list of
    [] -> 0
    [x:xs] -> x + sum1 xs
```    

```haskell
listMap :: (a -> b) -> [a] -> [b]
listMap func list = case list of
	[]    -> []
	x:xs  -> func y : listMap func xs
```

```Haskell
--Gives you a headache. Please never name your functions and variables like this, no matter how much of a giggle it gives you!
--Try and figure out what ~AWESOME~ Haskell list function this imitates
oh:: (a -> b) -> [a] -> [b]
oh yea boi = case boi of
   | [] -> []
   | yeaaaaaa:booooooiiiii -> (yea yeaaaaaa):oh yea booooooiiiii
```

```haskell
unilyfe :: String -> String
unilyfe = "needs memes"
```

```haskell
shadowed_function :: (Swag b, Yolo t) => b -> u -> t -> t
shadowed_function = undefined
```

```haskell
biggerThan :: Ord a => a -> [a] -> [a]
biggerThan x list = remove list
  where
    remove :: Ord a => [a] -> [a]
    remove [] = []
    remove (y:ys) | x < y = y : remove ys
                  | otherwise = remove ys
```

```haskell
mentorNames :: Char -> String
mentorNames char = case char of
	'a' = "Tiggy"
	'e' = "Ella"
	'j' = "Jay"
	'l' = "Lachie"
	'r' = "Rohit"
	't' = "Tina"
```

```haskell
longer :: [a] -> [a] -> Bool
longer [] [] = False
longer _ [] = True
longer (_:[]) (_:[]) = False
longer (_:xs) (_:ys) = longer xs ys
```

```haskell
mod2 :: Integer -> Integer
mod2 n | even n = 0
mod2 n | odd n  = 1
```
