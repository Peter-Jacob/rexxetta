/*�*REXX program  allocates/populates/displays  a two-dimensional array.  */
call bloat                   /*�*the BLOAT procedure does all allocations.*/
/*�*no more array named   @   at this point. */
exit                         /*�*stick a fork in it, we're all done honey.*/
/*�*─────────────────────────BLOAT subroutine─────────────────────────────*/
bloat: procedure;  say       /*�*"PROCEDURE"  makes this a ··· procedure. */
say 'Enter two positive integers (a 2-dimensional array will be created).'
pull n m .                   /*�*elements are allocated as they're defined*/
/*�*N and M should be verified at this point.*/
newV1.=' · '                     /*�*Initial value for all  @  array elements,*/
/*�*this ensures  every  element has a value.*/
do j    =1  for n          /*�*traipse through the first  dimension  [N]*/
do k=1  for m          /*�*   "       "     "  second     "      [M]*/
if random()//7==0  then newV1.j.k=j'~'k    /*�*populate every 7th random*/
end  /*�*k*/
end        /*�*j*/
/*�* [↓]  display array to console:  row,col */
do r=1  for n;    newV2=       /*�*construct one row (or line) at a time.   */
do c=1  for m          /*�*construct row one column at a time.      */
newV2=newV2 right(newV1.r.c,4)     /*�*append a nice-aligned column to the line.*/
end   /*�*kk*/           /*�* [↑]   an nicely aligned line is built.  */
say newV2                      /*�*display one row at a time to the terminal*/
end         /*�*jj*/
/*�*╔════════════════════════════════════════════════════════════════════╗
║ When the  RETURN  is executed (from a PROCEDURE in this case), and ║
║ array   @  is "de─allocated", that is, it's no longer defined, and ║
║ the array's storage is now free for other REXX variables.   If the ║
║ BLOAT   subroutine didn't have a   "PROCEDURE"   on that statement,║
║ the array    @    would've been left intact.    The same effect is ║
║ performed by a   DROP   statement   (an example is shown below).   ║
╚════════════════════════════════════════════════════════════════════╝*/
drop newV1.                      /*�*because of the  PROCEDURE  statement, the*/
return                       /*�* [↑]    DROP   statement is superfluous. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Create-a-two-dimensional-array-at-runtime\create-a-two-dimensional-array-at-runtime.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
