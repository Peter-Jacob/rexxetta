/*ª*REXX program  generates and displays  a number of  narcissistic (Armstrong)  numbers. */
numeric digits 39                                /*ª*be able to handle largest Armstrong #*/
parse arg N .                                    /*ª*obtain optional argument from the CL.*/
if N=='' | N==","  then N=25                     /*ª*Not specified?  Then use the default.*/
N=min(N, 89)                                     /*ª*there are only  89  narcissistic #s. */
newV1=0                                              /*ª*number of narcissistic numbers so far*/
do j=0  until newV1==N;     L=length(j)         /*ª*get length of the  J  decimal number.*/
newV2=left(j, 1) **L                            /*ª*1st digit in  J  raised to the L pow.*/

do k=2  for L-1  until newV2>j        /*ª*perform for each decimal digit in  J.*/
newV2=newV2 + substr(j, k, 1) ** L        /*ª*add digit raised to power to the sum.*/
end   /*ª*k*/                       /*ª* [â†‘]  calculate the rest of the sum. */

if newV2\==j  then iterate                      /*ª*does the sum equal to J?  No, skip it*/
newV1=newV1 + 1                                     /*ª*bump count of narcissistic numbers.  */
say right(newV1, 9)     ' narcissistic:'     j  /*ª*display index and narcissistic number*/
end   /*ª*j*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Narcissistic-decimal-number\narcissistic-decimal-number-1.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
