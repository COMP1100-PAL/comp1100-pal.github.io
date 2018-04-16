---
layout: post
title:  "I am become Codeworld"
date:   2018-04-16
categories: week 7, comp1100
---

# How to be a codeworld
This activity needs to be performed in groups of at least 3, prefereably 4. Extra people can be swapped in and out throughout the activity. `interactionOf` is a very difficult function to get a grasp of, but also functions like `handleEvent` and `drawState` can take you for a spin as well. In this activity you'll be working as a team to act like you're the assignment.

In your group assign everyone the following roles: 
 * Someone will play the part of `interactionOf`
 * Someone will play the part of `handleTime` (the person playing `interactionOf` can do this one as well if you don't have 4 people)
 * Someone will play the part of `handleEvent`
 * Someone will play the part of `drawState` 

You all have to work together to manage the state changes over time and when events are fired. The initial state looks like this: 
`State = World [] (RectangleTool Nothing) Black` 
Write this on the whiteboard on the left side, on the right side leave it blank. You'll use the left side to update the programs state and the right side to draw the shapes you make.

## `interactionOf`
The person playing `interactionOf` has a pretty easy job, they just have to do the following things in a loop:
1. Tell the time since the start to the person playing `handleTime`, assume that it takes one second every loop.
2. If there's an event tell the person playing `handleEvent` what the event was
3. Tell the person playing `drawState` to erase the whiteboard and draw the new state
4. Repeat

## `handleTime`
Another easy job, Take the state of the world, and depending on the time of the program return a new state.

## `handleEvent`
Handle event is a bit more difficult, they have to change the state of the world depending on an input that `interactionOf` gives them. For example, if the event is a `Keypress` `c` you have to change the tool to the CircleTool, or if the event is `Keypress` `2` they would have to change the colour of the state to `State = World [] (RectangleTool Nothing) Cyan` or similar.

## `drawState`
drawState takes the world and draws what the list of graphics says to draw. Initially the list of graphics is empty `[]` but as events are handled some more graphics will populate the list within the state. For example if the list looked like `[(Polygon [(3.0,5.0),(6.0,8.0),(9.0,2.0)])]` You would draw a triangle on the whiteboard. Remember you must erase the whiteboard every time you are told by `interactionOf`
