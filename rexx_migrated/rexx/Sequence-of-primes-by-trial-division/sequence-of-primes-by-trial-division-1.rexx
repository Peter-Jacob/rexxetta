/*ͺ*REXX program lists a  sequence of primes  by  testing  primality  by  trial division. */
parse arg n .                                    /*ͺ*get optional number of primes to find*/
if n=='' | n==","  then n= 26                    /*ͺ*Not specified?  Then use the default.*/
tell= (n>0);            n= abs(n)                /*ͺ*Is  N  negative?  Then don't display.*/
newV1.1=2;     if tell  then say right(newV1.1, 9)       /*ͺ*display  2  as a special prime case. */
newV3=1                                              /*ͺ*#  is number of primes found (so far)*/
/*ͺ* [β]  N:  default lists up to 101 #s.*/
do j=3  by 2  while  newV3<n                      /*ͺ*start with the first odd prime.      */
/*ͺ* [β]  divide by the primes.   ___    */
do k=2  to newV3  while  newV2.k<=j            /*ͺ*divide  J  with all primes β€ β J     */
if j//newV1.k==0  then iterate j           /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*j*/                            /*ͺ* [β]   only divide up to     β J     */
newV3= newV3+1                                        /*ͺ*bump the count of number of primes.  */
newV1.newV3= j;           newV2.newV3= j*j                    /*ͺ*define this prime; define its square.*/
if tell  then say right(j, 9)                 /*ͺ*maybe display this prime βββΊ terminal*/
end   /*ͺ*j*/                                   /*ͺ* [β]  only display N number of primes*/
/*ͺ* [β]  display number of primes found.*/
say  newV3       ' primes found.'                    /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sequence-of-primes-by-trial-division\sequence-of-primes-by-trial-division-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
