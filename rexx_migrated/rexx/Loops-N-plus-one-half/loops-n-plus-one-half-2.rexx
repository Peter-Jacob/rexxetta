/*ª*REXX program displays:                 1,2,3,4,5,6,7,8,9,10                           */

do j=1  for 10                              /*ª*using   FOR   is faster than    TO.  */
call charout ,j || left(',',j<10)           /*ª*display  J, maybe append a comma (,).*/
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-N-plus-one-half\loops-n-plus-one-half-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
