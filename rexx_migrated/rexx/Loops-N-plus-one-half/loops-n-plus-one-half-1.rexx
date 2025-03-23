/*ª*REXX program displays:                 1,2,3,4,5,6,7,8,9,10                           */

do j=1  to 10
call charout ,j                             /*ª*write the  DO loop  index  (no LF).  */
if j<10  then call charout ,","             /*ª*append a comma for one-digit numbers.*/
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-N-plus-one-half\loops-n-plus-one-half-1.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
