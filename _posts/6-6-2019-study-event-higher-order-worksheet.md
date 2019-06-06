**Higher order:**
Given a list of Booleans, return true if they are all the same, false otherwise. Hint: use fold.
```haskell
Examples:
>>> allEqual [True, True, True]
True
 >>> allEqual [False, True]
False
>>> allEqual []
True

allSame :: [Bool] -> Bool
allSame = undefined
```
Given a list of Booleans, return true if there are exactly n Trues.
```haskell
Examples:
>>> nTrues 2 [True, False, True]
True
>>> nTrues 2 [True, True, True]
False
>>> nTrues 0 [False]
True

nTrues :: Int -> [Bool] -> Bool
nTrues = undefined
```

```haskell
module FoodGroups where

type Food = String

data FoodGroup
  = Carbohydrates
  | Dairy
  | Protein
  | FruitVeg
  | FatSugar
  deriving (Show, Eq)

-- An example list of foods with food groups:
allFoods :: [(Food, FoodGroup)]
allFoods =
  [ ("Bread", Carborhyrates)
  , ("Pasta", Carborhydrates)
  , ("Rice", Carborhyrates)
  , ("Potato", Carborhydrates)
  , ("Milk", Dairy)
  , ("Cheese", Dairy)
  , ("Yoghurt", Dairy)
  , ("Beef", Protein)
  , ("Fish", Protein)
  , ("Tofu", Protein)
  , ("Apple", FruitVeg)
  , ("Carrot", FruitVeg)
  , ("Mushroom", FruitVeg)
  , ("Chocolate", FatSugar)
  , ("Cake", FatSugar)
  , ("Oil", FatSugar)
  ]
```
Given a Food, return the corresponding FoodGroup. 
```haskell
Examples:
>>> theFoodGroup "Mushroom" allFoods
FruitVeg
>>> theFoodGroup "Milk" allFoods
Dairy

theFoodGroup :: Food -> [(Food, FoodGroup)] -> FoodGroup
theFoodGroup = undefined
```
Given a list of type Food, return the list with each corresponding FoodGroup. Use theFoodGroup and map!
```haskell
Examples:

>>> theFoodGroups ["Mushroom", "Milk", "Beef"] 
[FruitVeg, Dairy, Protein]

theFoodGroups :: [Food] -> [FoodGroup]
theFoodGroups = undefined
```

Given a list of type Food, return a list of types of type (Int, FoodGroup) where the Int is the number of Foods of that type of FoodGroup. Use theFoodGroups and you could also write a helper function and another hint: make an initial list of tuples to use before you start counting!
```haskell
Examples:

>>> ratioOfFoodGroups ["Mushroom", "Milk", "Beef"]
[(0, Carbohydrate), (1, Dairy), (1, Protein), (1, FruitVeg), (0, FatSugar)]

>>> ratioOfFoodGroups ["Mushroom", "Pasta", "Yoghurt", "Tofu" "Milk", "Beef"]
[(1, Carbohydrate), (2, Dairy), (2, Protein), (1, FruitVeg), (0, FatSugar)]

ratioOfFoodGroups :: [Food] -> [(Int, FoodGroup)]
ratioOfFoodGroups = undefined


```

 

