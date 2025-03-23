/*ª*REXX program displays a  "spinning rod"  (AKA:  trobbers  or  progress indicators).   */

if 4=='f4'x  then bs= "16"x                      /*ª*EBCDIC?  Then use this backspace chr.*/
else bs= "08"x                      /*ª* ASCII?    "   "    "      "      "  */

signal on halt                                   /*ª*jump to   HALT   when user halts pgm.*/
newV1= 'â”‚/â”€\'                                        /*ª*the throbbing characters for display.*/
do j=1                         /*ª*perform  until  halted by the user.  */
call charout ,  bs  ||  substr(newV1, 1 + j//length(newV1), 1)
call delay .25                 /*ª*delays a quarter of a second.        */
if result==1  then leave       /*ª*see if  HALT  was issued during DELAY*/
end   /*ª*j*/

halt: say bs  ' '                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Spinning-rod-animation-Text\spinning-rod-animation-text.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
