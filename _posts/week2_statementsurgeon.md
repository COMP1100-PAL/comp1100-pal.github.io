# Statement Surgeon
In your first week lab, you used GHCi (an interactive Haskell envinronment) to evaluate the following expressions. Today, you're going to figure out what data types these expressions involve. For each expression, answer the following questions:
1. What is the data type of the output?
2. What is the data type of the function/operation used? 

For example, "1+2" outputs "3", an integer (although it could be other types; what might those be?), and "+" has the type integer -> integer -> integer.
```
2 ^ 5
sqrt 4.0
sqrt 4*100     -- Think carefully about the output from this one
sin (pi/2.0)
[1 .. 10]
[1, 3 .. 11]
[1, 3 .. 12]
sum [1 .. 100]
product [1, 3 .. 10]
"Out" ++ "shined"
length "Room a thousand years wide"
words "Fell on black days"
6 < 4
compare 4 5
compare (Just 5) Nothing
Nothing
True && False
True || False
(1 + 1 == 2) || (1 + 1 == 3)
```