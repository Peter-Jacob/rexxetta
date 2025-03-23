/*ª*REXX pgm computes/shows (integers),  D  that aren't possible for: aÂ² + bÂ² + cÂ²  =  dÂ² */
parse arg hi .                                   /*ª*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi=2200;  high= 3 * hi /*ª*Not specified?  Then use the default.*/
newV1.=.                                             /*ª*array of integers to be squared.     */
newV2.=.                                             /*ª*  "    "     "    squared.           */
do j=1  for high                          /*ª*precompute possible squares (to max).*/
newV3= j*j;   newV2.newV3= j;   if j<=hi  then newV1.j= newV3 /*ª*define a square; D  value; squared # */
end   /*ª*j*/
d.=.                                             /*ª*array of possible solutions  (D)     */
do       a=1  for hi-2;  aodd= a//2       /*ª*go hunting for solutions to equation.*/
do    b=a   to hi-1;
if aodd  then  if b//2  then iterate   /*ª*Are  A  and  B  both odd?  Then skip.*/
ab = newV1.a + newV1.b                         /*ª*calculate sum of  2  (A,B)   squares.*/
do c=b   to hi;     abc= ab  + newV1.c  /*ª*    "      "   "  3  (A,B,C)    "    */
if newV2.abc==.  then iterate           /*ª*Not a square? Then skip it*/
s=newV2.abc;    d.s=                    /*ª*define this D solution as being found*/
end   /*ª*c*/
end      /*ª*b*/
end         /*ª*a*/
say
say 'Not possible positive integers for   d â‰îå÷Ö´' hi "  using equation:  aÂ² + bÂ² + cÂ²  =  dÂ²"
say
newV4=                                               /*ª* [â†“]  find all the  "not possibles". */
do p=1  for hi;   if d.p==.  then newV4=newV4 p   /*ª*Not possible? Then add it to the list*/
end   /*ª*p*/                               /*ª* [â†“]  display list of not-possibles. */
say substr(newV4, 2)                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-quadruples\pythagorean-quadruples-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
