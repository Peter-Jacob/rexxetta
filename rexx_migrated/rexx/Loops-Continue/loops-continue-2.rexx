/*ª*REXX program  illustrates  an example of a   DO   loop with an  ITERATE  (continue).  */
newV1=                                               /*ª*nullify the variable used for display*/
do j=1  for 10                               /*ª*this is equivalent to:  DO J=1 TO 10 */
newV1=newV1 || j', '                                 /*ª*append the integer to a placeholder. */
if j//5==0  then say left(newV1, length(newV1) - 2)  /*ª*Is  J  a multiple of five?  Then SAY.*/
if j==5     then newV1=                          /*ª*start the display line over again.   */
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Continue\loops-continue-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
