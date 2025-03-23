/*�*REXX program  calculates and displays all  amicable pairs  up to  a given number.     */
parse arg H .;   if H=='' | H==","  then H=20000 /*�*get optional arguments  (high limit).*/
w=length(H)  ;   low=220                         /*�*W: used for columnar output alignment*/
x= 220 34765731 6232 87633 284 12285 10856 36939357 6368 5684679          /*�*S  minimums.*/
do i=0 for 10;   newV1.i= word(x, i + 1);   end   /*�*minimum amicable #s for last dec dig.*/
newV2.=                                              /*�* [↑]  LOW is lowest amicable number. */
newV3= 0                                             /*�*number of amicable pairs found so far*/
do k=low  for H-low                         /*�*generate sigma sums for a range of #s*/
parse var k  ''  -1  D                      /*�*obtain last decimal digit of   K.    */
if k<newV1.D    then iterate                    /*�*if no need to compute, then skip it. */
newV4= sigma(k)                            /*�*generate sigma sum for the number  K.*/
newV2.k= newV4                                      /*�*only keep the pertinent sigma sums.  */
if k==newV2.newV4  then do                          /*�*is it a possible amicable number ?   */
if newV4==k  then iterate       /*�*Is it a perfect number?  Then skip it*/
newV3= newV3 + 1                    /*�*bump the amicable pair counter.      */
say right(newV4, w)    ' and '     right(k, w)   " are an amicable pair."
end
end   /*�*k*/                                 /*�* [↑]   process a range of integers.  */
say
say newV3   'amicable pairs found up to'    H        /*�*display the count of amicable pairs. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sigma: procedure; parse arg x;   od= x // 2      /*�*use either  EVEN  or  ODD  integers. */
s= 1                                      /*�*set initial sigma sum to unity.   ___*/
do j=2+od  by 1+od  while  j*j<x    /*�*divide by all integers up to the √ x */
if x//j==0  then  s= s + j + x%j    /*�*add the two divisors to the sum.     */
end   /*�*j*/                         /*�* [↑]  %  is REXX integer division.   */
/*�*                                 ___ */
if j*j==x  then  return s + j             /*�*Was  X  a square?   If so, add  √ X  */
return s                 /*�*return (sigma) sum of the divisors.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Amicable-pairs\amicable-pairs-3.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
