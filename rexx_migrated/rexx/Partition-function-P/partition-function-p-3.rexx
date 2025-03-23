/*�*REXX program calculates and displays a specific value (or a range of)  partitionsP(N).*/
numeric digits 1000                              /*�*able to handle some ginormous numbers*/
parse arg lo hi .                                /*�*obtain optional arguments from the CL*/
if lo=='' | lo==","  then lo=  0                 /*�*Not specified?  Then use the default.*/
if hi=='' | hi==","  then hi= lo                 /*�* "      "         "   "   "     "    */
newV1.= 0;   newV1.0= 1; newV1.1= 1; newV1.2= 2; newV1.3= 3; newV1.4= 5  /*�*default values for some low numbers. */
newV2.= newV1.;  newV2.1= 1; newV2.3= 1; newV2.5= 1; newV2.7= 1; newV2.9= 1  /*�*   "       "    "  all the 1─digit #s*/
w= length( commas(hi) )                          /*�*W:  is used for aligning the index.  */
do i=1  for hi;  a.i= (i+i+i - 1) * i % 2 /*�*calculate HI expressions (for partP).*/
end   /*�*i*/

do j=lo  to hi                            /*�*compute a range of  partitionsP.     */
say right( commas(j), w)    ' '     commas( partP(j) )
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
partP:  procedure expose newV1. newV2. a.;  parse arg n  /*�*obtain number (index) for computation*/
if newV1.n\==0  then return newV1.n              /*�*Is it already computed?   Return it. */
newV4= 0                                               /*�*initialize part  P  number.*/
do k=1  for n;  z= n - a.k                  /*�*compute the partition P num*/
if z<0  then leave                          /*�*Is Z negative?  Then leave.*/
if newV1.z==0  then x= partP(z)                 /*�*use recursion if not known.*/
else x= newV1.z                      /*�*use the pre─computed number*/
z= z - k                                    /*�*subtract index (K) from Z. */
if z<0     then y= 0                        /*�*Is Z negative? Then set Y=0*/
else if newV1.z==0  then y= partP(z) /*�*use recursion if not known.*/
else y= newV1.z      /*�*use the pre─computed number*/
parse var   k   ''  -1  newV5                   /*�*obtain K's last decimal dig*/
if newV2.newV5     then newV4= newV4 +  x + y               /*�*Odd? Then   sum    X and Y.*/
else newV4= newV4 - (x + y)              /*�*Even?  "  subtract "  "  " */
end   /*�*k*/
newV1.n= newV4;                   return newV4       /*�*define and return partitionsP of  N. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Partition-function-P\partition-function-p-3.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
