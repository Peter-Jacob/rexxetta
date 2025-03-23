/*�*REXX program finds and displays  Wieferich primes  which are under a specified limit N*/
parse arg n .                                    /*�*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 5000                  /*�*Not specified?  Then use the default.*/
numeric digits 3000                              /*�*bump # of dec. digs for calculation. */
numeric digits max(9, length(2**n) )             /*�*calculate # of decimal digits needed.*/
call genP                                        /*�*build array of semaphores for primes.*/
title= ' Wieferich primes that are  < '   commas(n)    /*�*title for the output.*/
w= length(title) + 2                             /*�*width of field for the primes listed.*/
say ' index │'center(title, w)                   /*�*display the title for the output.    */
say '───────┼'center(""   , w, '─')              /*�*   "     a   sep   "   "     "       */
found= 0                                         /*�*initialize number of Wieferich primes*/
do j=1  to newV4;    p= newV1.j                 /*�*search for Wieferich primes in range.*/
if (2**(p-1)-1)//p**2\==0  then iterate /*�*P**2 not evenly divide  2**(P-1) - 1?*/       /*�* ◄■■■■■■■ the filter.*/
found= found + 1                        /*�*bump the counter of Wieferich primes.*/
say center(found, 7)'│'  center(commas(p), w)    /*�*display the Wieferich prime.*/
end   /*�*j*/

say '───────┴'center(""   , w, '─');   say       /*�*display a  foot sep  for the output. */
say 'Found '       commas(found)       title     /*�*   "    "  summary    "   "     "    */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP:        newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11  /*�*define some low primes  (index-1).   */
newV2.=0;  newV2.2=1; newV2.3=1; newV2.5=1; newV2.7=1; newV2.11=1  /*�*   "     "   "    "     (semaphores).*/
newV4= 5;  sq.newV4= newV1.newV4 ** 2 /*�*number of primes so far;     prime². */
do j=newV1.newV4+2  by 2  to n-1;  parse var j '' -1 newV5   /*�*get right decimal digit of J.*/
if    newV5==5  then iterate                               /*�*J ÷ by 5?    Yes, skip.*/
if j//3==0  then iterate;  if j//7==0  then iterate    /*�*" "  " 3?    J ÷ by 7? */
do k=5  while sq.k<=j             /*�* [↓]  divide by the known odd primes.*/
if j//newV1.k==0  then iterate j      /*�*Is J ÷ a P?   Then not prime.   ___  */
end   /*�*k*/                       /*�* [↑]  only process numbers  ≤  √ J   */
newV4= newV4+1;    newV1.newV4= j;   sq.newV4= j*j;   newV2.j= 1 /*�*bump # Ps; assign next P; P sqare; P.*/
end          /*�*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Wieferich-primes\wieferich-primes.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
