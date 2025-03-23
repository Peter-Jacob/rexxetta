/*ª*REXX program generates primes via sieve of Eratosthenes algorithm.
* 21.07.2012 Walter Pachl derived from above Rexx version
*                       avoid symbols @ and # (not supported by ooRexx)
*                       avoid negations (think positive)
**********************************************************************/
highest=200                       /*ª*define highest number to use.  */
is_prime.=1                       /*ª*assume all numbers are prime.  */
w=length(highest)                 /*ª*width of the biggest number,   */
/*ª*  it's used for aligned output.*/
Do j=3 To highest By 2,           /*ª*strike multiples of odd ints.  */
While j*j<=highest   /*ª* up to sqrt(highest)           */
If is_prime.j Then Do
Do jm=j*3 To highest By j+j /*ª*start with next odd mult. of J */
is_prime.jm=0             /*ª*mark odd mult. of J not prime. */
End
End
End
np=0                              /*ª*number of primes shown         */
Call tell 2
Do n=3 To highest By 2            /*ª*list all the primes found.     */
If is_prime.n Then Do
Call tell n
End
End
Exit
tell: Parse Arg prime
np=np+1
Say '           prime number' right(np,w) " --> " right(prime,w)
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sieve-of-Eratosthenes\sieve-of-eratosthenes-4.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
