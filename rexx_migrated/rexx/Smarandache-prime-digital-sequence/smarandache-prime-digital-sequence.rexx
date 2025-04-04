/*ͺ*REXX program lists a  sequence of  SPDS  (Smarandache prime-digital sequence)  primes.*/
parse arg n q                                    /*ͺ*get optional number of primes to find*/
if n=='' | n==","  then n=  25                   /*ͺ*Not specified?  Then use the default.*/
if q=''            then q= 100  1000             /*ͺ* "      "         "   "   "     "    */
say 'βββlisting the first'     n     "SPDS primesβββ"
call spds n
do i=1  for words(q)+1;     y=word(q, i);    if y=='' | y==","   then iterate
say
say 'βββlisting the last of '    y     "SPDS primesβββ"
call spds -y
end   /*ͺ*i*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
spds: parse arg x 1 ox;  x= abs(x)               /*ͺ*obtain the limit to be used for list.*/
c= 0                                       /*ͺ*C  number of SPDS primes found so far*/
newV2= 0                                       /*ͺ*#  number of      primes found so far*/
do j=1  by 2  while  c<x;    z= j    /*ͺ*start: 1st even prime, then use odd. */
if z==1  then z= 2                   /*ͺ*handle the even prime (special case) */
/*ͺ* [β]  divide by the primes.   ___    */
do k=2  to newV2  while  k*k<=z  /*ͺ*divide  Z  with all primes β€ β Z     */
if z//newV1.k==0  then iterate j /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*j*/                  /*ͺ* [β]   only divide up to     β Z     */
newV2= newV2 + 1;             newV1.newV2= z         /*ͺ*bump the prime count;  assign prime #*/
if verify(z, 2357)>0  then iterate j /*ͺ*Digits Β¬prime?  Then skip this prime.*/
c= c + 1                             /*ͺ*bump the number of SPDS primes found.*/
if ox<0  then iterate                /*ͺ*don't display it, display the last #.*/
say right(z, 21)                     /*ͺ*maybe display this prime βββΊ terminal*/
end   /*ͺ*j*/                          /*ͺ* [β]  only display N number of primes*/
if ox<0  then say right(z, 21)             /*ͺ*display one  (the last)  SPDS prime. */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Smarandache-prime-digital-sequence\smarandache-prime-digital-sequence.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
