/*ª*REXX program  solves  a  riddle of 5 sailors, a pile of coconuts, and a monkey.       */

do n=2  to 9                                   /*ª*traipse through number of sailors.   */
do newV1=0;                   nuts= newV1           /*ª*perform while not valid # coconuts.  */
do k=n  by -1  for n                     /*ª*step through the possibilities.      */
if nuts//n\==1  then iterate newV1           /*ª*Not one coconut left?    No solution.*/
nuts= nuts    -  (1  +  nuts % n)        /*ª*subtract number of coconuts from pile*/
end   /*ª*k*/
if (nuts\==0) & \(nuts//n\==0)  then leave /*ª*is this a solution to the riddle ?   */
end     /*ª*$*/
say 'sailors='n         "  coconuts="newV1         /*ª*display number of sailors & coconuts.*/
end         /*ª*n*/                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sailors-coconuts-and-a-monkey-problem\sailors-coconuts-and-a-monkey-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
