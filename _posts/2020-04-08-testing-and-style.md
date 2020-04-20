---
layout: post
title:  "Testing and Style"
date:   2020-04-20 11:00:00 +1100
categories: worksheets
---

## Testing: Black box and White Box

Testing is an important part of programming: it is a validation step that ensures all code is working and functioning as intended. Without testing, the code has no real value as there is no guarantee that it does anything.

Given that testing is so important, it is split into two distinct parts: __**Black Box**__ and __**White Box**__ testing.

### Black Box Testing

Black box testing focuses on ensuring that code written is the right function, not something else. This means it is only motivated by the specification and not the code itself. For example, if we are given:

```haskell
-- adds 1
addOne :: Int -> Int
```

Then we can still write black box tests (here we use doctest):

```haskell
-- >> addOne 5
-- 6
-- >> addOne 178
-- 179
-- >> addOne -23
-- 22
```

So we are testing that ```addOne``` does what it says: it adds 1 to integers!

So to write good black box tests, understand the function specification and then test 'typical' representatives for the different types of inputs that can be given. If multiple inputs can be given, then testing all combinations and possibilities is important.

### White Box Testing

White box testing focuses on the written code itself, ensuring that it has no errors and doesn't miss anything. It is motivated by the specific implementation used. This white box testing needs the full function definition in order to be done: we can't test a specific implementation without knowing the implementation itself!

So white box testing first involves identifying the logic of the implementation, the edge cases (values that lie just within guards or cases), the branches and the functions it calls. Then we can choose specific inputs that tests this logic and ensures it gives the outcome that the specification requires.

So if it turns out that our ```addOne``` function is implemented like so:

```haskell
-- adds 1
addOne :: Int -> Int
addOne i
    | i > 10 = i + 1
    | i < 10 = - (-i - 1)
```

Then, good white box testing identifies the two guards ```i > 10``` and ```i < 10``` and tests the edge cases for these:

```haskell
-- >> addOne 11
-- 12
-- >> addOne 9
-- 10
-- >> addOne 10
-- 11
```

If we ran these tests, we would quickly see that our ```addOne``` can't deal with ```10```. Even though this number has no meaning in the specification, it has additional purpose in this implementation and so white box testing identifies this and then finds the error.

### Testing IRL

You should always write tests for your functions: as said, it is the only way to ensure that they are correct! This applies especially to assignments, as it not only shows good programming methods but also allows you to ensure you are correct without feedback!

Finally, it is worth noting that in professional programming environments, implentation and testing is often split between people. One person will define a specification, one will write the function, one will write the black box tests (possibly even before the function has finished being completed!) and then finally another individual will get the function implementation and write white box tests. This ensures that the white box tests focus on the implementation while the black box tests focus on the specification, as well as ensuring that fresh eyes see the code and understand the logic.



## Question: Writing Black Box Tests

Write 3 black box tests for the following functions. Note that you only have the function name and type signature. So you don't know how the function works and operates, meaning that your tests will focus on the overall functionality rather than internal calculation.

```haskell
absoluteValue :: (Num a, Ord a) => a -> a
```

```haskell
isNotNegative :: (Num a, Ord a) => a -> Boolean
```

```haskell
data Triangle = Equilateral | Isosceles | Scalene
-- Given three side lengths, determines whether the triangle is Equilateral, Isosceles or Scalene
typeOfTriangle :: (Num a) => a -> a -> a -> Triangle
```

```haskell
-- Sum the elements of the list that are odd
sumOdd :: [Int] -> Int
```

```haskell
data Month
    = January
    | February
    | March
    | April
    | May
    | June
    | July
    | August
    | September
    | October
    | November
    | December
  deriving (Show, Eq, Enum)
data Day = Integer
type Date = (Month, Day)
-- Ignoring leap years, return the date of the next day
nextDate :: Date -> Date
```

## Question: White Box Tests

Now that you have written your black box tests, let's look at the code and write some white box tests. Some of the functions are broken: use white box tests to find these errors.

```haskell
absoluteValue :: (Num a) => a -> a
absoluteValue a
    | a < 0 = -a
    | a >= 0 = a
```

```haskell
isNotNegative :: (Num a) => a -> Boolean
isNotNegative a
    | a > 0 = True
    | otherwise = False
```

```haskell
data Triangle = Equilateral | Isosceles | Scalene
typeOfTriangle :: (Num a) => a -> a -> a -> Triangle
typeOfTriangle a b c
    | a == b && b == c = Equilateral
    | a == b || b == c = Isosceles
    | s > a && s > b && s > c = Scalene
    | otherwise = error "Not a Triangle"
      where
        s = (a+b+c)/2
```

```haskell
sumOdd :: [int] -> int
sumOdd l = case l of
    [] -> 0
    x:xs -> x * (x `mod` 2) + (sumOdd xs)
```

