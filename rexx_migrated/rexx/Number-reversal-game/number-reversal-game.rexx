/*ª*REXX program (a game):  reverse a jumbled set of decimal digits 'til they're in order.*/
signal on halt                                   /*ª*allows the CBLF to  HALT the program.*/
newV1= copies('â”€', 9);      pad=left('', 9)        /*ª*a fence used for computer's messages.*/
say newV1  "This game will show you nine random unique digits  (1 â”€â”€â–º 9),  and you'll enter"
say newV1  "one of those digits  which will reverse all the digits from the left-most digit"
say newV1  "up to  (and including)  that decimal digit.  The game's objective is to get all"
say newV1  "of the digits in ascending order with the fewest tries.    Here're your digits:"
ok= 123456789                                    /*ª*the result that the string should be.*/
newV2=                                               /*ª* â—„â”€â”€â”€ decimal target to be generated.*/
do  until length(newV2)==9;     newV3=random(1, 9) /*ª*build a random unique numeric string.*/
if pos(newV3, newV2) \== 0  then iterate           /*ª*Â¬ unique? Only use a decimal dig once*/
newV2=newV2 || newV3                                   /*ª*construct a string of unique digits. */
if newV2==ok  then newV2=                          /*ª*string can't be in order, start over.*/
end   /*ª*until*/

do  score=1  until  newV2==ok;           say       /*ª* [â†“]  display the digits & the prompt*/
say newV1  newV2   right('please enter a digit  (or  Quit):', 50)
parse pull ox  .  1  ux . 1  x  .;   upper ux  /*ª*get a decimal digit (maybe) from CBLF*/
if abbrev('QUIT', ux, 1)  then signal halt     /*ª*does the CBLF want to quit this game?*/
if length(x)>1  then do;  say newV1 pad '***error***  invalid input:  ' ox;  iterate;  end
if x=''  then  iterate                         /*ª*try again, CBLF didn't enter anything*/
g=pos(x, newV2)                                    /*ª*validate if the input digit is legal.*/
if g==0  then say newV1 pad '***error***  invalid digit:  '     ox
else newV2=strip(reverse(left(newV2,g))substr(newV2,g+1))  /*ª*reverse some (or all) digits*/
end   /*ª*score*/

say;    say newV1  newV2;     say;    say center(' Congratulations! ', 70, "â•");       say
say newV1 pad  'Your score was' score;  exit       /*ª*stick a fork in it,  we're all done. */
halt:  say  newV1  pad  'quitting.';     exit      /*ª*  "   "   "   "  "     "    "    "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Number-reversal-game\number-reversal-game.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
