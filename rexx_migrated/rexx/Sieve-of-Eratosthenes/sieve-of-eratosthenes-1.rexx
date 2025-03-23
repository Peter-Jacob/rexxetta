/*�*REXX program generates and displays primes  via the  sieve of Eratosthenes  algorithm.*/
parse arg H .;   if H=='' | H==","  then H= 200  /*�*optain optional argument from the CL.*/
w= length(H);    newV1= right('prime', 20)      /*�*W:   is used for aligning the output.*/
newV2.=.                                             /*�*assume all the numbers are  prime.   */
newV3= 0                                             /*�*number of primes found  (so far).    */
do j=2  for H-1;   if newV2.j==''  then iterate /*�*all prime integers up to H inclusive.*/
newV3= newV3 + 1                                    /*�*bump the prime number counter.       */
say  newV1 right(newV3,w)  " ───► " right(j,w) /*�*display the  prime  to the terminal. */
do m=j*j  to H  by j;    newV2.m=;   end    /*�*strike all multiples as being ¬ prime*/
end   /*�*j*/                                 /*�*       ───                           */
say                                              /*�*stick a fork in it,  we're all done. */
say  right(newV3, 1+w+length(newV1) )     'primes found up to and including '       H
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sieve-of-Eratosthenes\sieve-of-eratosthenes-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
