--
layout: post
title:  "Harder list and tree algorithms"
date:   2017-04-22
categories: worksheets wk8
---
# Maintaining the Garden
You have successfully survived the mid semester exams, but as a result of the turbulent semester, you have taken up gardening as a hobby and a stress reliever. Now, you look at your glorious garden fit for royalty and you feel a sense of pride, but also an itch to maintain it. 

##### GMOs
There are lots of apple trees in your garden, but you're craving pineapple. You dimly remember seeing something about genetic modification. Maybe you can give that a try. Who knows, it might just become a PPAP instead... do pens even have DNA? You dimly wonder as you start pulling out petri dishes.

Write a function ``treemap :: (a -> b) -> Tree a -> Tree b`` that takes in a tree and applies a function to every node in the tree.

##### OCD
Months have gone by, and you are now collecting seeds from your magnificent garden. Shame the help you've hired in the form of your younger siblings aren't of the highest quality- they've mixed up the seeds from your mimosa and anises! Now you have to manually sort them by hand, or, maybe you could make a machine do it for you...?

Write a function ``group :: String -> [String]`` that groups all the same characters. 
For example ``group "ahhhhh saaaaaveeeee meeeeee" = ["a", "hhhhh", " ", "s", "aaaaa", "v", "eeeee", " ", "m", "eeeeee"]``

##### Trimming the Tree
Programming the machine to sort the seeds took way longer than expected. Summer has come and gone, it's now well into autumn and about time to trim the overgrowth. It is the wrong season for grafting, but maybe now is a good time to attempt that PPAP plant again...

Write a function ``delete :: a -> Tree a -> Tree a`` that takes an element, finds it in the tree, and deletes it.