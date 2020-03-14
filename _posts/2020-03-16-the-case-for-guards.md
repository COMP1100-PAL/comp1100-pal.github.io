---
layout: post
title:  "The Case For Guards"
date:   2020-03-16 08:00:00 +1100
categories: worksheets
---

## Guards

Already in just 3 weeks, we can program a lot with Haskell. But we still can't have our programs make decisions! This is vital, otherwise we basically just have a glorified calculator. So how do we make decisions in Haskell? _**Guards and Cases**_!

Let's look at guards first. Consider the question:

> We have a smart bucket outside that measures how much water is in it. How can we determine whether it rained?

In Haskell, we can answer this question with the following function:
```haskell
hasItRained :: Int -> Bool
hasItRained amountOfWaterInBucket
  | amountOfWaterInBucket == 0  = False
  | amountOfWaterInBucket > 0   = True
```
This function makes decisions based on how much water is in the bucket: if the bucket has no water in it, then it hasn't rained; if the bucket has water in it, then it has rained!

Let's examine how Guards work. Guards are a type of 'if statement'. The function starts like normal with type signature, function declaration and variable naming:
```haskell
hasItRained :: Int -> Bool
hasItRained amountOfWaterInBucket
```
Then instead of the normal ```=``` after the variables, we go to a new line and use the _pipe character_ ```|``` to set up various different options:
```haskell
  | amountOfWaterInBucket == 0  = False
  | amountOfWaterInBucket > 0   = True
````
Each line with a ```|``` represents a different option. The options are then represented using _boolean expressions_: statements that will either be ```True``` or ```False```. In our example, the boolean expressions are:
```haskell
amountOfWaterInBucket == 0
amountOfWaterInBucket > 0
```
The first will return ```True``` if there is no water, while the second returns ```True``` if there is water. The final part of the Guard are the return values. Here we finally use ```=``` and then what we want to spit out given each option, ```False``` and ```True``` respectively.

What if our program is a bit broken and somehow ```amountOfWaterInBucket``` is negative? At the moment, our function wouldn't know what to do - it would just break. So let's enhance our function to check for that case:
```haskell
hasItRained :: Int -> Bool
hasItRained amountOfWaterInBucket
  | amountOfWaterInBucket == 0  = False
  | amountOfWaterInBucket > 0   = True
  | otherwise                   = Error "amountOfWater has an unexpected value"
```
Here ```otherwise``` basically just means ```True```. This means our last option will catch all possible things, such as measuring a negative amount of water, meaning that our function will know what to do regardless.

What would happen if we rearrange the function a bit:
```haskell
hasItRained :: Int -> Bool
hasItRained amountOfWaterInBucket
  | otherwise                   = Error "amountOfWater has an unexpected value"
  | amountOfWaterInBucket == 0  = False
  | amountOfWaterInBucket > 0   = True
```
We might as well check for odd values first, right? It turns out, that this would ruin our function. Haskell checks each option in the order it is listed. So this version of the function would first check if ```otherwise``` returns ```True```, always be happy with the result and so return the ```Error "amountOfWater has an unexpected value"```. So it is important to remember that the options in Guards are checked in order.

## Guard Examples

That is all there is to guards: some weird ```|``` formatting, Boolean expressions and careful ordering. Now that we are pros, let's look at some other examples. Talk in your group about what each function does:
```haskell
absoluteValue :: Int -> Int
absoluteValue x
  | x >= 0    = x
  | otherwise = -x
```
```haskell
generation :: Int -> String
generation age
  | age > 130 = "Lost Generation"
  | age > 90  = "Greatest Generation"
  | age > 75  = "Silent Generation"
  | age > 55  = "Baby Boomers"
  | age > 40  = "Generation X"
  | age > 20  = "Millenials"
  | age > 10  = "Generation Z"
  | age >= 0  = "Generation Alpha"
  | otherwise = "You are not born yet"
```
```haskell
apeIndex :: Int -> String
apeIndex armSpan height
  | armSpan / height < 0  = Error "Unexpected Negative Values"
  | armSpan / height < 1  = "Your legs are long"
  | armSpan / height == 1 = "You arms and legs are the same"
  | otherwise             = "Your arms are long"
```

## Cases

Guards are great at making decisions in Haskell. So let's make another Guard function! We are going to pretend that the university uses Haskell for reporting grades and so has the following ```data``` type:
```haskell
data Grade = N | PS | P | CR | D | HD
  deriving (Show, Eq)
```
Now, let's make a function that will automate translating this type into a string of the full name:
```haskell
translateGrade :: Grade -> String
translateGrade grade
  | grade == N  = "Fail"
  | grade == PS = "Pass at a Supplementary Examination"
  | grade == P  = "Pass"
  | grade == CR = "Credit"
  | grade == D  = "Distinction"
  | grade == HD = "High Distinction"
```
This function does work, but it is really awkward. Each time we want to check what the value of ```grade``` is, we need to rewrite ```grade ==```. Luckily, Haskell has another way of making decisions: Cases!
```haskell
translateGrade :: Grade -> String
translateGrade grade = case grade of
  N   -> "Fail"
  PS  -> "Pass at a Supplementary Examination"
  P   -> "Pass"
  CR  -> "Credit"
  D   -> "Distinction"
  HD  -> "High Distinction"
