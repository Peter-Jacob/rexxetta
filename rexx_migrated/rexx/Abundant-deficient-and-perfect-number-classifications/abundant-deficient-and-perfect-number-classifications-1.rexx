/*ͺ*REXX program counts the number of  abundant/deficient/perfect  numbers within a range.*/
parse arg low high .                             /*ͺ*obtain optional arguments from the CL*/
high=word(high low 20000,1);  low= word(low 1,1) /*ͺ*obtain the   LOW  and  HIGH   values.*/
say center('integers from '   low   " to "   high,  45,  "β")        /*ͺ*display a header.*/
newV1.= 0                                            /*ͺ*define all types of  sums  to zero.  */
do j=low  to high;           newV2= sigma(j)   /*ͺ*get sigma for an integer in a range. */
if newV2<j  then               newV1.d= newV1.d + 1    /*ͺ*Less?      It's a  deficient  number.*/
else if newV2>j  then  newV1.a= newV1.a + 1    /*ͺ*Greater?     "  "  abundant      "   */
else  newV1.p= newV1.p + 1    /*ͺ*Equal?       "  "  perfect       "   */
end  /*ͺ*j*/                                 /*ͺ* [β]  IFs are coded as per likelihood*/

say '   the number of perfect   numbers: '       right(newV1.p, length(high) )
say '   the number of abundant  numbers: '       right(newV1.a, length(high) )
say '   the number of deficient numbers: '       right(newV1.d, length(high) )
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sigma: procedure; parse arg x; if x<2  then return 0;  odd=x // 2    /*ͺ* // βββremainder.*/
s= 1                                      /*ͺ* [β]  only use  EVEN or ODD integers.*/
do k=2+odd  by 1+odd  while k*k<x   /*ͺ*divide by all integers up to  βx.    */
if x//k==0  then  s= s + k +  x % k /*ͺ*add the two divisors to (sigma) sum. */
end   /*ͺ*k*/                         /*ͺ* [β]  %  is the REXX integer division*/
if k*k==x  then  return s + k             /*ͺ*Was  X  a square?   If so, add  β x  */
return s                 /*ͺ*return (sigma) sum of the divisors.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Abundant-deficient-and-perfect-number-classifications\abundant-deficient-and-perfect-number-classifications-1.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
