/*ª*REXX pgm generates & displays the Thueâ”€Morse sequence up to the Nth term (inclusive). */
parse arg N .                                    /*ª*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 80                    /*ª*Not specified?  Then use the default.*/
newV1=                                               /*ª*the Thueâ”€Morse sequence  (so far).   */
do j=0  to N                            /*ª*generate sequence up to the Nth item.*/
newV1= newV1 || length( space( translate( x2b( d2x(j) ), , 0), 0)) // 2  /*ª*append to $.*/
end   /*ª*j*/
say newV1                                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Thue-Morse\thue-morse-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
