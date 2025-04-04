/*ͺ*REXX pgm generates & displays the ThueβMorse sequence up to the Nth term (inclusive). */
parse arg N .                                    /*ͺ*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 80                    /*ͺ*Not specified?  Then use the default.*/
newV1=                                               /*ͺ*the ThueβMorse sequence  (so far).   */
do j=0  to N                            /*ͺ*generate sequence up to the Nth item.*/
newV1= newV1 || newV1weight(j) // 2                 /*ͺ*append the item to the ThueβMorse seq*/
end   /*ͺ*j*/
say newV1
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV1pop:    return  length( space( translate( arg(1), , 0), 0) )     /*ͺ*count 1's in number.*/
newV1weight: return  newV1pop( x2b( d2x( arg(1) ) ) )                     /*ͺ*decβββΊbin, pop count*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Thue-Morse\thue-morse-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
