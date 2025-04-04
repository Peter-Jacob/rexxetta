/*ͺ*REXX program  allocates/populates/displays  a two-dimensional array.  */
call bloat                   /*ͺ*the BLOAT procedure does all allocations.*/
/*ͺ*no more array named   @   at this point. */
exit                         /*ͺ*stick a fork in it, we're all done honey.*/
/*ͺ*βββββββββββββββββββββββββBLOAT subroutineβββββββββββββββββββββββββββββ*/
bloat: procedure;  say       /*ͺ*"PROCEDURE"  makes this a Β·Β·Β· procedure. */
say 'Enter two positive integers (a 2-dimensional array will be created).'
pull n m .                   /*ͺ*elements are allocated as they're defined*/
/*ͺ*N and M should be verified at this point.*/
newV1.=' Β· '                     /*ͺ*Initial value for all  @  array elements,*/
/*ͺ*this ensures  every  element has a value.*/
do j    =1  for n          /*ͺ*traipse through the first  dimension  [N]*/
do k=1  for m          /*ͺ*   "       "     "  second     "      [M]*/
if random()//7==0  then newV1.j.k=j'~'k    /*ͺ*populate every 7th random*/
end  /*ͺ*k*/
end        /*ͺ*j*/
/*ͺ* [β]  display array to console:  row,col */
do r=1  for n;    newV2=       /*ͺ*construct one row (or line) at a time.   */
do c=1  for m          /*ͺ*construct row one column at a time.      */
newV2=newV2 right(newV1.r.c,4)     /*ͺ*append a nice-aligned column to the line.*/
end   /*ͺ*kk*/           /*ͺ* [β]   an nicely aligned line is built.  */
say newV2                      /*ͺ*display one row at a time to the terminal*/
end         /*ͺ*jj*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β When the  RETURN  is executed (from a PROCEDURE in this case), and β
β array   @  is "deβallocated", that is, it's no longer defined, and β
β the array's storage is now free for other REXX variables.   If the β
β BLOAT   subroutine didn't have a   "PROCEDURE"   on that statement,β
β the array    @    would've been left intact.    The same effect is β
β performed by a   DROP   statement   (an example is shown below).   β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drop newV1.                      /*ͺ*because of the  PROCEDURE  statement, the*/
return                       /*ͺ* [β]    DROP   statement is superfluous. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Create-a-two-dimensional-array-at-runtime\create-a-two-dimensional-array-at-runtime.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
