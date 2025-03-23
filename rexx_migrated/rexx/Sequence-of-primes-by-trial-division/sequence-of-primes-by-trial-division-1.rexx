/*ª*REXX program lists a  sequence of primes  by  testing  primality  by  trial division. */
parse arg n .                                    /*ª*get optional number of primes to find*/
if n=='' | n==","  then n= 26                    /*ª*Not specified?  Then use the default.*/
tell= (n>0);            n= abs(n)                /*ª*Is  N  negative?  Then don't display.*/
newV1.1=2;     if tell  then say right(newV1.1, 9)       /*ª*display  2  as a special prime case. */
newV3=1                                              /*ª*#  is number of primes found (so far)*/
/*ª* [â†‘]  N:  default lists up to 101 #s.*/
do j=3  by 2  while  newV3<n                      /*ª*start with the first odd prime.      */
/*ª* [â†“]  divide by the primes.   ___    */
do k=2  to newV3  while  newV2.k<=j            /*ª*divide  J  with all primes â‰¤ âˆš J     */
if j//newV1.k==0  then iterate j           /*ª*Ã· by prev. prime?  Â¬prime     ___    */
end   /*ª*j*/                            /*ª* [â†‘]   only divide up to     âˆš J     */
newV3= newV3+1                                        /*ª*bump the count of number of primes.  */
newV1.newV3= j;           newV2.newV3= j*j                    /*ª*define this prime; define its square.*/
if tell  then say right(j, 9)                 /*ª*maybe display this prime â”€â”€â–º terminal*/
end   /*ª*j*/                                   /*ª* [â†‘]  only display N number of primes*/
/*ª* [â†“]  display number of primes found.*/
say  newV3       ' primes found.'                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sequence-of-primes-by-trial-division\sequence-of-primes-by-trial-division-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
