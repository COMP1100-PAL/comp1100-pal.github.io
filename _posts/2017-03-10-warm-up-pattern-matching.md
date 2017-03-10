# Pattern Patching

All of the functions below have an error of some kind in them, whether it’s a logic, syntax, type, or parse error. See if you can find them all!

```Haskell
-- Describes a person’s head size
headSize :: (Integer a) => a -> Integer
headSize circ
    | circ <= 19.5 == "You must be tiny!"
    | circ <= 25.0 == ""Normal", or so they say..."
    | circ <= 30.0 == "Above average, but that’s fine"
    | otherwise == "Brainiac!"

-- Return the last element of the list, if not empty
lastElem :: [a] -> Maybe a
lastElem list = case list of
    [] -> Nothing
    [x] -> Just x
    (notLast:rest) -> lsatElem rest

-- Describes whether a choice was first or second
Data choices = First String | Second | Third | Fourth
whichChoice ch =
case ch of
    first _ -> "First!"
    second -> " Second!"
    _ -> "Something else :("
```
# Get on the Case (Statements)
```Haskell
--Complete this function so that it gives the first Integer in the tuple as its output.
first_of_tuple :: (Integer, Integer) -> Integer

--Complete this function so that it will return True if the list is empty, and False if it has any elements.
is_empty :: [Integer] -> Boolean

--Complete this function so that it returns True if the first element in the list is zero, and False otherwise.
has_zero_first :: [Integer] -> Bool
```


