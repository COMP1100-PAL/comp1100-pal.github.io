---
layout: post
title:  "Othello Heuristics"
date:   2018-10-14 18:01:41 +1100
categories: worksheets wk3 decomposition
---

# Rules of Othello
 (taken from Wikipedia :P )
 
 Each of the disks' two sides corresponds to one player; they are referred to here as light and dark after the sides of Othello pieces, but any counters with distinctive faces are suitable. The game may for example be played with a chessboard and Scrabble pieces, with one player letters and the other backs.

The game begins with four disks placed in a square in the middle of the grid, two facing white side up, two pieces with the dark side up, with same-colored disks on a diagonal with each other. Convention has initial board position such that the disks with dark side up are to the north-east and south-west (from both players' perspectives), though this is only marginally meaningful to play (where opening memorization is an issue, some players may benefit from consistency on this). If the disks with dark side up are to the north-west and south-east, the board may be rotated by 90° clockwise or counterclockwise. The dark player moves first. 

Dark must place a piece with the dark side up on the board, in such a position that there exists at least one straight (horizontal, vertical, or diagonal) occupied line between the new piece and another dark piece, with one or more contiguous light pieces between them.
After placing the piece, dark turns over (flips, captures) all light pieces lying on a straight line between the new piece and any anchoring dark pieces. All reversed pieces now show the dark side, and dark can use them in later moves—unless light has reversed them back in the meantime. In other words, a valid move is one where at least one piece is reversed. 

Now light plays. This player operates under the same rules, with the roles reversed: light lays down a light piece, causing a dark piece to flip. 

Players take alternate turns. If one player can not make a valid move, play passes back to the other player. When neither player can move, the game ends. This occurs when the grid has filled up or when neither player can legally place a piece in any of the remaining squares. This means the game may end before the grid is completely filled. This possibility may occur because one player has no pieces remaining on the board in that player's color.

The player with the most pieces on the board at the end of the game wins.

# Some Tips to Find Good Strategies...
1) Try to figure out which positions are best. Are there any places on the board that, once a piece has been put there, can never change colour?

2) Is it best to try and get lots of pieces at the beginning? Why/why not?

3) Is it easy to spot a good move? Is it easier to spot a bad move?

