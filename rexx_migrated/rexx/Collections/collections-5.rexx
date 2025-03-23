pr.   = 0                      /*�*define a default for all elements for the array.*/
pr.2  = 1
pr.3  = 1
pr.5  = 1
pr.7  = 1
pr.11 = 1
pr.13 = 1
pr.17 = 1
pr.19 = 1
pr.23 = 1
pr.29 = 1
pr.31 = 1
pr.37 = 1
pr.41 = 1
pr.43 = 1
pr.47 = 1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
primes=0
do j=1  for 10000                       /*�*this method isn't very efficient.    */
if \pr.j  then iterate                  /*�*Not prime?   Then skip this element. */
primes = primes + 1                     /*�*bump the number of primes  (counter).*/
end   /*�*j*/
/*�*note that the  10000  is a small "∞".*/
say '# of primes in list:'  primes
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV1=0
do j=1  for 10000                       /*�*this method is not very efficient.   */
if pr.j\==0  then newV1 = newV1 + 1 /*�*Not zero?  Bump the number of primes.*/
end   /*�*j*/                             /*�* [↑]  not as idiomatic as 1st program*/

say '# of primes in the list:'  newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Ps=0
do k=1  for 10000                       /*�*and yet another inefficient method.  */
if pr.k==0  then iterate                /*�*Not a prime?  Then skip this element.*/
Ps = Ps + 1                             /*�*bump the counter for the # of primes.*/
say 'prime'  Ps  "is:"  k               /*�*might as well echo this prime number.*/
end   /*�*k*/

say 'The number of primes found in the list is '     Ps
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pr.0 = 47                                        /*�*hardcode the highest prime in array. */
newV2 = 0
do k=2  to  pr.0                        /*�*and much more efficient method.      */
if \pr.k  then iterate                  /*�*Not a prime?  Then skip this element.*/
newV2 = newV2 + 1                               /*�*bump the counter for the # of primes.*/
say 'prime'  Ps  "is:"  k               /*�*might as well echo this prime number.*/
end   /*�*k*/

say 'The number of primes found in the list is: '    newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Collections\collections-5.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
