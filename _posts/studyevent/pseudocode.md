# Pseudocode
`interactionOf`?
`List Coord`?!
`withStartScreen`??!!!
No doubt you're as confused as we are! But don't worry, after this worksheet you will see what Tony has written in lecturers is not hieroglyphics; just simple logical statements in _Haskell_ syntax.
A good way to learn what some code does is by writing _pseudocode_. I will walk you through an example now!

### Pseudocode
#### Step 1) Using an Example.

Lets take a snippet of code from Live Coding Week 4: Polymorphism.

```
mapList :: (a -> a) -> List a -> List a
mapList _ Empty = Empty
mapList f (Entry c cs) = Entry (f c) (mapList f cs)
```
 The first step to understanding this function is seeing what it does with an example.

```
mapList sqrt (Entry 16 (Entry 9 (Entry 4 Empty)))
>> Entry 4 (Entry 3 (Entry 2 Empty)))
```
Here we have that `a` is an `Integer`. The function we are inputting into `mapList` is `sqrt :: Integer -> Integer`, which you should be familiar with. So `mapList` takes in a list, takes the square root of every element, then outputs the list.

#### Step 2) Writing it in basic English.
Pseudocode is writing out a function in easy to understand english, but structuring it to look like code. I'll show you with a pseudocode version of `mapList`:

```
mapList inputs: A function between two types and a list of that type.
mapList outputs: A list.
If the list is empty, output an empty list.
If the list isn't empty, apply the function to the first element,
and attatch this to mapList applied to the rest of the list.
```

As you can see, pseudocode can be very verbose. I could also write it more abstractly:

```
mapList (function, list of a) -> list of a
if (list a = Empty)
    output Empty
if (list a = first element + rest of list)
    output function(first element) + mapList (function, rest of list)
```

 **You should aim to write pseudocode that you can understand as well as possible.**

#### Step 3) Commenting Code
You should be submitting code on Friday that is commented. The last step is to comment aspects of your pseudocode into your Haskell functions. For example:
```
mapList :: (a -> a) -> List a -> List a
-- applies a function to every element of a list
mapList _ Empty = Empty
-- take empty lists to empty lists
mapList f (Entry c cs) = Entry (f c) (mapList f cs)
-- applies the function to the first element, attatches this recursively
-- to mapList applied to the rest of the list.
```

#### The Task
Try implementing the tree step method above with the following code you may be using from your assignment.
##### Code 1

```
initialBoxes :: List Coord
initialBoxes = rows (-10) Empty

rows :: Integer -> List Coord -> List Coord
rows 11 acc = acc
rows r acc = rows (r+1) (cols r (-10) acc)

cols :: Integer -> Integer -> List Coord -> List Coord
cols _ 11 acc = acc
cols r c acc = case maze (C r c) of
  Box -> cols r (c+1) (Entry (C r c) acc)
  _   -> cols r (c+1) acc
  ```
  
##### Code 2

```
startScreenInteractionOf ::
    world -> (Double -> world -> world) ->
    (Event -> world -> world) -> (world -> Picture) ->
    IO ()
startScreenInteractionOf state0 step handle draw
  = interactionOf state0' step' handle' draw'
  where
    state0' = StartScreen

    step' _ StartScreen = StartScreen
    step' t (Running s) = Running (step t s)

    handle' (KeyPress key) StartScreen
         | key == " "                  = Running state0
    handle' _              StartScreen = StartScreen
    handle' e              (Running s) = Running (handle e s)

    draw' StartScreen = startScreen
    draw' (Running s) = draw s
```
##### Code 3

```
resetable :: Interaction s -> Interaction s
resetable (Interaction state0 step handle draw)
  = Interaction state0 step handle' draw
  where handle' (KeyPress key) _ | key == "Esc" = state0
        handle' e s = handle e s
```
Remember the type definition for `Interaction`:

```
data Interaction world = Interaction
        world
	    (Double -> world -> world)
        (Event -> world -> world)
	    (world -> Picture)
```


