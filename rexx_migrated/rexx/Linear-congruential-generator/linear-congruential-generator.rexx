/*ª*REXX program uses a linear congruential generator (LCG)  that simulates the old  BSD  */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€ and MS random number generators:    BSD= 0â”€â”€â–º(2^31)-1     MS= 0â”€â”€â–º(2^16)-1   */
numeric digits 20                                /*ª*use enough dec. digs for the multiply*/
two@@16= 2**16                                   /*ª*use a variable to contain  2^16      */
two@@31= 2**31                                   /*ª* "  "     "     "    "     2^32      */

do seed=0  for 2;       bsd= seed        /*ª*perform for seed=0  and also  seed=1.*/
ms= seed        /*ª*assign  SEED  to  two REXX variables.*/
say center(' seed='seed" ", 79, 'â”€')     /*ª*display the seed in a title/separator*/
/*ª* [â†“]  show 20 rand #'s for each seed.*/
do j=1  for 20                       /*ª*generate & display 20 random numbers.*/

bsd = (1103515245 * bsd   +     12345)   //    two@@31
ms  = (    214013 *  ms   +   2531011)   //    two@@31
/*ª*  â†‘                                  */
/*ª*  â””â”€â”€â”€â”€â”€â—„â”€â”€â”€â”€ REXX remainder operator*/

say '  state'   right(j,3)   " BSD"   right(bsd,     11)   left('', 13),
" MS"    right( ms,     11)   left('',  5),
" rand"  right(ms % two@@16,  6)
end   /*ª*j*/
end       /*ª*seed*/                       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Linear-congruential-generator\linear-congruential-generator.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
