/*�*REXX program lists a  sequence of primes  by  testing  primality  by  trial division. */
parse arg n .                                    /*�*get optional number of primes to find*/
if n=='' | n==","  then n= 26                    /*�*Not specified?  Then use the default.*/
tell= (n>0);            n= abs(n)                /*�*Is  N  negative?  Then don't display.*/
newV1.1=2;     if tell  then say right(newV1.1, 9)       /*�*display  2  as a special prime case. */
newV3=1                                              /*�*#  is number of primes found (so far)*/
/*�* [↑]  N:  default lists up to 101 #s.*/
do j=3  by 2  while  newV3<n                      /*�*start with the first odd prime.      */
/*�* [↓]  divide by the primes.   ___    */
do k=2  to newV3  while  newV2.k<=j            /*�*divide  J  with all primes ≤ √ J     */
if j//newV1.k==0  then iterate j           /*�*÷ by prev. prime?  ¬prime     ___    */
end   /*�*j*/                            /*�* [↑]   only divide up to     √ J     */
newV3= newV3+1                                        /*�*bump the count of number of primes.  */
newV1.newV3= j;           newV2.newV3= j*j                    /*�*define this prime; define its square.*/
if tell  then say right(j, 9)                 /*�*maybe display this prime ──► terminal*/
end   /*�*j*/                                   /*�* [↑]  only display N number of primes*/
/*�* [↓]  display number of primes found.*/
say  newV3       ' primes found.'                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sequence-of-primes-by-trial-division\sequence-of-primes-by-trial-division-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
