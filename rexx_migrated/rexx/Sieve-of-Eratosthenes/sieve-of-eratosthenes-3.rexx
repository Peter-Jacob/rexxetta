/*ª*REXX pgm generates and displays primes via a wheeled sieve of Eratosthenes algorithm. */
parse arg H .;  if H=='' | H==","  then H= 200   /*ª*obtain the optional argument from CL.*/
w= length(H);       newV1= right('prime', 20)   /*ª*w:  is used for aligning the output. */
if 2<=H  then  say  newV1  right(1, w)       " â”€â”€â”€â–º "       right(2, w)
newV3= 2<=H                                          /*ª*the number of primes found  (so far).*/
newV2.=.                                             /*ª*assume all the numbers are  prime.   */
newV4=0;  do j=3  by 2  for (H-2)%2                  /*ª*the odd integers up to  H  inclusive.*/
if newV2.j==''  then iterate                   /*ª*Is composite?  Then skip this number.*/
newV3= newV3 + 1                                   /*ª*bump the prime number counter.       */
say  newV1 right(newV3,w) " â”€â”€â”€â–º " right(j,w) /*ª*display the prime to the terminal.   */
if newV4        then iterate                   /*ª*skip the top part of loop?       ___ */
if j*j>H     then newV4=1                      /*ª*indicate skip top part  if  J > âˆš H  */
do m=j*j  to H  by j+j;   newV2.m=;   end  /*ª*strike odd multiples as  not  prime. */
end   /*ª*j*/                                /*ª*       â”€â”€â”€                           */
say                                              /*ª*stick a fork in it,  we're all done. */
say right(newV3,  1 + w + length(newV1) )    'primes found up to and including '    H
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sieve-of-Eratosthenes\sieve-of-eratosthenes-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
