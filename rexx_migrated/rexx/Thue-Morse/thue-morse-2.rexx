/*�*REXX pgm generates & displays the Thue─Morse sequence up to the Nth term (inclusive). */
parse arg N .                                    /*�*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 80                    /*�*Not specified?  Then use the default.*/
newV1=                                               /*�*the Thue─Morse sequence  (so far).   */
do j=0  to N                            /*�*generate sequence up to the Nth item.*/
newV1= newV1 || length( space( translate( x2b( d2x(j) ), , 0), 0)) // 2  /*�*append to $.*/
end   /*�*j*/
say newV1                                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Thue-Morse\thue-morse-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
