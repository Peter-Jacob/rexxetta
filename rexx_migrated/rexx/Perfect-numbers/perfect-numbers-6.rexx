/*ช*REXX program  tests  if a number  (or a range of numbers)  is/are  perfect.           */
parse arg low high .                             /*ช*obtain the optional arguments from CL*/
if high=='' & low==""  then high=34000000        /*ช*if no arguments,  then use a range.  */
if  low==''            then  low=1               /*ช*if no   LOW,  then assume  unity.    */
low=low+low//2                                   /*ช*if LOW is odd,  bump it by  one.     */
if high==''            then high=low             /*ช*if no  HIGH,  then assume  LOW.      */
w=length(high)                                   /*ช*use   W   for formatting the output. */
numeric digits max(9,w+2)                        /*ช*ensure enough digits to handle number*/
newV1.=0;   newV1.1=2                                    /*ช*highest magic number  and its index. */

do i=low  to high  by 2              /*ช*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)   'is a perfect number.'
end   /*ช*i*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPerfect: procedure expose newV1.;  parse arg x     /*ช*obtain the number to be tested.      */
/*ช*Lucas-Lehmer know that perfect       */
/*ช*    numbers can be expressed as:     */
/*ช*    [2**n - 1]  *  [2** (n-1) ]      */

if newV1.0<x then do newV1.1=newV1.1  while newV1.newV2<=x; newV2=(2**newV1.1-1)*2**(newV1.1-1);  newV1.0=newV2;  newV1.newV2=newV2
end   /*ช*@.1*/           /*ช*uses memoization for the formula.    */

if newV1.x==0  then return 0              /*ช*Didn't pass Lucas-Lehmer test?       */
s = 3 + x%2                           /*ช*we know the following factors:       */
/*ช*  1      ('cause Mama said so.)      */
/*ช*  2      ('cause it's even.)         */
/*ช* xรท2     (   "     "    "  )      ___*/
do j=3  while  j*j<=x     /*ช*starting at 3, find the factors โคโ X */
if x//j\==0  then iterate /*ช*J  divides  X  evenly,  so ยทยทยท       */
s=s + j + x%j             /*ช*ยทยทยท  add it  and  the other factor.  */
end   /*ช*j*/               /*ช*(above)  is marginally faster.       */
return s==x                           /*ช*if the sum matches  X,  it's perfect!*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-6.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
