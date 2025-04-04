/*ช*REXX program finds & displays circular primes (with a title & in a horizontal format).*/
parse arg N hp .                                 /*ช*obtain optional arguments from the CL*/
if  N=='' |  N==","  then N=        19           /*ช* "      "         "   "   "     "    */
if hp=='' | hp==","  then hip= 1000000           /*ช* "      "         "   "   "     "    */
call genP                                        /*ช*gen primes up to  hp      (200,000). */
q= 024568                                        /*ช*digs that most circular P can't have.*/
found= 0;                           newV3=           /*ช*found:  circular P count; $:  a list.*/
do j=1  until found==N;       p= newV1.j       /*ช* [โ]  traipse through all the primes.*/
if p>9 & verify(p, q, 'M')>0  then iterate /*ช*Does J contain forbidden digs?  Skip.*/
if \circP(p)                  then iterate /*ช*Not circular?  Then skip this number.*/
found= found + 1                           /*ช*bump the  count  of circular primes. */
newV3= newV3  p                                    /*ช*add this prime number  โโโบ  $  list. */
end   /*ช*j*/                                /*ช*at this point, $ has a leading blank.*/

say center(' first '       found        " circular primes ",  79, 'โ')
say strip(newV3)
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
circP: procedure expose newV1. newV2.;  parse arg x 1 ox /*ช*obtain a prime number to be examined.*/
do length(x)-1; parse var x f 2 y /*ช*parse  X  number, rotating the digits*/
x= y || f                         /*ช*construct a new possible circular P. */
if x<ox  then return 0            /*ช*is number < the original?  ยฌ circular*/
if \newV2.x  then return 0            /*ช* "    "   not prime?       ยฌ circular*/
end   /*ช*length(x)ยทยทยท*/
return 1                                  /*ช*passed all tests,  X is a circular P.*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
genP: newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6=13; newV1.7=17; newV1.8=19        /*ช*assign Ps; #Ps*/
newV2.= 0; newV2.2=1; newV2.3=1; newV2.5=1; newV2.7=1; newV2.11=1; newV2.13=1; newV2.17=1; newV2.19=1 /*ช*   " primality*/
newV4= 8;  sq.newV4= newV1.newV4 **2  /*ช*number of primes so far; prime square*/
do j=newV1.newV4+4  by 2  to hip;  parse var j  ''  -1  newV5 /*ช*get last decimal digit of J. */
if     newV5==5  then iterate;   if j// 3==0  then iterate;   if j// 7==0  then iterate
if j//11==0  then iterate;   if j//13==0  then iterate;   if j//17==0  then iterate
do k=8  while sq.k<=j                 /*ช*divide by some generated odd primes. */
if j // newV1.k==0  then iterate j        /*ช*Is J divisible by  P?  Then not prime*/
end   /*ช*k*/                           /*ช* [โ]  a prime  (J)  has been found.  */
newV4= newV4+1;   newV2.j= 1;   sq.newV4= j*j;   newV1.newV4= j   /*ช*bump P cnt;  assign P to @.  and  !. */
end       /*ช*j*/;                 return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Circular-primes\circular-primes.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
