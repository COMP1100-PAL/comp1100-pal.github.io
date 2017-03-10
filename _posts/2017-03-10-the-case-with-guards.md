# The case with guards
Last week you were asked to write an implementation of rock, paper, scissors in Haskell with guards. 
This following is one particular implementation:
```haskell
-- data types
data Move = Paper | Rock | Scissors deriving (Eq, Show)
data Result = Win | Draw | Lose deriving (Eq, Show)

-- outputs the move that beats the input move. 
-- e.g: if input was rock, then output would be paper, because paper beats rock.
beats :: Move -> Move
beats move 
    | move == Paper = Scissors
    | move == Rock = Paper
    | otherwise = Rock 

-- tells us the outcome for player A
-- e.g: if player A plays Rock and player B plays Scissors, the function will output Win.
score :: Move -> Move -> Result
score playerA playerB 
    | beats playerB == playerA = Win
    | playerA == playerB = Draw
    | otherwise = Lose
```

Your task is to write the `beats` function and the `score` function with case statements instead of guards.