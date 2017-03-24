---
layout: post
title:  "Explaining Assignment Code"
date:   2017-03-24 18:01:41 +1100
categories: worksheets wk6 code explaining
---

# Explaining Assignment Code
 ### Practice  
 Today, we're going to practice explaining and commenting code, by examining Tony's solutions!
 
 First off, let's look at Tony's data types, as well as some you needed to write yourself. Describe each one briefly, and how it relates to the maze.
  ```Haskell
data List a = Empty | Entry a (List a)

data Coord = C Integer Integer

data Direction = R | U | L | D

data State = State Coord Direction (List Coord)
 ```
 
 Now let's look at another piece of code Tony graciously provided you with: *initialBoxes*. Write comments for each function, and make sure you can explain to other students/mentors what the function is doing.
 
 ```Haskell
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
 
 What will this function be used for?
 
 ### The Big One
 Finally, write up the names of all the major functions you needed for the assignment on the whiteboard. (Don't be afraid to ask other students if you've forgotten some!) Then write the type signature of each function, and explain briefly what the purpose of each one is.
 

