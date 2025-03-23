/*ª*REXX program  generates and displays  a number of  narcissistic (Armstrong)  numbers. */
numeric digits 39                                /*ª*be able to handle largest Armstrong #*/
parse arg N .                                    /*ª*obtain optional argument from the CL.*/
if N=='' | N==","  then N=25                     /*ª*Not specified?  Then use the default.*/
N=min(N, 89)                                     /*ª*there are only  89  narcissistic #s. */

do     p=1  for 39                          /*ª*generate tables:   digits ^ P power. */
do i=0  for 10;      newV1.p.i= i**p        /*ª*build table of ten digits ^ P power. */
end   /*ª*i*/
end       /*ª*w*/                             /*ª* [â†‘]  table is a fixed (limited) size*/
newV2=0                                              /*ª*number of narcissistic numbers so far*/
do j=0  until newV2==N;      L=length(j)        /*ª*get length of the  J  decimal number.*/
newV3=left(j, 1)                                /*ª*select the first decimal digit to sum*/
newV4=newV1.L.newV3                                     /*ª*sum of the J dec. digits ^ L (so far)*/
do k=2  for L-1  until newV4>j        /*ª*perform for each decimal digit in  J.*/
newV3=substr(j, k, 1)                 /*ª*select the next decimal digit to sum.*/
newV4=newV4 + newV1.L.newV3                       /*ª*add dec. digit raised to power to sum*/
end   /*ª*k*/                       /*ª* [â†‘]  calculate the rest of the sum. */

if newV4\==j  then iterate                      /*ª*does the sum equal to J?  No, skip it*/
newV2=newV2 + 1                                     /*ª*bump count of narcissistic numbers.  */
say right(newV2, 9)     ' narcissistic:'     j  /*ª*display index and narcissistic number*/
end   /*ª*j*/                                 /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Narcissistic-decimal-number\narcissistic-decimal-number-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
