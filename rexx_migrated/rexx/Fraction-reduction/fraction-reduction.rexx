/*ͺ*REXX pgm reduces fractions by "crossing out" matching digits in nominator&denominator.*/
parse arg high show .                            /*ͺ*obtain optional arguments from the CL*/
if high=='' | high==","  then high=  4           /*ͺ*Not specified?  Then use the default.*/
if show=='' | show==","  then show= 12           /*ͺ* "      "         "   "   "     "    */
say center(' some samples of reduced fractions by crossing out digits ', 79, "β")
newV3.=0                                             /*ͺ*placeholder array for counts; init. 0*/
do L=2  to high;      say                  /*ͺ*do 2-dig fractions to HIGH-dig fract.*/
lim= 10**L - 1       /*ͺ*calculate the upper limit just once. */
do n=10**(L-1)  to lim                  /*ͺ*generate some  N  digit  fractions.  */
if pos(0, n) \==0  then iterate         /*ͺ*Does  it  have a zero?  Then skip it.*/
if hasDup(n)       then iterate         /*ͺ*  "    "    "  " dup?     "    "   " */

do d=n+1     to lim                           /*ͺ*only process like-sized #'s */
if pos(0, d)\==0         then iterate         /*ͺ*Have a zero? Then skip it.  */
if verify(d, n, 'M')==0  then iterate         /*ͺ*No digs in common?  Skip it.*/
if hasDup(d)             then iterate         /*ͺ*Any digs are dups?    "   " */
q= n/d                                        /*ͺ*compute quotient just once. */
do e=1  for L;     xo= substr(n, e, 1)  /*ͺ*try crossing out each digit.*/
nn= space( translate(n, , xo), 0)       /*ͺ*elide from the numerator.   */
dd= space( translate(d, , xo), 0)       /*ͺ*  "     "   "  denominator. */
if nn/dd \== q  then iterate            /*ͺ*Not the same quotient? Skip.*/
newV3.L=    newV3.L    + 1                      /*ͺ*Eureka!   We found one.     */
newV3.L.xo= newV3.L.xo + 1                      /*ͺ*count the silly reduction.  */
if newV3.L>show  then iterate               /*ͺ*Too many found?  Don't show.*/
say center(n'/'d   " = "   nn'/'dd  "  by crossing out the" xo"'s.", 79)
end   /*ͺ*e*/
end         /*ͺ*d*/
end            /*ͺ*n*/
end               /*ͺ*L*/
say;                  newV1= ' with crossed-out' /*ͺ* [β]  show counts for any reductions.*/
do k=1  for 9                              /*ͺ*traipse through each crossβout digit.*/
if newV3.k==0  then iterate                    /*ͺ*Is this a zero count?  Then skip it. */
say;    say center('There are '     newV3.k     " "k'-digit fractions.', 79, "β")
newV2= '          For ' /*ͺ*literal for SAY indentation (below). */
do newV4=1  for 9;   if newV3.k.newV4==0  then iterate
say newV2    k"-digit fractions, there are "    right(newV3.k.newV4, k-1)   newV1   newV4"'s."
end   /*ͺ*#*/
end      /*ͺ*k*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hasDup: parse arg x;          /*ͺ* if L<2  then return 0 */           /*ͺ*L will never be 1.*/
do i=1  for L-1;      if pos(substr(x,i,1), substr(x,i+1)) \== 0  then return 1
end   /*ͺ*i*/;                                                           return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fraction-reduction\fraction-reduction.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