```haskell
data Month = January | February | March | April | May | June | July | August | September | October | November | December
  deriving (Show, Eq, Enum)
type Day = Int
type Date = (Month, Day)

-- Ignoring leap years, return the date of the next day
nextDate :: Date -> Date
nextDate (month, day)
    | month == February = increment (month, day) 28
    | elem month monthsWith31Days = increment (month, day) 31
    | otherwise = increment (month, day) 30
  where
    monthsWith31Days = [January, March, May, July, August, October, December]
    increment :: Date -> Int -> Date
    increment (m,d) n
        | d >= n =   (succ m , (d+1) `mod` n)
        | otherwise = (m, d+1)
```

The white box testing for the final function is hard. This is because the style is poor, making it difficult to understand and then test. So let's look at how we can improve style.


## Style

Having a **well formatted and stylish** is good for many reasons: it makes it easy to understand, debugging is simpler, tutors will love you (and probably give you marks) and it looks like you know what you are doing!

So we are going to look at the many different aspects that come together to make your code stylish. We have grouped these into five main concepts:

1. Naming 
2. Using Polymorphism
3. Alignment 
4. Removing Redundant Code
5. Comments
6. Helper Functions

If you follow the principles we outline below for each of these, then your code will be stylish as well!


### Naming
There are a few conventions that you should follow. We already know the general:
- ```lowerCamelCase``` for function and variable names.
- ```UpperCamelCase``` for data types, typeclasses and constructors.

In addition to this, the names should describe their purpose. Using ```function1, function2, ...``` or ```input1, input2, ...``` provides no information about what each function or input does and so means that the reader must work it out themselves and then remember. When the name describes the purpose, such as ```reverse``` or ```counter```, then the code is much easier to understand.

That said, variable names shouldn't be too long. This is pointless:
```haskell
takeHead :: [a] -> a
takeHead [] = error " list is empty"
takeHead (firstElementofList:remainingElementsOfList) = firstElementofList
```
when you can just do the following:
```
takeHead :: [a] -> a
takeHead [] = error " list is empty"
takeHead x:xs = x
```

The previous example also highlights that there are some conventions already, e.g ```x:xs``` is a standard for a list with head ```x``` and tail ```xs```. There are other standards, such as: 
- List: ```ls, x:xs, x:y:xs```
- Integer: ```m, n, i```
- String: ```str```

These should be used, but if more detailed names make the code more understandable then it is better to use detailed (short) names.

