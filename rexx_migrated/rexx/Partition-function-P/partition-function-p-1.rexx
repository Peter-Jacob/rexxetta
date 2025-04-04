/*ͺ*REXX program calculates and displays a specific value (or a range of)  partitionsP(N).*/
numeric digits 1000                              /*ͺ*able to handle some ginormous numbers*/
parse arg lo hi .                                /*ͺ*obtain optional arguments from the CL*/
if lo=='' | lo==","  then lo=  0                 /*ͺ*Not specified?  Then use the default.*/
if hi=='' | hi==","  then hi= lo                 /*ͺ* "      "         "   "   "     "    */
newV1.= 0;    newV1.0= 1; newV1.1= 1; newV1.2= 2; newV1.3= 3; newV1.4= 5 /*ͺ*assign default value and low values. */
newV2.= newV1.;   newV2.1= 1; newV2.3= 1; newV2.5= 1; newV2.7= 1; newV2.9= 1 /*ͺ*assign default value and even digits.*/
w= length( commas(hi) )                          /*ͺ*W:  is used for aligning the index.  */

do j=lo  to hi                            /*ͺ*compute a range of  partitionsP.     */
say right( commas(j), w)    ' '     commas( partP(j) )
end   /*ͺ*j*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
partP:  procedure expose newV1. newV2.;  parse arg n     /*ͺ*obtain number (index) for computation*/
if newV1.n\==0  then return newV1.n              /*ͺ*Is it already computed?   Return it. */
newV4= 0                                               /*ͺ*initialize part  P  number.*/
do k=1  for n;  z= n  -  (k*3 - 1) * k % 2  /*ͺ*compute the partition P num*/
if z<0  then leave                          /*ͺ*Is Z negative?  Then leave.*/
if newV1.z==0  then x= partP(z)                 /*ͺ*use recursion if not known.*/
else x= newV1.z                      /*ͺ*use the preβcomputed number*/
z= z - k                                    /*ͺ*subtract index (K) from Z. */
if z<0     then y= 0                        /*ͺ*Is Z negative? Then set Y=0*/
else if newV1.z==0  then y= partP(z) /*ͺ*use recursion if not known.*/
else y= newV1.z      /*ͺ*use the preβcomputed number*/
if k//2    then newV4= newV4 +  x + y               /*ͺ*Odd? Then   sum    X and Y.*/
else newV4= newV4 - (x + y)              /*ͺ*Even?  "  subtract "  "  " */
end   /*ͺ*k*/
newV1.n= newV4;                   return newV4       /*ͺ*define and return partitionsP of  N. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Partition-function-P\partition-function-p-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
