/*ª*REXX program lists a  sequence of primes  by testing  primality  by  trial division.  */
parse arg N .                                    /*ª*get optional number of primes to find*/
if N=='' | N==","  then N= 26                    /*ª*Not specified?   Then assume default.*/
tell= (N>0);            N= abs(N)                /*ª*N is negative?   Then don't display. */
newV1.1=2;   newV1.2=3;   newV1.3=5;   newV1.4=7;   newV1.5=11;   newV1.6=13;        newV3= 5;         s= newV1.newV3 + 2
/*ª*    [â†‘]  is the number of low primes.*/
do p=1  for newV3   while  p<=N                /*ª* [â†“]  find primes, and maybe show 'em*/
if tell  then say right(newV1.p, 9)            /*ª*display some preâ”€defined low primes. */
newV2.p= newV1.p**2                                /*ª*also compute the squared value of P. */
end   /*ª*p*/                                /*ª* [â†‘]  allows faster loop (below).    */
/*ª* [â†“]  N:  default lists up to 101 #s.*/
do j=s  by 2  while  newV3<N                      /*ª*continue on with the next odd prime. */
parse var  j    ''  -1  newV4                     /*ª*obtain the last digit of the  J  var.*/
if newV4      ==5  then iterate                   /*ª*is this integer a multiple of five?  */
if j // 3 ==0  then iterate                   /*ª* "   "     "    "     "     " three? */
if j // 7 ==0  then iterate                   /*ª* "   "     "    "     "     " seven? */
if j //11 ==0  then iterate                   /*ª* "   "     "    "     "     " eleven?*/
/*ª* [â†“]  divide by the primes.   ___    */
do k=p  to newV3  while  newV2.k<=j            /*ª*divide  J  by other primes â‰¤ âˆš J     */
if j//newV1.k ==0   then iterate j         /*ª*Ã· by prev. prime?  Â¬prime     ___    */
end   /*ª*k*/                            /*ª* [â†‘]   only divide up to     âˆš J     */
newV3= newV3+1                                        /*ª*bump the count of number of primes.  */
newV1.newV3= j;           newV2.newV3= j*j                    /*ª*define this prime; define its square.*/
if tell  then say right(j, 9)                 /*ª*maybe display this prime â”€â”€â–º terminal*/
end   /*ª*j*/                                   /*ª* [â†‘]  only display N number of primes*/
/*ª* [â†“]  display number of primes found.*/
say  newV3       ' primes found.'                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sequence-of-primes-by-trial-division\sequence-of-primes-by-trial-division-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
