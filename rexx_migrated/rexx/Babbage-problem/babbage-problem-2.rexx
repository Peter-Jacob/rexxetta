/*�*REXX program finds the  lowest (positive)  integer  whose  square  ends in  269,696.  */
do j=2  by 2                                  /*�*start  J  at two,  increment by two. */
if ((j * j) // 1000000) == 269696  then leave /*�*is square mod one million our target?*/
end                                           /*�*◄── signifies the end of the DO loop.*/
/*�* [↑]    //     is division remainder.*/
say "The smallest integer whose square ends in  269,696  is: "    j
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Babbage-problem\babbage-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
