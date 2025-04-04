/*ͺ*REXX pgm displays primes found:  starting Z at 42, if Z is a prime, add Z, else add 1.*/
numeric digits 20;              d=digits()       /*ͺ*ensure enough decimal digits for  Z. */
parse arg limit .                                /*ͺ*obtain optional arguments from the CL*/
if limit=='' | limit==","  then limit=42         /*ͺ*Not specified?  Then use the default.*/
n=0                                              /*ͺ*the count of number of primes found. */
do z=42  until n==limit                     /*ͺ* βββthis DO loop's index is modified.*/
if isPrime(z)  then do;  n=n + 1            /*ͺ*Z  a prime?  Them bump prime counter.*/
say right('n='n, 9)     right(commas(z), d)
z=z + z - 1        /*ͺ*also, bump the  DO  loop index  Z.   */
end
end   /*ͺ*z*/                                 /*ͺ* [β] a small tribute to Douglas Adams*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV1;  do j=length(newV1)-3  to 1  by -3; newV1=insert(',', newV1, j); end;   return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: procedure; parse arg newV2;         if wordpos(newV2, '2 3 5 7')\==0  then return 1
if newV2 // 2==0 | newV2 // 3    ==0  then return 0
do j=5  by 6  until j*j>newV2;    if newV2 // j==0 | newV2 // (J+2)==0  then return 0
end   /*ͺ*j*/                           /*ͺ*           ___                       */
return 1                                /*ͺ*Exceeded  β #  ?    Then # is prime. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Increment-loop-index-within-loop-body\loops-increment-loop-index-within-loop-body.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
