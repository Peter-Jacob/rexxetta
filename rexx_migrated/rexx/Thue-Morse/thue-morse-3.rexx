/*�*REXX pgm generates & displays the Thue─Morse sequence up to the Nth term (inclusive). */
parse arg N .                                    /*�*obtain the optional argument from CL.*/
if N=='' | N==","  then N= 6                     /*�*Not specified?  Then use the default.*/
newV1= 0                                             /*�*the Thue─Morse sequence  (so far).   */
do j=1  for N                           /*�*generate sequence up to the Nth item.*/
newV1= newV1 || translate(newV1, 10, 01)            /*�*append $'s  complement to  $  string.*/
end   /*�*j*/
say newV1                                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Thue-Morse\thue-morse-3.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