```
This function is much nice: far less repetition which makes it much more readable and clear. Let's examine this function to see how Cases work.

Like every Haskell function, we need a type signature, function declaration and variable naming:
```haskell
translateGrade :: Grade -> String
translateGrade grade
```
Unlike Guards, we do now use an ```=``` but following this we use the special syntax ```case _ of``` where ```_```is some expression. This expression can be many things: a single variable, a tuple, a calculation, a function applied to variables. As long as the expression returns some value, it can go there. For this function, we use ```grade``` as our expression.

After the special Case syntax, we pattern match on the possible return values (pattern match means 'does this expression have the same form and value?'). For us, that is the different grades we defined in the data type. From these, we then use ```->``` to say what the function should return:
```haskell
  N   -> "Fail"
  PS  -> "Pass at a Supplementary Examination"
  P   -> "Pass"
  CR  -> "Credit"
  D   -> "Distinction"
  HD  -> "High Distinction"
```
Just like we did with the Guard functions, we can make sure our function is safe from any weird or unexpected values (maybe ANU changes their ```Grade``` type but forgets to update this function). To do this, we add a catch-all, much like the ```otherwise``` for Guards that will always return its value. We can't use ```otherwise``` for Cases (why?), but we can use the Haskell wildcard ```_``` which means 'whatever'. So let's update our function:
```haskell
translateGrade :: Grade -> String
translateGrade grade = case grade of
  N   -> "Fail"
  PS  -> "Pass at a Supplementary Examination"
  P   -> "Pass"
  CR  -> "Credit"
  D   -> "Distinction"
  HD  -> "High Distinction"
  _   -> Error "Unexpected Value"
```
The wildcard is often useful when only some return values for the expression are special. You can pattern-match

## Case Examples
You know all there is to Cases. Before we move onto Guards, consider the following question: does the order of the case expressions matter?

Here are some more case examples. Discus what each function does:
```haskell
hello :: String -> String
hello country = case country of
  "Australia" -> "Hello World"
  "China"     -> "你好，世界"
  "Indonesia" -> "Halo Dunia"
  "Vietnam"   -> "Chào thế giới"
  "Portugal"  -> "Olá Mundo"
  "Korea"     -> "안녕하세요 월드"
  "Spanish"   -> "Hola Hundo"
  "Arabic"    -> "مرحبا بالعالم"
  "Russia"    -> "Привет, мир"
  "Thai"      -> "สวัสดีชาวโลก"
  "Turkey"    -> "Selam Dünya"
  _           -> "Sorry, your country isn't available at this time."
```
```haskell
boringTuple :: (Char, Char) -> String
boringTuple (char1, char2) = case char1 == char2 of
  True  -> "This Tuple is Boring"
  False -> "This Tuple is Interesting"
```
```haskell
data Pet = Cat | Dog | Fish | Parrot String
  deriving (Show, Eq)

hello :: Pet -> String
hello x = case x of
  Cat -> "Meeow"
  Dog -> "Woof"
  Fish -> "Bluubbb"
  Parrot name -> "Pretty " ++ name
```

## Question 1

Write the following functions. Some questions use specific ```data``` types that are defined below.

```haskell
data TrafficLight = Red | Yellow | Green
  deriving (Show, Eq)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq)
```

1) A case function that returns the driving instruction based on what the traffic light shows.

2) A guard function that takes your grade as a number and returns the appropriate ```Grade``` value.

3) A case function that takes a day of the week and returns where the COMP1100 lecture is that day.

4) A guard function that checks is a positive number is even and if so returns ```"This number is even!"```.

5) A guard function that takes two numbers are determines if both, one or none are even. (Remeber that ```||``` means 'OR' in Haskell!)

6) A case function that takes a character and checks if it is vowel or not.

## Question 2

Let's make a Scissors-Paper-Rock game in Haskell! To begin, we define our ```data``` types:
```haskell
data Move = Paper | Rock | Scissors deriving (Eq, Show)
data Result = Win | Draw | Lose deriving (Eq, Show)
```
These should both be pretty self-explanatory. Now, consider the following function:
```haskell
beats :: Move -> Move
beats move =
    | move == Paper     = Scissors
    | move == Rock      = Paper
    | move == Scissors  = Rock
```
This function will return the move that beats the input move. We can also write this function using Cases:
```haskell
beats :: Move -> Move
beast move = case move of
    Rock      -> Paper
    Paper     -> Scissors
    Scissors  -> Rock
```
Both versions of ```beats``` will produce the same output, however it is clear that using a case statement over guards leads to more easily readable code. Whenever you need a decision-making function, always consider whether you should use a Case or a Guard: always try to choose the option that leads to the easiest, simplest and cleanest code.

With this in mind, it is now your turn to choose which method to use as we complete the Scissors-Paper-Rock game. Finish the following function: it takes two moves as input, your move and your opponents move, and tells you the result:
```haskell
score :: Move -> Move -> Result
score myMove opponentMove ...
```
Remember - think carefully whether you want to you Cases or Guards.

(Hint: Use the ```beats``` function!)