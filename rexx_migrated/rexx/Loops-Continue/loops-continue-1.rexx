/*ª*REXX program  illustrates  an example of a   DO   loop with an  ITERATE  (continue).  */

do j=1  for 10                                 /*ª*this is equivalent to:  DO J=1 TO 10 */
call charout ,  j                              /*ª*write the integer to the terminal.   */
if j//5\==0  then do                           /*ª*Not a multiple of five?   Then Â·Â·Â·   */
call charout , ", "          /*ª*  write a comma to the terminal, Â·Â·Â· */
iterate                      /*ª* Â·Â·Â· & then go back for next integer.*/
end
say                                            /*ª*force REXX to display on next line.  */
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Continue\loops-continue-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
