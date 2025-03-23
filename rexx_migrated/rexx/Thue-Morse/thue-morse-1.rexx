/*�*REXX pgm generates & displays the Thue─Morse sequence up to the Nth term (inclusive). */
parse arg N .                                    /*�*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 80                    /*�*Not specified?  Then use the default.*/
newV1=                                               /*�*the Thue─Morse sequence  (so far).   */
do j=0  to N                            /*�*generate sequence up to the Nth item.*/
newV1= newV1 || newV1weight(j) // 2                 /*�*append the item to the Thue─Morse seq*/
end   /*�*j*/
say newV1
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV1pop:    return  length( space( translate( arg(1), , 0), 0) )     /*�*count 1's in number.*/
newV1weight: return  newV1pop( x2b( d2x( arg(1) ) ) )                     /*�*dec──►bin, pop count*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Thue-Morse\thue-morse-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
