/*�*REXX program finds & displays circular primes (with a title & in a horizontal format).*/
parse arg N hp .                                 /*�*obtain optional arguments from the CL*/
if  N=='' |  N==","  then N=        19           /*�* "      "         "   "   "     "    */
if hp=='' | hp==","  then hip= 1000000           /*�* "      "         "   "   "     "    */
call genP                                        /*�*gen primes up to  hp      (200,000). */
q= 024568                                        /*�*digs that most circular P can't have.*/
found= 0;                           newV3=           /*�*found:  circular P count; $:  a list.*/
do j=1  until found==N;       p= newV1.j       /*�* [↓]  traipse through all the primes.*/
if p>9 & verify(p, q, 'M')>0  then iterate /*�*Does J contain forbidden digs?  Skip.*/
if \circP(p)                  then iterate /*�*Not circular?  Then skip this number.*/
found= found + 1                           /*�*bump the  count  of circular primes. */
newV3= newV3  p                                    /*�*add this prime number  ──►  $  list. */
end   /*�*j*/                                /*�*at this point, $ has a leading blank.*/

say center(' first '       found        " circular primes ",  79, '─')
say strip(newV3)
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
circP: procedure expose newV1. newV2.;  parse arg x 1 ox /*�*obtain a prime number to be examined.*/
do length(x)-1; parse var x f 2 y /*�*parse  X  number, rotating the digits*/
x= y || f                         /*�*construct a new possible circular P. */
if x<ox  then return 0            /*�*is number < the original?  ¬ circular*/
if \newV2.x  then return 0            /*�* "    "   not prime?       ¬ circular*/
end   /*�*length(x)···*/
return 1                                  /*�*passed all tests,  X is a circular P.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6=13; newV1.7=17; newV1.8=19        /*�*assign Ps; #Ps*/
newV2.= 0; newV2.2=1; newV2.3=1; newV2.5=1; newV2.7=1; newV2.11=1; newV2.13=1; newV2.17=1; newV2.19=1 /*�*   " primality*/
newV4= 8;  sq.newV4= newV1.newV4 **2  /*�*number of primes so far; prime square*/
do j=newV1.newV4+4  by 2  to hip;  parse var j  ''  -1  newV5 /*�*get last decimal digit of J. */
if     newV5==5  then iterate;   if j// 3==0  then iterate;   if j// 7==0  then iterate
if j//11==0  then iterate;   if j//13==0  then iterate;   if j//17==0  then iterate
do k=8  while sq.k<=j                 /*�*divide by some generated odd primes. */
if j // newV1.k==0  then iterate j        /*�*Is J divisible by  P?  Then not prime*/
end   /*�*k*/                           /*�* [↓]  a prime  (J)  has been found.  */
newV4= newV4+1;   newV2.j= 1;   sq.newV4= j*j;   newV1.newV4= j   /*�*bump P cnt;  assign P to @.  and  !. */
end       /*�*j*/;                 return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Circular-primes\circular-primes.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
