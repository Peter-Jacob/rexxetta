/*ͺ*REXX program  generates and displays  a number of  narcissistic (Armstrong)  numbers. */
numeric digits 39                                /*ͺ*be able to handle largest Armstrong #*/
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N=25                     /*ͺ*Not specified?  Then use the default.*/
N=min(N, 89)                                     /*ͺ*there are only  89  narcissistic #s. */
newV1.=0                                             /*ͺ*set default for the @ stemmed array. */
newV2=0                                              /*ͺ*number of narcissistic numbers so far*/
do p=0  for 39+1; if p<10  then call tell p /*ͺ*display the 1st 1βdigit dec. numbers.*/
do i=1  for 9;      newV1.p.i= i**p         /*ͺ*build table of ten digits ^ P power. */
zzj= '00'j;       newV1.p.zzj= newV1.p.j        /*ͺ*assign value for a 3-dig number (LZ),*/
end   /*ͺ*i*/

do j=10  to 99;   parse var j  t 2 u    /*ͺ*obtain 2 decimal digits of J:    T U */
newV1.p.j = newV1.p.t + newV1.p.u                   /*ͺ*assign value for a 2βdig number.     */
zj=  '0'j;        newV1.p.zj = newV1.p.j        /*ͺ*   "     "    "  " 3βdig    "   (LZ),*/
end   /*ͺ*j*/                             /*ͺ* [β]  Tβ‘ tens digit;  Uβ‘ units digit.*/

do k=100  to 999; parse var k h 2 t 3 u /*ͺ*obtain 3 decimal digits of J:  H T U */
newV1.p.k= newV1.p.h + newV1.p.t + newV1.p.u            /*ͺ*assign value for a three-digit number*/
end   /*ͺ*k*/                             /*ͺ* [β]  Hβ‘ hundreds digit;  Tβ‘ tens Β·Β·Β·*/
end       /*ͺ*p*/                             /*ͺ* [β]  table is a fixed (limited) size*/
/*ͺ* [β]  skip the 2βdigit dec. numbers. */
do j=100;               L=length(j)         /*ͺ*get length of the  J  decimal number.*/
parse var  j  newV3  +3  m                      /*ͺ*get 1st three decimal digits of  J.  */
newV4=newV1.L.newV3                                     /*ͺ*sum of the J decimal digs^L (so far).*/
do  while m\==''                 /*ͺ*do the rest of the dec. digs in  J.  */
parse var  m    newV3  +3  m         /*ͺ*get the next 3 decimal digits in  M. */
newV4=newV4 + newV1.L.newV3                      /*ͺ*add dec. digit raised to pow to sum. */
end   /*ͺ*while*/                  /*ͺ* [β]  calculate the rest of the sum. */

if newV4==j  then do;  call tell j              /*ͺ*does the sum equal to  J?  Show the #*/
if newV2==n  then leave      /*ͺ*does the sum equal to  J?  Show the #*/
end
end   /*ͺ*j*/                                 /*ͺ* [β]  the  J loop  list starts at 100*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell: newV2=newV2 + 1                                    /*ͺ*bump the counter for narcissistic #s.*/
say right(newV2,9)   ' narcissistic:'   arg(1) /*ͺ*display index and narcissistic number*/
if newV2==n  &  n<11  then exit                /*ͺ*finished showing of narcissistic #'s?*/
return                                     /*ͺ*return to invoker & keep on truckin'.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Narcissistic-decimal-number\narcissistic-decimal-number-4.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
