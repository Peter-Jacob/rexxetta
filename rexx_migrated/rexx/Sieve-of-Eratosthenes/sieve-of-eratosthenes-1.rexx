/*ª*REXX program generates and displays primes  via the  sieve of Eratosthenes  algorithm.*/
parse arg H .;   if H=='' | H==","  then H= 200  /*ª*optain optional argument from the CL.*/
w= length(H);    newV1= right('prime', 20)      /*ª*W:   is used for aligning the output.*/
newV2.=.                                             /*ª*assume all the numbers are  prime.   */
newV3= 0                                             /*ª*number of primes found  (so far).    */
do j=2  for H-1;   if newV2.j==''  then iterate /*ª*all prime integers up to H inclusive.*/
newV3= newV3 + 1                                    /*ª*bump the prime number counter.       */
say  newV1 right(newV3,w)  " â”€â”€â”€â–º " right(j,w) /*ª*display the  prime  to the terminal. */
do m=j*j  to H  by j;    newV2.m=;   end    /*ª*strike all multiples as being Â¬ prime*/
end   /*ª*j*/                                 /*ª*       â”€â”€â”€                           */
say                                              /*ª*stick a fork in it,  we're all done. */
say  right(newV3, 1+w+length(newV1) )     'primes found up to and including '       H
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sieve-of-Eratosthenes\sieve-of-eratosthenes-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
