/*ͺ*REXX pgm computes & shows a value grid of the MΓΆbius function for a range of integers.*/
parse arg LO HI grp .                            /*ͺ*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=   0             /*ͺ*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI= 199             /*ͺ* "      "         "   "   "     "    */
if grp=='' | grp==","  then grp=  20             /*ͺ* "      "         "   "   "     "    */
/*ͺ*                            ______   */
call genP HI                                     /*ͺ*generate primes up to the  β  HI     */
say center(' The MΓΆbius sequence from ' LO " βββΊ " HI" ", max(50, grp*3), 'β')   /*ͺ*title*/
newV2=                                               /*ͺ*variable holds output grid of GRP #s.*/
do j=LO  to  HI;  newV2= newV2  right( mobius(j), 2) /*ͺ*process some numbers from  LO βββΊ HI.*/
if words(newV2)==grp  then do;  say substr(newV2, 2);  newV2=    /*ͺ*show grid if fully populated,*/
end                           /*ͺ*  and nullify it for more #s.*/
end   /*ͺ*j*/                                  /*ͺ*for small grids, using wordCnt is OK.*/

if newV2\==''  then say substr(newV2, 2)                 /*ͺ*handle any residual numbers not shown*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
mobius: procedure expose newV1.;  parse arg x        /*ͺ*obtain a integer to be tested for mu.*/
if x<1  then return 'β'                  /*ͺ*special? Then return symbol for null.*/
newV3= 0                                     /*ͺ*start with a value of zero.          */
do k=1;  p= newV1.k                     /*ͺ*get the  Kth  (preβgenerated)  prime.*/
if p>x  then leave                  /*ͺ*prime (P)   > X?    Then we're done. */
if p*p>x  then do;   newV3= newV3+1;  leave /*ͺ*prime (P**2 > X?    Bump # and leave.*/
end
if x//p==0  then do; newV3= newV3+1         /*ͺ*X divisible by P?   Bump mu number.  */
x= x % p       /*ͺ*                    Divide by prime. */
if x//p==0  then return 0  /*ͺ*XΓ·by P?  Then return zero*/
end
end   /*ͺ*k*/                         /*ͺ*#  (below) is almost always small, <9*/
if newV3//2==0  then return  1               /*ͺ*Is # even?   Then return postive  1  */
return -1               /*ͺ* " "  odd?     "     "   negative 1. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6= 13;  nP=6  /*ͺ*assign low primes; # primes.*/
do lim=nP  until lim*lim>=HI /*ͺ*only keep primes up to the  sqrt(HI).*/
end   /*ͺ*lim*/
do j=newV1.nP+4  by 2  to HI                  /*ͺ*only find odd primes from here on.   */
parse var j '' -1 newV4;if newV4==5  then iterate /*ͺ*Is last digit a "5"?   Then not prime*/
if j// 3==0  then iterate                 /*ͺ*is J divisible by  3?    "   "    "  */
if j// 7==0  then iterate                 /*ͺ* " "     "      "  7?    "   "    "  */
if j//11==0  then iterate                 /*ͺ* " "     "      " 11?    "   "    "  */
if j//13==0  then iterate                 /*ͺ* " "     "      " 13?    "   "    "  */
do k=7  while k*k<=j            /*ͺ*divide by some generated odd primes. */
if j // newV1.k==0  then iterate j  /*ͺ*Is J divisible by  P?  Then not prime*/
end   /*ͺ*k*/                     /*ͺ* [β]  a prime  (J)  has been found.  */
nP= nP+1;    if nP<=HI  then newV1.nP= j      /*ͺ*bump prime count; assign prime to  @.*/
end      /*ͺ*j*/;              return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\M-bius-function\m-bius-function.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
