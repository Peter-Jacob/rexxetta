/*�*REXX program  calculates and displays all   amicable pairs   up to  a given number.   */
parse arg H .;  if H=='' | H==","  then H= 20000 /*�*get optional arguments  (high limit).*/
w= length(H) ;  low= 220                         /*�*W: used for columnar output alignment*/
newV1.=.                                             /*�* [↑]  LOW is lowest amicable number. */
do k=low  for H-low;     newV2= sigma(k)        /*�*generate sigma sums for a range of #s*/
if newV2>=low  then newV1.k= newV2                      /*�*only keep the pertinent sigma sums.  */
end   /*�*k*/                                 /*�* [↑]   process a range of integers.  */
newV3= 0                                             /*�*number of amicable pairs found so far*/
do   m=low  to  H;       n= newV1.m             /*�*start the search at the lowest number*/
if m==newV1.n  then do                          /*�*If equal, might be an amicable number*/
if m==n  then iterate       /*�*Is this a perfect number?  Then skip.*/
newV3= newV3 + 1                    /*�*bump the  amicable pair  counter.    */
say right(m,w)    ' and '     right(n,w)     " are an amicable pair."
m= n                        /*�*start   M   (DO index)  from  N.     */
end
end    /*�*m*/
say
say newV3    ' amicable pairs found up to '     H    /*�*display count of the amicable pairs. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sigma: procedure; parse arg x;     od= x // 2    /*�*use either  EVEN  or  ODD  integers. */
s= 1                                      /*�*set initial sigma sum to unity.   ___*/
do j=2+od  by 1+od  while  j*j<x  /*�*divide by all integers up to the √ X */
if x//j==0  then  s= s + j + x%j  /*�*add the two divisors to the sum.     */
end   /*�*j*/                       /*�* [↑]  %  is REXX integer division.   */
/*�*                                 ___ */
if j*j==x  then  return s + j             /*�*Was  X  a square?   If so, add  √ X  */
return s                 /*�*return (sigma) sum of the divisors.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Amicable-pairs\amicable-pairs-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
