/*�*REXX program  tests  if a number  (or a range of numbers)  is/are  perfect.           */
parse arg low high .                             /*�*obtain the optional arguments from CL*/
if high=='' & low==""  then high=34000000        /*�*if no arguments,  then use a range.  */
if  low==''            then  low=1               /*�*if no   LOW,  then assume  unity.    */
low=low+low//2                                   /*�*if LOW is odd,  bump it by  one.     */
if high==''            then high=low             /*�*if no  HIGH,  then assume  LOW.      */
w=length(high)                                   /*�*use   W   for formatting the output. */
numeric digits max(9,w+2)                        /*�*ensure enough digits to handle number*/
newV1.=0;   newV1.1=2                                    /*�*highest magic number  and its index. */

do i=low  to high  by 2              /*�*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)   'is a perfect number.'
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPerfect: procedure expose newV1.;  parse arg x     /*�*obtain the number to be tested.      */
/*�*Lucas-Lehmer know that perfect       */
/*�*    numbers can be expressed as:     */
/*�*    [2**n - 1]  *  [2** (n-1) ]      */

if newV1.0<x then do newV1.1=newV1.1  while newV1.newV2<=x; newV2=(2**newV1.1-1)*2**(newV1.1-1);  newV1.0=newV2;  newV1.newV2=newV2
end   /*�*@.1*/           /*�*uses memoization for the formula.    */

if newV1.x==0  then return 0              /*�*Didn't pass Lucas-Lehmer test?       */
s = 3 + x%2                           /*�*we know the following factors:       */
/*�*  1      ('cause Mama said so.)      */
/*�*  2      ('cause it's even.)         */
/*�* x÷2     (   "     "    "  )      ___*/
do j=3  while  j*j<=x     /*�*starting at 3, find the factors ≤√ X */
if x//j\==0  then iterate /*�*J  divides  X  evenly,  so ···       */
s=s + j + x%j             /*�*···  add it  and  the other factor.  */
end   /*�*j*/               /*�*(above)  is marginally faster.       */
return s==x                           /*�*if the sum matches  X,  it's perfect!*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-6.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
