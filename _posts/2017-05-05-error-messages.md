---
layout: post
title:  "Error Messages"
date:   2017-05-05 19:40:42 +1100
categories: worksheets wk10 error messages
---
# Prelude
*The lights shine low*
*Your moves shine lower*
*You're dazed- have been gooder- mouth tastes like syntactic sugar*.

*You wander through Civic- people, buildings, potatoes form only vague shapes*
*Everything looks like abstracted grapes.*

*Hovering over these fuzzy outlines- burning starkly-*
*Are the error messages that have haunted you, sparkly.*

*Through every assignment....*
*Every lab...*
*Every day..*
*They're there.*

*But as you sit down in Maccas, and dip your fries delicately in a thickshake*
*You reflect upon how those error messages, beneath a cold, cruel exterior...*
*Are really there to help you good code, make.*


*Through every assignment...*
*Every lab...*
*Every day...*
*They're there for you.*

You cry to your waiter:
"*We're all going to make mistakes*
*Yet, beautiful Haskell, gives such in-depth feedback*
*If you heed it well, you can never go wrong, hot cakes!*"

*You decide it's time to go back and find every error message you've ever been given...*
*It's time to make use of that feedback.*

```Haskell
error:
    parse error on input ‘|’
```

```haskell
Couldn't match expected type `String -> String'
            with actual type `[Char]'
In the expression: "****"
In an equation for `****': **** = "****"
```

```haskell
error:
    * Variable not in scope: lenth :: [Int] -> Int
    * Perhaps you meant `length' (imported from Prelude)
```

```haskell
error:
 parse error on input ‘->’*
```

```haskell
Couldn't match expected type `a' with actual type `[a]'
  `a' is a rigid type variable bound by
      the type signature for ****** at YUNOWORK.hs:1:9
In the pattern: x : xs
In the pattern: [x : xs]
In a case alternative: [x : xs] -> x + *** xs
```

```haskell
error:
    Variable not in scope: y
```

```haskell
error:
    Multiple declarations of `shadowed_function'
```

```haskell
error:
Parse error in pattern: ***
```
 
```haskell
Could not deduce (a ~ a1)
from the context (Ord a)
  bound by the type signature for
             biggerThan :: Ord a => a -> [a] -> [a]
  at brokeyo.hs:16:15-38
or from (Ord a1)
  bound by the type signature for remove :: Ord a1 => [a1] -> [a1]
  at brokeyo.hs:19:15-33
  `a' is a rigid type variable bound by
      the type signature for biggerThan :: Ord a => a -> [a] -> [a]
      at brokeyo.hs:16:15
  `a1' is a rigid type variable bound by
       the type signature for remove :: Ord a1 => [a1] -> [a1]
       at brokeyo.hs:19:15
In the second argument of `(<)', namely `y'
In the expression: x < y
In a stmt of a pattern guard for
               an equation for `remove':
  x < y
```
 

 ```haskell
 error:
    * Variable not in scope: lisAdd :: [Int] -> Int
    * Perhaps you meant `listAdd'
```

```haskell
    No instance for (Num [(a, Int)]) arising from a use of `helper'
    Possible fix: add an instance declaration for (Num [(a, Int)])
    In the expression: helper (x : xs) 1
    In a case alternative:
        (x : xs)
          -> helper (x : xs) 1
          where
              helper list acc
                = case list of {
                    [] -> ****
                    (x : xs) -> ... : *** }
    In the expression:
      case list of {
        [] -> ****
        (x : xs)
          -> helper (x : xs) 1
          where
              helper list acc
                = case list of {
                    [] -> ...
                    (x : xs) -> ... } }
```

```haskell
*** Exception: Non-exhaustive patterns in function
```
Hint: This error only appears during runtime (when input is given)
