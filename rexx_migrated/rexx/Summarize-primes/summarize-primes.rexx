/*ͺ*REXX pgm finds summation primes P,  primes which the sum of primes up to P are prime. */
parse arg hi .                                   /*ͺ*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi= 1000               /*ͺ*Not specified?  Then use the default.*/
call genP                                        /*ͺ*build array of semaphores for primes.*/
w= 30;     w2= w*2%3;      pad= left('',w-w2)    /*ͺ*the width of the columns two & three.*/
title= ' summation primes which the sum of primes up to  P  is also prime,  P  < '  ,
commas(hi)
say ' index β' center(subword(title, 1, 2), w)  center('prime sum', w)  /*ͺ*display title.*/
say 'ββββββββΌ'center(""   , 1 + (w+1)*2,  'β')                          /*ͺ*   "    sep.  */
found= 0                                         /*ͺ*initialize # of summation primes.    */
newV3= 0       /*ͺ*sum of primes up to the current prime*/
do j=1  for hi-1;  p= newV1.j;  newV3= newV3 + p   /*ͺ*find summation primes within range.  */
if \newV2.newV3  then iterate                  /*ͺ*Is sumβofβprimes a prime?  Then skip.*/
found= found + 1                       /*ͺ*bump the number of summation primes. */
say right(j, 6) 'β'strip( right(commas(p), w2)pad || right(commas(newV3), w2), "T")
end   /*ͺ*j*/

say 'ββββββββ΄'center(""   , 1 + (w+1)*2,  'β')   /*ͺ*display foot separator after output. */
say
say 'Found '       commas(found)      title
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV2.= 0;  sP= 0                              /*ͺ*prime semaphores;  sP= sum of primes.*/
newV1.1=2;  newV1.2=3;  newV1.3=5;  newV1.4=7;  newV1.5=11     /*ͺ*define some low primes.              */
newV2.2=1;  newV2.3=1;  newV2.5=1;  newV2.7=1;  newV2.11=1     /*ͺ*   "     "   "    "     flags.       */
newV5=5;  sq.newV5= newV1.newV5 **2      /*ͺ*number of primes so far;     primeΒ². */
/*ͺ* [β]  generate more  primes  βξεχΦ³  high.*/
do j=newV1.newV5+2  by 2  until newV1.newV5>=hi & newV1.newV5>sP /*ͺ*find odd primes where  Pβ₯hi and P>sP.*/
parse var j '' -1 newV6; if newV6==5  then iterate            /*ͺ*J Γ· by 5?  (right digit)*/
if j//3==0  then iterate;  if j//7==0  then iterate   /*ͺ*J Γ· by 3?;   J Γ· by 7?  */
do k=5  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ³  β J   */
newV5= newV5+1;    newV1.newV5= j;   sq.newV5= j*j;   newV2.j= 1 /*ͺ*bump # Ps; assign next P; P square; P*/
if newV1.newV5<hi  then sP= sP + newV1.newV5             /*ͺ*maybe add this prime to sumβofβprimes*/
end          /*ͺ*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Summarize-primes\summarize-primes.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
