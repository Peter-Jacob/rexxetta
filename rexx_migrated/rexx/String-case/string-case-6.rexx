/*ª*REXX program  swaps the letter case of a string:  lower â”€â”€â–º upper  &  upper â”€â”€â–º lower.*/
abc = "abcdefghijklmnopqrstuvwxyz"               /*ª*define all the  lowercase  letters.  */
abcU = translate(abc)                            /*ª*   "    "   "   uppercase     "      */

x = 'alphaBETA'                                  /*ª*define a string to a REXX variable.  */
y = translate(x,  abc || abcU,  abcU || abc)     /*ª*swap case of  X  and store it â”€â”€â”€â–º Y */
say x
say y
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-case\string-case-6.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
