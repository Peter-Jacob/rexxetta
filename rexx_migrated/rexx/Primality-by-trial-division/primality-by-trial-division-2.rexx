/*ช*REXX program tests for  primality by using  (kinda smartish)  trial division.         */
parse arg n .;  if n==''  then n=10000           /*ช*let the user choose the upper limit. */
tell=(n>0);     n=abs(n)                         /*ช*display the primes  only if   N > 0. */
p=0                                              /*ช*a count of the primes found (so far).*/
do j=-57  to n                             /*ช*start in the cellar and work up.     */
if \isPrime(j)  then iterate               /*ช*if not prime,  then keep looking.    */
p=p+1                                      /*ช*bump the jelly bean counter.         */
if tell  then say right(j,20) 'is prime.'  /*ช*maybe display prime to the terminal. */
end   /*ช*j*/
say
say  "There are "      p       " primes up to "        n        ' (inclusive).'
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPrime: procedure;  parse arg x                       /*ช*get integer to be investigated.*/
if x<11     then return wordpos(x, '2 3 5 7')\==0         /*ช*is it a wee prime? */
if x//2==0  then return 0                     /*ช*eliminate all the even numbers.*/
if x//3==0  then return 0                     /*ช* ยทยทยท and eliminate the triples.*/
do k=5  by 6  until k*k>x            /*ช*this skips odd multiples of 3. */
if x//k    ==0  then return 0        /*ช*perform a divide (modulus),    */
if x//(k+2)==0  then return 0        /*ช* ยทยทยท and the next umpty one.   */
end   /*ช*k*/                          /*ช*Note: REXX  //  is รท remainder.*/
return 1                                      /*ช*did all divisions, it's prime. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Primality-by-trial-division\primality-by-trial-division-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
