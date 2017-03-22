# The Wonderful World of Warehouse
Warehouse has a _lot_ of data types in it. The aim of this exercise is to get you comfortable with the world of warehouse and especially the `interactionOf` data type.

#### Step 1
Draw a picture of the warehouse. Label all the data types that you can see, including `Tile`, `Coord`, `Direction` and `Picture`.

#### Step 2
Let's try and visualise `interactionOf`, which has the type signature:
```
interactionOf :: world ->
                (Double -> world -> world) ->
                (Event -> world -> world) ->
                (world -> Picture) ->
                IO ()
```
Putting `interactionOf` in action, we have
```
main = interactionOf initialCoord handleTime handleEvent drawState

handleTime :: Double -> Coord -> Coord
handleTime _ c = c

handleEvent :: Event -> Coord -> Coord
handleEvent e c = adjacentCoord U c

drawState :: Coord -> Picture
drawState c = atCoord c pictureOfMaze
```

Draw what `handleTime`, `handleEvent` and `drawState` does to the Warehouse in the context of the function `main`.

### Step 3
Invent your own `handleTime` and `handleEvent` function! Don't write it out in formal `Haskell`, but just talk in your group about a time based action and an event based action you could operate on the Warehouse. Draw it on your diagram!

### Step 4
Talk about these topics in your group, and write down any ideas you have:
* Why does handleTime have the data type `(Double -> world -> world)`? Could it be anything else?
* Why does handleEvent have the data type `Event -> Coord -> Coord`? Could it be anything else?