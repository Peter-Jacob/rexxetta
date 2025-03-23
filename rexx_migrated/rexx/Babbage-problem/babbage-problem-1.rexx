/*ª*REXX program finds the  lowest (positive)  integer  whose  square  ends in  269,696.  */
do j=2  by 2  until right(j * j, 6) == 269696 /*ª*start  J  at two,  increment by two. */
end                                           /*ª*â—„â”€â”€ signifies the end of the DO loop.*/
/*ª* [â†‘]     *     means multiplication. */
say "The smallest integer whose square ends in  269,696  is: "    j
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Babbage-problem\babbage-problem-1.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
