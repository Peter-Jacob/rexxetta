/*�*REXX pgm finds summation primes P,  primes which the sum of primes up to P are prime. */
parse arg hi .                                   /*�*obtain optional argument from the CL.*/
if hi=='' | hi==","  then hi= 1000               /*�*Not specified?  Then use the default.*/
call genP                                        /*�*build array of semaphores for primes.*/
w= 30;     w2= w*2%3;      pad= left('',w-w2)    /*�*the width of the columns two & three.*/
title= ' summation primes which the sum of primes up to  P  is also prime,  P  < '  ,
commas(hi)
say ' index │' center(subword(title, 1, 2), w)  center('prime sum', w)  /*�*display title.*/
say '───────┼'center(""   , 1 + (w+1)*2,  '─')                          /*�*   "    sep.  */
found= 0                                         /*�*initialize # of summation primes.    */
newV3= 0       /*�*sum of primes up to the current prime*/
do j=1  for hi-1;  p= newV1.j;  newV3= newV3 + p   /*�*find summation primes within range.  */
if \newV2.newV3  then iterate                  /*�*Is sum─of─primes a prime?  Then skip.*/
found= found + 1                       /*�*bump the number of summation primes. */
say right(j, 6) '│'strip( right(commas(p), w2)pad || right(commas(newV3), w2), "T")
end   /*�*j*/

say '───────┴'center(""   , 1 + (w+1)*2,  '─')   /*�*display foot separator after output. */
say
say 'Found '       commas(found)      title
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: newV2.= 0;  sP= 0                              /*�*prime semaphores;  sP= sum of primes.*/
newV1.1=2;  newV1.2=3;  newV1.3=5;  newV1.4=7;  newV1.5=11     /*�*define some low primes.              */
newV2.2=1;  newV2.3=1;  newV2.5=1;  newV2.7=1;  newV2.11=1     /*�*   "     "   "    "     flags.       */
newV5=5;  sq.newV5= newV1.newV5 **2      /*�*number of primes so far;     prime². */
/*�* [↓]  generate more  primes  ����ֳ  high.*/
do j=newV1.newV5+2  by 2  until newV1.newV5>=hi & newV1.newV5>sP /*�*find odd primes where  P≥hi and P>sP.*/
parse var j '' -1 newV6; if newV6==5  then iterate            /*�*J ÷ by 5?  (right digit)*/
if j//3==0  then iterate;  if j//7==0  then iterate   /*�*J ÷ by 3?;   J ÷ by 7?  */
do k=5  while sq.k<=j             /*�* [↓]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*�*Is  J ÷ X?  Then not prime.     ___  */
end   /*�*k*/                       /*�* [↑]  only process numbers  ����ֳ  √ J   */
newV5= newV5+1;    newV1.newV5= j;   sq.newV5= j*j;   newV2.j= 1 /*�*bump # Ps; assign next P; P square; P*/
if newV1.newV5<hi  then sP= sP + newV1.newV5             /*�*maybe add this prime to sum─of─primes*/
end          /*�*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Summarize-primes\summarize-primes.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
