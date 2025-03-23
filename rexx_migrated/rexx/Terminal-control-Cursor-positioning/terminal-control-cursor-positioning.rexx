/*ª*REXX program demonstrates moving the cursor position and writing of text to same place*/

call cursor  3,6                                 /*ª*move the cursor to  row 3, column 6. */
say 'Hello'                                      /*ª*write the text at that location.     */



call scrwrite 30,50,'Hello.'                     /*ª*another method,  different location. */

call scrwrite 40,60,'Hello.',,,14                /*ª*another method  ...  in yellow.      */
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Cursor-positioning\terminal-control-cursor-positioning.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
