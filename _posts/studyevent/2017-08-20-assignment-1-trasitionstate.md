---
layout: post
title:  "assignment 1 study event transitionState worksheet"
date:   2017-08-20 19:02:41 +1100
categories: worksheets study event transitionState
---
# transitionState

In this worksheet, we'll be looking at breaking down the ``transitionState`` function.

The first thing is understanding what is the record type ``State``. 
Ask yourself and try explaining to your peers:
What is the ``board``? 
What is the ``ships``? 
What is the ``condition``? 
What is ``numMoves``? 
What do each of these fields do?
-- if you can fully understand the record type and what they represent in the game, writing ``transitionState`` becomes a lot easier.

Think about how you would normally play the Battleships game. 
How do we know when the game is finished? 
When you check a position, what happens if there is a ship there, what happens if there isn't?

The assignment spec has broken down the function quite well for us. So the following steps are just copied from the assignment spec. Each step has hints attached to them if you're stuck.
Make sure you at least think about how you would impliment the step before you ask for help. If possible, locate your specific issue before asking questions. A general question like: "How do I impliment ``trasitionState`` won't get you helpful answers; a better question would be: "How do I tell if there is a ship at a certain position?"

1. If the condition of the state is Won or Lost, return the original state unchanged.
Hint: How do you tell what the condition of the state is?

2. If the move counter is equal to 20, change the condition to Lost, and return the new state.
Hint: How do you find what the move counter is at? Remember how to pull and change things in a record type.

3. If the target coordinate is outside of the coordinate range, e.g. (10, 10), return the original state unchanged.
Hint: Make sure this is consistent with your ``coordInBound`` function. If you're stuck here, going back to look at ``coordInBound`` is a good idea.
Extra hint: You could use the ``coordInBound`` function here, but keep in mind that you're trying to ask the opposite, if the coodinate is *not* in bound.

For step 4 and 5 the function ``updateList`` is *very* helpful.

4. If the target coordinate has a ship present:
Before you try to do the rest, first determine how to find out if there is a ship present at the given coordinate. (``!!`` might be useful)
  a) Mark the coordinate as ``Hit``
  Hint: Recall how you changed the ``gsShips :: Ships`` in ``GenShips`` in the ``placeShips`` function. This is the same, except instead of changing it from ``False`` to ``True``, you're changing it from ``Unchecked`` to ``Hit``
  b) If all ships are sunk, change the Condition to Won, and return the new state.
  Hint: How do you know if *all* the ships are sunk? Try to impliment this as a seperate function.
  c) If there are still remaining ships, return the new state.
  Hint: If not all the ships are sunk you should do this, so how do you know if not all the ships are sunk? (Check what you did in 4.b))
  
5. If the target coordinate does not have a ship present:
  a) Mark the coordinate as ``Miss``
  Hint: This is the same as 4.a), except here you're changing ``Unchecked`` to ``Miss``. 
  b) Increase the moves counter by one, and return the new state.
  Hint: Could you add 1 to the old move number? How to you pull out the old move number? 
  
If you've finished the worksheet up to here, congratulations! You've finished the assignment!!! There is a room for writing a report and a midsem revision room as well if you're worried about those sections.
