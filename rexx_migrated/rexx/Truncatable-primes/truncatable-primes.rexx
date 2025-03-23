/*�*REXX program finds largest  left─ and right─truncatable  primes ≤ 1m  (or argument 1).*/
parse arg hi .;      if hi==''  then hi= 1000000 /*�*Not specified? Then use default of 1m*/
call genP                                        /*�*generate some primes,  about  hi ÷ 2 */
/*�* [↓]  find largest left truncatable P*/
do L=newV4  by -1  for newV4                           /*�*search from top end;  get the length.*/
do k=1  for length(newV1.L); newV3= right(newV1.L, k) /*�*validate all left truncatable primes.*/
if \newV2.newV3  then iterate L                   /*�*Truncated number not prime?  Skip it.*/
end   /*�*k*/
leave                                          /*�*egress, found left truncatable prime.*/
end        /*�*L*/
/*�* [↓]  find largest right truncated P.*/
do R=newV4  by -1  for newV4                           /*�*search from top end;  get the length.*/
do k=1  for length(newV1.R);  newV3= left(newV1.R, k) /*�*validate all right truncatable primes*/
if \newV2.newV3  then iterate R                   /*�*Truncated number not prime?  Skip it.*/
end   /*�*k*/
leave                                          /*�*egress, found right truncatable prime*/
end        /*�*R*/

say 'The largest  left─truncatable prime ≤'        hi        " is "       right(newV1.L, w)
say 'The largest right─truncatable prime ≤'        hi        " is "       right(newV1.R, w)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: newV2.= 0;                     w= length(hi)   /*�*placeholders for primes;  max width. */
newV1.1=2;  newV1.2=3;  newV1.3=5;  newV1.4=7;  newV1.5=11     /*�*define some low primes.              */
newV2.2=1;  newV2.3=1;  newV2.5=1;  newV2.7=1;  newV2.11=1     /*�*   "     "   "    "     flags.       */
newV4=5;     s.newV4= newV1.newV4 **2    /*�*number of primes so far;     prime². */
/*�* [↓]  generate more  primes  ≤  high.*/
do j=newV1.newV4+2  by 2  for max(0, hi%2-newV1.newV4%2-1)      /*�*find odd primes from here on. */
parse var j '' -1 newV3; if     newV3==5  then iterate  /*�*J divisible by 5?  (right dig)*/
if j// 3==0  then iterate  /*�*"     "      " 3?             */
if j// 7==0  then iterate  /*�*"     "      " 7?             */
/*�* [↑]  the above five lines saves time*/
do k=5  while s.k<=j              /*�* [↓]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*�*Is  J ÷ X?  Then not prime.     ___  */
end   /*�*k*/                       /*�* [↑]  only process numbers  ≤  √ J   */
newV4= newV4+1;    newV1.newV4= j;    s.newV4= j*j;   newV2.j= 1 /*�*bump # of Ps; assign next P;  P²; P# */
end          /*�*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Truncatable-primes\truncatable-primes.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
