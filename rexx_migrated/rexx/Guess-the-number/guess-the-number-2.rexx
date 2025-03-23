/*ª*REXX program interactively plays "guess my number" with a human, the range is 1â”€â”€â–º10. */
newV1= random(1, 10)                                 /*ª*generate a low random integer.       */
say 'Try to guess my number between 1 â”€â”€â–º 10  (inclusive).'  /*ª*the directive to be used.*/

do j=1  until  g=newV1                      /*ª*keep prompting 'til done.*/
if j\==1  then say 'Try again.'         /*ª*issue secondary prompt.  */
pull g                                  /*ª*obtain a guess from user.*/
end   /*ª*j*/
say 'Well guessed!'                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Guess-the-number\guess-the-number-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
