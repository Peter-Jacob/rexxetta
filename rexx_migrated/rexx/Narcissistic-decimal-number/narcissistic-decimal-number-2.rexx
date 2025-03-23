/*�*REXX program  generates and displays  a number of  narcissistic (Armstrong)  numbers. */
numeric digits 39                                /*�*be able to handle largest Armstrong #*/
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N=25                     /*�*Not specified?  Then use the default.*/
N=min(N, 89)                                     /*�*there are only  89  narcissistic #s. */

do     p=1  for 39                          /*�*generate tables:   digits ^ P power. */
do i=0  for 10;      newV1.p.i= i**p        /*�*build table of ten digits ^ P power. */
end   /*�*i*/
end       /*�*w*/                             /*�* [↑]  table is a fixed (limited) size*/
newV2=0                                              /*�*number of narcissistic numbers so far*/
do j=0  until newV2==N;      L=length(j)        /*�*get length of the  J  decimal number.*/
newV3=left(j, 1)                                /*�*select the first decimal digit to sum*/
newV4=newV1.L.newV3                                     /*�*sum of the J dec. digits ^ L (so far)*/
do k=2  for L-1  until newV4>j        /*�*perform for each decimal digit in  J.*/
newV3=substr(j, k, 1)                 /*�*select the next decimal digit to sum.*/
newV4=newV4 + newV1.L.newV3                       /*�*add dec. digit raised to power to sum*/
end   /*�*k*/                       /*�* [↑]  calculate the rest of the sum. */

if newV4\==j  then iterate                      /*�*does the sum equal to J?  No, skip it*/
newV2=newV2 + 1                                     /*�*bump count of narcissistic numbers.  */
say right(newV2, 9)     ' narcissistic:'     j  /*�*display index and narcissistic number*/
end   /*�*j*/                                 /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Narcissistic-decimal-number\narcissistic-decimal-number-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
