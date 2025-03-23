/*�*REXX program calculates and demonstrates  arbitrary precision numbers (using powers). */
numeric digits 200000                            /*�*two hundred thousand decimal digits. */

newV1 = 5 ** (4 ** (3 ** 2) )                    /*�*calculate multiple exponentiations.  */

true=62060698786608744707...92256259918212890625 /*�*what answer is supposed to look like.*/
rexx= left(newV1, 20)'...'right(newV1, 20)               /*�*the left and right 20 decimal digits.*/

say  '  true:'    true                           /*�*show what the  "true"  answer is.    */
say  '  REXX:'    rexx                           /*�*  "    "   "    REXX      "    "     */
say  'digits:'    length(newV1)                      /*�*  "    "   "   length  of answer is. */
say
if true == rexx   then say 'passed!'             /*�*either it passed,  ···               */
else say 'failed!'             /*�*    or it didn't.                    */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arbitrary-precision-integers-included-\arbitrary-precision-integers-included--1.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
