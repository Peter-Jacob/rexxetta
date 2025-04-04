/*ͺ*REXX program finds largest  leftβ and rightβtruncatable  primes β€ 1m  (or argument 1).*/
parse arg hi .;      if hi==''  then hi= 1000000 /*ͺ*Not specified? Then use default of 1m*/
call genP                                        /*ͺ*generate some primes,  about  hi Γ· 2 */
/*ͺ* [β]  find largest left truncatable P*/
do L=newV4  by -1  for newV4                           /*ͺ*search from top end;  get the length.*/
do k=1  for length(newV1.L); newV3= right(newV1.L, k) /*ͺ*validate all left truncatable primes.*/
if \newV2.newV3  then iterate L                   /*ͺ*Truncated number not prime?  Skip it.*/
end   /*ͺ*k*/
leave                                          /*ͺ*egress, found left truncatable prime.*/
end        /*ͺ*L*/
/*ͺ* [β]  find largest right truncated P.*/
do R=newV4  by -1  for newV4                           /*ͺ*search from top end;  get the length.*/
do k=1  for length(newV1.R);  newV3= left(newV1.R, k) /*ͺ*validate all right truncatable primes*/
if \newV2.newV3  then iterate R                   /*ͺ*Truncated number not prime?  Skip it.*/
end   /*ͺ*k*/
leave                                          /*ͺ*egress, found right truncatable prime*/
end        /*ͺ*R*/

say 'The largest  leftβtruncatable prime β€'        hi        " is "       right(newV1.L, w)
say 'The largest rightβtruncatable prime β€'        hi        " is "       right(newV1.R, w)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV2.= 0;                     w= length(hi)   /*ͺ*placeholders for primes;  max width. */
newV1.1=2;  newV1.2=3;  newV1.3=5;  newV1.4=7;  newV1.5=11     /*ͺ*define some low primes.              */
newV2.2=1;  newV2.3=1;  newV2.5=1;  newV2.7=1;  newV2.11=1     /*ͺ*   "     "   "    "     flags.       */
newV4=5;     s.newV4= newV1.newV4 **2    /*ͺ*number of primes so far;     primeΒ². */
/*ͺ* [β]  generate more  primes  β€  high.*/
do j=newV1.newV4+2  by 2  for max(0, hi%2-newV1.newV4%2-1)      /*ͺ*find odd primes from here on. */
parse var j '' -1 newV3; if     newV3==5  then iterate  /*ͺ*J divisible by 5?  (right dig)*/
if j// 3==0  then iterate  /*ͺ*"     "      " 3?             */
if j// 7==0  then iterate  /*ͺ*"     "      " 7?             */
/*ͺ* [β]  the above five lines saves time*/
do k=5  while s.k<=j              /*ͺ* [β]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  β€  β J   */
newV4= newV4+1;    newV1.newV4= j;    s.newV4= j*j;   newV2.j= 1 /*ͺ*bump # of Ps; assign next P;  PΒ²; P# */
end          /*ͺ*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Truncatable-primes\truncatable-primes.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
