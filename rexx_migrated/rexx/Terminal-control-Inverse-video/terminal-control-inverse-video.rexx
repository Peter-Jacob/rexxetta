/*�*REXX program demonstrates the showing of  reverse  video  to the display terminal.    */
newV2   = 'day'
newV1 = 'night'

call scrwrite , 1, newV2, , , 7                   /*�*display to terminal:  white on black.*/
call scrwrite , 1+length(newV2), newV1, , , 112  /*�*   "     "     "      black  " white.*/

exit 0                                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Inverse-video\terminal-control-inverse-video.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