### Using Polymorphism 
We can use concepts of polymorphism to avoid multiple functions being written for the same purpose. This was explained in detail in the [previous worksheet](https://comp1100-pal.github.io/worksheets/2020/03/29/polymorphism.html).

### Alignment
It is very important to algin code properly, with the different parts of functions aligned systematically.

When defining types, use *comma-leading* style for formatting lists and break the options into multiple lines:.
```haskell
data TrafficLight
    = Red
    | Yellow
    | Green
    deriving (Eq)

answers :: [Maybe Int]
answers =
    [ Just 32
    , Nothing
    , Just 72
    , Nothing
    ]
```
Code blocks should be indented with 4 spaces (a tab):
```haskell 
showSign :: Int -> String
showSign n
    | n == 0    = "Zero"
    | n < 0     = "Negative"
    | otherwise = "Positive"
```
```where``` keywords should only indent 2 spaces although they should be followed by a full code block indentation:
```haskell
fib :: Int -> Int
fib n = helper 0 1 n
  where
    helper a b c
        | c == 0    = a
        |otherwise  = helper b (a+b) (c-1)
```
Additionally, the outputs for guards and cases should align:
```haskell
trffInstr :: TrafficLight -> String
trffInstr light = case light of
    Red     -> "Stop"
    Yellow  -> "Slow Down"
    Green   -> "Go"
    _       -> error "Unexpected TrafficLight Value"

```
Finally, the maximum line length is 90 characters. You shouldn't need to go anywhere near this, but if you do, split the line to make it more readable.

### Removing Redundant Code
Look at the following example 
```haskell 
largerNumber :: Int -> Int -> Int
largerNumber x y
    | (x > y) == True   = x
    | otherwise         = y
```
```x > y``` already outputs a boolean value, and so the ```== True``` is entirely redundant. This is a common mistake and so a good example of redundant code. Another example is:
```haskell
grade :: Int -> String
grade n
    | (100 >= n) && (n >= 80)   = "HD"
    | (80  >  n) && (n >= 70)   = "D"
    | (70  >  n) && (n >= 60)   = "Cr"
    | (60  >  n) && (n >= 50)   = "P"
    | otherwise                 = "Fail"
```
Guards are evaluated in order, and so this can be simplified to just:
```haskell
grade :: Int -> String
grade n
    | n >= 80   = "HD"
    | n >= 70   = "D"
    | n >= 60   = "Cr"
    | n >= 50   = "P"
    | otherwise = "Fail"
```
Additionally, if multiple guards or cases give the same result, then just put them into one:
```haskell
data Day
    = Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday
    deriving (Eq)

isWeekend :: Day -> String
isWeekend d
    | (d == Saturday) || (d == Sunday)  = "YAY!! It is the Weekend!"
    | otherwise                         = "Bummer! it is not the weekend yet."
```
Finally, if you find yourself copy-pasting a lot of code around your file, repeating the same things over and over, then use polymorphism or helper functions.

### Comments 
It is very important to have comments in order to make your code more understandable for a reader. Each function should have a comment that explains what its purpose is:
```haskell
-- isReverse takes two lists and determines whether one is the reverse of the other.
isReverse :: (Eq a) => [a] -> [a] -> Bool
isReverse ls1 ls2 = ls1 == reverse ls2
```
You should also use comments to group parts of your file into distinct sections:
```haskell
{-|
------------------------------------------------------------
Data Types: Day, SemesterPeriod
------------------------------------------------------------
|-}

-- Day is a data type that defines the days of the week
data Day
    = Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday
    | Sunday
    deriving (Eq)

-- SemesterPeriod outlines the various different times of the university semester
data SemesterPeriod
    = TeachingWeeks
    | TeachingBreak
    | StudyVacation
    | Exams
    deriving (Eq)

{-|
------------------------------------------------------------
Functions: shouldIStudy
------------------------------------------------------------
|-}

-- isReverse takes the day and the semester period and returns a string saying whether the student should be studying.
shouldIStudy :: Day -> SemesterPeriod -> String
shouldIStudy day semPeriod
    | semPeriod == Exams || semPeriod == StudyVacation  = "I should be studying for my exams"
    | semPeriod == TeachingBreak                        = "I should maybe revise some content"
    | (day == Saturday) || (day == Sunday)              = "Weekend means no study!"
    | otherwise                                         = "I should be studying my lectures and attending labs"
```
The file shouldn't always be split into types and functions: functions that apply directly to one type should remain near that type. So think about how it is best to divide and comment your work.

### Helper Functions
If a function is becoming overly complex, then you should use a helper functions
```haskell
-- maxValue gets the maximum value of a list
maxValue :: (Ord a) => [a] -> a
maxValue ls = case ls of
    x:y:xs
        | x >= y    -> maxValue (x:xs)
        | otherwise -> maxValue (y:xs)
    x:xs            -> x
    []              -> error "Invalid empty list input"

-- minValue gets the minimum value of a list
minValue :: (Ord a) => [a] -> a
minValue ls = case ls of
    x:y:xs
        | x <= y    -> minValue (x:xs)
        | otherwise -> minValue (y:xs)
    x:xs            -> x
    []              -> error "Invalid empty list input"

-- listRange finds the smallest and largest values of a list of numbers and finds their difference
listRange :: (Num a, Ord a) => [a] -> a
listRange ls = maxValue(ls) - minValue(ls)
```
Note that even though the final function ```listRange``` only work on ```Num a```, the helper functions ```maxValue``` and ```minValue``` are defined on ```Ord a``` to keep them as general as possible.


## Question: Code Style

Below are lots of example haskell functions. Many of them have terrible style, for a variety of reasons. For each function, fix them to make them beautifully readable!

```haskell
-- map applies a function to each element of the list
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map function (firstElement:remainingList) =
    function firstElement : map function remainingList
```

```haskell
-- bmi calc
bmi :: Double -> Double -> String
bmi x y
    | x / y^2 <= 15     = "Severely Underweight"
    | x / y^2 <= 18.5   = "Underweight"
    | x / y^2 <= 25     = "Normal"
    | x / y^2 <= 30     = "Overeight"
    | otherwise         = "Obese"
```

```haskell
answers :: [Maybe Int]
answers =[ Just 42
    , Just 7
            , Nothing
    ]
```

```haskell
-- meanFuncValue calculates the mean (i.e. average) of a list after applying a function to each element of the list
meanFuncValue :: [Int] -> (Int -> Float) -> Float
meanFuncValue ls f = helper ls f (length ls)
  where
    helper :: [Int] -> (Int -> Float) -> Int -> Float
    helper ls f len = case ls of
        []      -> 0
        x:xs    -> ((f x) / (fromIntegral len)) + helper xs f len
```

```haskell
-- count finds how many repetitions of a specific element there are in a list
count :: (Eq a) => [a] -> a -> Double
count n ls
    | head n == ls  = 1 + count (tail n) ls
    | otherwise     = count (tail n) ls
```