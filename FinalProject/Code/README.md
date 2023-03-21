#Final Project Code and other materials

Layout of the code in terms of modularity
+ A file to dictate the creation of each individual "block" (tetris blocks + maybe something extra?? Rare chance for a crazy block?) 
  - (L, mirror L, T, |, square, Z, mirror Z)
+ File to dictate the randomness/variation of the type of block
+ File which sets the board (Inititalization)
  - File for speed?
+ File to display on VGA
+ File to 'destroy' blocks - Line completion and then shift down the remaining blocks A * 5px where A is number of rows removed relative
  - If row == 1
  - when a space (5px X 5px) is filled its 1 or on, else it's 0 or off
+ File for the inputs/controls + outputs on the board other than the VGA
  - Score, Block up next, Controls (L/R Slam 
