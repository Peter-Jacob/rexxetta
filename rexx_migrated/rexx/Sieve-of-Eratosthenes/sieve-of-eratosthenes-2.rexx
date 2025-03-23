/*�*REXX program generates primes via a  wheeled  sieve of Eratosthenes  algorithm.       */
parse arg H .;   if H==''  then H=200            /*�*let the highest number be specified. */
tell=h>0;     H=abs(H);    w=length(H)           /*�*a negative H suppresses prime listing*/
if 2<=H & tell  then say right(1, w+20)'st prime   ───► '      right(2, w)
newV1.= '0'x                                         /*�*assume that  all  numbers are prime. */
cw= length(newV1.)                                   /*�*the cell width that holds numbers.   */
newV2= w<=H                                          /*�*the number of primes found  (so far).*/
newV3=0                                              /*�*skips the top part of sieve marking. */
do j=3  by 2  for (H-2)%2;  b= j%cw          /*�*odd integers up to   H   inclusive.  */
if substr(x2b(c2x(newV1.b)),j//cw+1,1)  then iterate              /*�*is  J  composite ?  */
newV2= newV2 + 1                                     /*�*bump the prime number counter.       */
if tell  then say right(newV2, w+20)th(newV2)    'prime   ───► '      right(j, w)
if newV3     then iterate                        /*�*should the top part be skipped ?     */
jj=j * j                                     /*�*compute the square of  J.         ___*/
if jj>H  then newV3=1                            /*�*indicates skip top part  if  j > √ H */
do m=jj  to H  by j+j;   call . m;   end   /*�* [↑]  strike odd multiples  ¬ prime  */
end   /*�*j*/                                  /*�*             ───                     */

say;             say  right(newV2, w+20)      'prime's(newV2)    "found up to and including "  H
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────────────*/
.: parse arg n; b=n%cw; r=n//cw+1;newV4=x2b(c2x(newV1.b));newV1.b=x2c(b2x(left(newV4,r-1)'1'substr(newV4,r+1)));return
s: if arg(1)==1  then return arg(3);  return word(arg(2) 's',1)            /*�*pluralizer.*/
th: procedure; parse arg x; x=abs(x); return word('th st nd rd',1+x//10*(x//100%10\==1)*(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sieve-of-Eratosthenes\sieve-of-eratosthenes-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
