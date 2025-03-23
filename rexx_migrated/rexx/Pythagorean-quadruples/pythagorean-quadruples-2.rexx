/*ª*REXX pgm computes/shows (integers),  D  that aren't possible for: aÂ² + bÂ² + cÂ²  =  dÂ² */
parse arg hi .                                   /*ª*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi=2200                /*ª*Not specified?  Then use the default.*/
high= hi * 3                                     /*ª*D  can be three times the  HI  (max).*/
newV1.= .                                            /*ª*array of integers  (â‰îå÷Ö´ hi)    squared.*/
do s=1  for high;  newV3= s*s;  r.newV3= s;  newV1.s=newV3 /*ª*precompute squares and square roots. */
end  /*ª*s*/
newV2.=                                              /*ª*array of differences between squares.*/
do    c=1   for high;       cc = newV1.c       /*ª*precompute possible differences.     */
do d=c+1  to high;       dif= newV1.d - cc  /*ª*process  D  squared; calc differences*/
newV2.dif= newV2.dif cc                         /*ª*add    CC    to the    !.DIF   list. */
end   /*ª*d*/
end      /*ª*c*/
d.=.                                             /*ª*array of the possible solutions (D). */
do     a=1  for hi-2                       /*ª*go hunting for solutions to equation.*/
do  b=a   to hi-1;        ab= newV1.a + newV1.b /*ª*calculate sum of two  (A,B)  squares.*/
if newV2.ab==''  then iterate               /*ª*Not a difference?   Then ignore it.  */
do n=1  for words(newV2.ab)              /*ª*handle all ints that satisfy equation*/
abc= ab  +  word(newV2.ab, n)            /*ª*add the  CÂ²  integer  to  AÂ²  +  BÂ²  */
newV3= r.abc                             /*ª*retrieve the square root  of  CÂ²     */
d.newV3=                                 /*ª*mark the  D  integer as being found. */
end   /*ª*n*/
end      /*ª*b*/
end         /*ª*a*/
say
say 'Not possible positive integers for   d â‰îå÷Ö´' hi "  using equation:  aÂ² + bÂ² + cÂ²  =  dÂ²"
say
newV4=                                               /*ª* [â†“]  find all the  "not possibles". */
do p=1  for hi;   if d.p==.  then newV4= newV4 p  /*ª*Not possible? Then add it to the list*/
end   /*ª*p*/                               /*ª* [â†“]  display list of not-possibles. */
say substr(newV4, 2)                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-quadruples\pythagorean-quadruples-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
