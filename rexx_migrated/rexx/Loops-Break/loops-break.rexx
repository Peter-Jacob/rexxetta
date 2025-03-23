/*ª*REXX program demonstrates a    FOREVER   DO  loop  with a test to    LEAVE   (break). */
/*ª*REXX's RANDOM BIF returns an integer.*/
do forever                                   /*ª*perform loop until da cows come home.*/
a=random(19)                                 /*ª*same as:    random(0, 19)            */
call charout , right(a, 5)                   /*ª*show   A   rightâ”€justified, column 1.*/
if a==10  then leave                         /*ª*is random #=10?  Then cows came home.*/
b=random(19)                                 /*ª*same as:    random(0, 19)            */
say right(b, 5)                              /*ª*show   B   rightâ”€justified, column 2.*/
end   /*ª*forever*/                            /*ª* [â†‘]  CHAROUT , xxx   writes to term.*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Break\loops-break.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
