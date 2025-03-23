/*ª*REXX program plays  guessâ”€theâ”€number  (with itself)  with  positive rational numbers. */
parse arg low high frac seed .                   /*ª*obtain optional arguments from the CL*/
if  low=='' |  low=="," then  low=    1          /*ª*Not specified?  Then use the default.*/
if high=='' | high=="," then high= 1000          /*ª* "      "         "   "   "     "    */
if frac=='' | frac=="," then frac=    1          /*ª* "      "         "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*ª*Useful seed?  Then use a random seed.*/
fdigs= 10**frac                                  /*ª*compute the number of fractional digs*/
newV1= random(low, high) + random(0,fdigs) / fdigs   /*ª*Tougher game?  It may have fractions.*/
newV2= "â”€â”€â”€â”€â”€â”€â”€â”€ Try to guess my number  (it's between  "        /*ª*part of a prompt message.*/
g=                                                           /*ª*nullify the first guess. */
do newV3=1;                        oldg= g       /*ª*save the guess for later comparison. */
if pos('high', info)\==0  then high= g       /*ª*test if the guess is too  high.      */
if pos('low' , info)\==0  then low = g       /*ª*  "   "  "    "    "  "   low.       */
say                                          /*ª*display a blank line before prompt.  */
say newV2 low  '  and  '   high  "  inclusive):" /*ª*issue the prompt message to terminal.*/
say                                          /*ª*display a blank line  after prompt.  */
g= (low +  (high - low) / 2)   / 1           /*ª*calculate the next guess & normalize.*/
if g=oldg   then g= g + 1                    /*ª*bump guess by one 'cause we're close.*/
say 'My guess is'       g                    /*ª*display computer's guess to the term.*/
if g=newV1  then leave                           /*ª*this guess is correct; leave & inform*/
if g>newV1  then info= right(' Your guess is too high.', 60, "â”€")
else info= right(' Your guess is too low.' , 60, "â”€")
say info
end   /*ª*try*/
say                                              /*ª*stick a fork in it,  we're all done. */
say 'Congratulations!   You guessed the secret number in'    newV3    "tries.""
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Guess-the-number-With-feedback-player-\guess-the-number-with-feedback-player--2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
