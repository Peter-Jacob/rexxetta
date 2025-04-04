/*ͺ*REXX program  generates and displays  a number of  narcissistic (Armstrong)  numbers. */
numeric digits 39                                /*ͺ*be able to handle largest Armstrong #*/
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N=25                     /*ͺ*Not specified?  Then use the default.*/
N=min(N, 89)                                     /*ͺ*there are only  89  narcissistic #s. */
newV1.=0                                             /*ͺ*set default for the @ stemmed array. */
newV5=0                                              /*ͺ*number of narcissistic numbers so far*/
do p=0  for 39+1; if p<10  then call tell p /*ͺ*display the 1st 1βdigit dec. numbers.*/
do i=1  for 9;     newV1.p.i= i**p          /*ͺ*build table of ten digits ^ P power. */
end   /*ͺ*i*/
end       /*ͺ*p*/                             /*ͺ* [β]  table is a fixed (limited) size*/
/*ͺ* [β]  skip the 2βdigit dec. numbers. */
do j=100;              L=length(j)          /*ͺ*get length of the  J  decimal number.*/
parse var  j    newV2  2  newV3  3  m  ''  -1  newV4 /*ͺ*get 1st, 2nd, middle, last dec. digit*/
newV6=newV1.L.newV2  +  newV1.L.newV3  +  newV1.L.newV4              /*ͺ*sum of the J decimal digs^L (so far).*/

do k=3  for L-3  until newV6>j         /*ͺ*perform for other decimal digits in J*/
parse var  m    newV7  +1  m           /*ͺ*get next dec. dig in J, start at 3rd.*/
newV6=newV6 + newV1.L.newV7                        /*ͺ*add dec. digit raised to pow to sum. */
end   /*ͺ*k*/                        /*ͺ* [β]  calculate the rest of the sum. */

if newV6==j  then do;  call tell j              /*ͺ*does the sum equal to  J?  Show the #*/
if newV5==n  then leave      /*ͺ*does the sum equal to  J?  Show the #*/
end
end   /*ͺ*j*/                                 /*ͺ* [β]  the  J loop  list starts at 100*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell: newV5=newV5 + 1                                    /*ͺ*bump the counter for narcissistic #s.*/
say right(newV5,9)   ' narcissistic:'   arg(1) /*ͺ*display index and narcissistic number*/
if newV5==n  &  n<11  then exit                /*ͺ*finished showing of narcissistic #'s?*/
return                                     /*ͺ*return to invoker & keep on truckin'.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Narcissistic-decimal-number\narcissistic-decimal-number-3.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
