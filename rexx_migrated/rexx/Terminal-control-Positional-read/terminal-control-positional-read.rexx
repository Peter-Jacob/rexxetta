/*ª*REXX program demonstrates reading a character from (at) at  specific screen location. */
row = 6                                      /*ª*point to a particular row   on screen*/
col = 3                                      /*ª*  "    " "     "      column "    "  */
howMany = 1                                      /*ª*read this many characters from screen*/

stuff = scrRead(row, col, howMany)               /*ª*this'll do it.                       */

other = scrRead(40, 3, 1)                        /*ª*same thing,  but for row forty.      */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Positional-read\terminal-control-positional-read.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
