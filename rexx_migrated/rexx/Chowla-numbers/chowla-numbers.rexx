/*�*REXX program computes/displays chowla numbers (and may count primes & perfect numbers.*/
parse arg LO HI .                                /*�*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=  1                 /*�*Not specified?  Then use the default.*/
perf= LO<0;               LO= abs(LO)            /*�*Negative?  Then determine if perfect.*/
if HI=='' | HI==","  then HI= LO                 /*�*Not specified?  Then use the default.*/
prim= HI<0;               HI= abs(HI)            /*�*Negative?  Then determine if a prime.*/
numeric digits max(9, length(HI) + 1 )           /*�*use enough decimal digits for   //   */
w= length( commas(HI) )                          /*�*W:   used in aligning output numbers.*/
tell= \(prim | perf)                             /*�*set boolean value for showing chowlas*/
p= 0                                             /*�*the number of primes found  (so far).*/
do j=LO  to HI;       newV1= chowla(j)          /*�*compute the  cholwa number  for  J.  */
if tell  then say right('chowla('commas(j)")", w+9)    ' = '    right( commas(newV1), w)
else if newV1==0  then if j>1  then p= p+1
if perf  then if j-1==newV1 & j>1  then say right(commas(j), w)   ' is a perfect number.'
end   /*�*j*/

if prim & \perf  then say 'number of primes found for the range '   commas(LO)    " to " ,
commas(HI)        " (inclusive)  is: "   commas(p)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
chowla: procedure; parse arg x;         if x<2  then return 0;          odd= x // 2
s=0                                      /*�* [↓]  use EVEN or ODD integers.   ___*/
do k=2+odd  by 1+odd  while k*k<x    /*�*divide by all the integers up to √ X */
if x//k==0  then  s=s + k + x%k      /*�*add the two divisors to the sum.     */
end   /*�*k*/                          /*�* [↓]  adkust for square.          ___*/
if k*k==x  then  s=s + k                 /*�*Was  X  a square?    If so, add  √ X */
return s                                 /*�*return     "     "    "      "     " */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV2;  do k=length(newV2)-3  to 1  by -3; newV2= insert(',', newV2, k); end;   return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Chowla-numbers\chowla-numbers.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
