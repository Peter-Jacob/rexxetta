/*�*REXX pgm computes/shows (integers),  D  that aren't possible for: a² + b² + c²  =  d² */
parse arg hi .                                   /*�*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi=2200;  high= 3 * hi /*�*Not specified?  Then use the default.*/
newV1.=.                                             /*�*array of integers to be squared.     */
newV2.=.                                             /*�*  "    "     "    squared.           */
do j=1  for high                          /*�*precompute possible squares (to max).*/
newV3= j*j;   newV2.newV3= j;   if j<=hi  then newV1.j= newV3 /*�*define a square; D  value; squared # */
end   /*�*j*/
d.=.                                             /*�*array of possible solutions  (D)     */
do       a=1  for hi-2;  aodd= a//2       /*�*go hunting for solutions to equation.*/
do    b=a   to hi-1;
if aodd  then  if b//2  then iterate   /*�*Are  A  and  B  both odd?  Then skip.*/
ab = newV1.a + newV1.b                         /*�*calculate sum of  2  (A,B)   squares.*/
do c=b   to hi;     abc= ab  + newV1.c  /*�*    "      "   "  3  (A,B,C)    "    */
if newV2.abc==.  then iterate           /*�*Not a square? Then skip it*/
s=newV2.abc;    d.s=                    /*�*define this D solution as being found*/
end   /*�*c*/
end      /*�*b*/
end         /*�*a*/
say
say 'Not possible positive integers for   d ����ִ' hi "  using equation:  a² + b² + c²  =  d²"
say
newV4=                                               /*�* [↓]  find all the  "not possibles". */
do p=1  for hi;   if d.p==.  then newV4=newV4 p   /*�*Not possible? Then add it to the list*/
end   /*�*p*/                               /*�* [↓]  display list of not-possibles. */
say substr(newV4, 2)                                 /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-quadruples\pythagorean-quadruples-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
