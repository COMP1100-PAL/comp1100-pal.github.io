# Functions
##### Piecewise 
You've seen lots of this in lectures. Here's an example copy and pasted from your assignment:
```Haskell
adjacentCoord :: Direction -> Coord -> Coord
adjacentCoord R (C x y) = C (x+1) y
adjacentCoord U (C x y) = C  x   (y+1)
adjacentCoord L (C x y) = C (x-1) y
adjacentCoord D (C x y) = C  x   (y-1)
```

##### Cases
Cases are just an extension of the piecewise definition. Cases use pattern matching, just like the piecewise definition. Using case statements allows for less repetition, but you are limited to matching only one variable.

__Write ``adjacentCoord`` using a case statement.__

##### Guards
Guards are similar to piecewise and case statements in that they check for something and then runs the corresponding code. The only way it differs is that guards involve a Boolean expression as opposed to a pattern.

__Write the absolute value function using guards.__

###### Where to use where statements
Where statements are used when there is a long block of code that you want to make shorter, or when an expression appears more than once. 

__Clean up the following embarassing code from my first year with where statement(s)__

```Haskell
world :: DenseWorld -> DenseWorld
world denseWorld = denseWorld 
    {theWorld = direction (antDirection denseWorld) denseWorld, 
         minX = checkminX (xCoord (getCoord denseWorld)) denseWorld, 
         maxX = checkmaxX (xCoord (getCoord denseWorld)) denseWorld, 
         minY = checkminY (yCoord (getCoord denseWorld)) denseWorld, 
         maxY = checkmaxY (yCoord (getCoord denseWorld)) denseWorld}
```

__Is this Boolean, pattern or both?!__
```Haskell
x > 3
```
```Haskell 
True
```
```Haskell
otherwise 
```
```Haskell
even 5
```
```Haskell
Even 5
```
```Haskell
Just Nothing
```