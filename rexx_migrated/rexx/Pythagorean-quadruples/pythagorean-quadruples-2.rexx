/*�*REXX pgm computes/shows (integers),  D  that aren't possible for: a² + b² + c²  =  d² */
parse arg hi .                                   /*�*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi=2200                /*�*Not specified?  Then use the default.*/
high= hi * 3                                     /*�*D  can be three times the  HI  (max).*/
newV1.= .                                            /*�*array of integers  (����ִ hi)    squared.*/
do s=1  for high;  newV3= s*s;  r.newV3= s;  newV1.s=newV3 /*�*precompute squares and square roots. */
end  /*�*s*/
newV2.=                                              /*�*array of differences between squares.*/
do    c=1   for high;       cc = newV1.c       /*�*precompute possible differences.     */
do d=c+1  to high;       dif= newV1.d - cc  /*�*process  D  squared; calc differences*/
newV2.dif= newV2.dif cc                         /*�*add    CC    to the    !.DIF   list. */
end   /*�*d*/
end      /*�*c*/
d.=.                                             /*�*array of the possible solutions (D). */
do     a=1  for hi-2                       /*�*go hunting for solutions to equation.*/
do  b=a   to hi-1;        ab= newV1.a + newV1.b /*�*calculate sum of two  (A,B)  squares.*/
if newV2.ab==''  then iterate               /*�*Not a difference?   Then ignore it.  */
do n=1  for words(newV2.ab)              /*�*handle all ints that satisfy equation*/
abc= ab  +  word(newV2.ab, n)            /*�*add the  C²  integer  to  A²  +  B²  */
newV3= r.abc                             /*�*retrieve the square root  of  C²     */
d.newV3=                                 /*�*mark the  D  integer as being found. */
end   /*�*n*/
end      /*�*b*/
end         /*�*a*/
say
say 'Not possible positive integers for   d ����ִ' hi "  using equation:  a² + b² + c²  =  d²"
say
newV4=                                               /*�* [↓]  find all the  "not possibles". */
do p=1  for hi;   if d.p==.  then newV4= newV4 p  /*�*Not possible? Then add it to the list*/
end   /*�*p*/                               /*�* [↓]  display list of not-possibles. */
say substr(newV4, 2)                                 /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-quadruples\pythagorean-quadruples-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
