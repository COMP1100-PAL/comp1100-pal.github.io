# The Root of all Problems

Let's write a function to calculate the square root of a number. Consider the following implementation using guards.

```
root :: Float -> Float
root x
    | x >= 0 = sqrt x
    | otherwise = error "Can't take the square root of a negative number!"
```

How primitive! Surely, you can write a better function?
#### Question 1
Rewrite the function `root` using case statements and avoiding the error message by outputting a `Maybe Float`.


#### Question 2
Rewrite `root` to allow a `Maybe Float` as an input _and_ as an output. Do this using a guard statement nested in a case statement.