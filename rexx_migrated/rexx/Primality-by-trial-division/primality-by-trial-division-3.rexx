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
isPrime: procedure;    parse arg x               /*ช*get the integer to be investigated.  */
if x<107  then return wordpos(x, '2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53',
newV1==0  /*ช*some low primes.*/
if x// 2 ==0  then return 0             /*ช*eliminate all the even numbers.      */
if x// 3 ==0  then return 0             /*ช* ยทยทยท and eliminate the triples.      */
parse var  x  ''  -1  newV2                 /*ช*          obtain the rightmost digit.*/
if     newV2 ==5  then return 0             /*ช* ยทยทยท and eliminate the nickels.      */
if x// 7 ==0  then return 0             /*ช* ยทยทยท and eliminate the luckies.      */
if x//11 ==0  then return 0
if x//13 ==0  then return 0
if x//17 ==0  then return 0
if x//19 ==0  then return 0
if x//23 ==0  then return 0
if x//29 ==0  then return 0
if x//31 ==0  then return 0
if x//37 ==0  then return 0
if x//41 ==0  then return 0
if x//43 ==0  then return 0
if x//47 ==0  then return 0
if x//53 ==0  then return 0
if x//59 ==0  then return 0
if x//61 ==0  then return 0
if x//67 ==0  then return 0
if x//71 ==0  then return 0
if x//73 ==0  then return 0
if x//79 ==0  then return 0
if x//83 ==0  then return 0
if x//89 ==0  then return 0
if x//97 ==0  then return 0
if x//101==0  then return 0
if x//103==0  then return 0             /*ช*Note:  REXX   //   is  รท  remainder. */
do k=107  by 6  while k*k<=x  /*ช*this skips odd multiples of three.   */
if x//k    ==0  then return 0 /*ช*perform a divide (modulus),          */
if x//(k+2)==0  then return 0 /*ช* ยทยทยท and the next also.   ___        */
end   /*ช*k*/                   /*ช*divide up through the    โ x         */
return 1                                /*ช*after all that,  ยทยทยท it's a prime.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Primality-by-trial-division\primality-by-trial-division-3.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
