/*�*REXX pgm finds & shows Zumkeller numbers: 1st N; 1st odd M; 1st odd V not ending in 5.*/
parse arg n m v .                                /*�*obtain optional arguments from the CL*/
if n=='' | n==","  then n= 220                   /*�*Not specified?  Then use the default.*/
if m=='' | m==","  then m=  40                   /*�* "      "         "   "   "     "    */
if v=='' | v==","  then v=  40                   /*�* "      "         "   "   "     "    */
newV1= ' Zumkeller numbers are: '                 /*�*literal used for displaying messages.*/
sw= linesize() - 1                               /*�*obtain the usable screen width.      */
say
if n>0  then say center(' The first '       n       newV1,  sw, "═")
newV4= 0                                             /*�*the count of Zumkeller numbers so far*/
newV5=                                               /*�*initialize the  $  list  (to a null).*/
do j=1  until newV4==n                       /*�*traipse through integers 'til done.  */
if \Zum(j)  then iterate                 /*�*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*�*bump Zumkeller count;  add to $ list.*/
end   /*�*j*/

if newV5\==''  then say newV5                            /*�*Are there any residuals? Then display*/
say
if m>0  then say center(' The first odd '   m       newV1,  sw, "═")
newV4= 0                                             /*�*the count of Zumkeller numbers so far*/
newV5=                                               /*�*initialize the  $  list  (to a null).*/
do j=1  by 2  until newV4==m                 /*�*traipse through integers 'til done.  */
if \Zum(j)  then iterate                 /*�*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*�*bump Zumkeller count;  add to $ list.*/
end   /*�*j*/

if newV5\==''  then say newV5                            /*�*Are there any residuals? Then display*/
say
if v>0  then say center(' The first odd '   v       " (not ending in 5) " newV1,  sw, '═')
newV4= 0                                             /*�*the count of Zumkeller numbers so far*/
newV5=                                               /*�*initialize the  $  list  (to a null).*/
do j=1  by 2  until newV4==v                 /*�*traipse through integers 'til done.  */
if right(j,1)==5  then iterate           /*�*skip if odd number ends in digit "5".*/
if \Zum(j)  then iterate                 /*�*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*�*bump Zumkeller count;  add to $ list.*/
end   /*�*j*/

if newV5\==''  then say newV5                            /*�*Are there any residuals? Then display*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
addnewV5: newV6= strip(newV5 j, 'L');   if length(newV6)<sw  then do;  newV5= newV6;  return;  end    /*�*add to $*/
say  strip(newV5, 'L');                              newV5= j;  return          /*�*say, add*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
iSqrt: procedure; parse arg x;  r= 0;  q= 1;                    do while q<=x; q=q*4;  end
do while q>1; q= q%4; newV6= x-r-q; r= r%2; if newV6>=0  then do; x= newV6; r= r+q; end; end
return r                                  /*�*R  is the integer square root of  X. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
PDaS: procedure; parse arg x 1 b;  odd= x//2     /*�*obtain  X  and  B (the 1st argument).*/
if x==1  then return 1 1                   /*�*handle special case for unity.       */
r= iSqrt(x)                                /*�*calculate integer square root of  X. */
a= 1                                       /*�* [↓]  use all, or only odd numbers.  */
sig= a + b                                 /*�*initialize the sigma  (so far)   ___ */
do j=2+odd  by 1+odd  to r - (r*r==x)  /*�*divide by some integers up to   √ X  */
if x//j==0  then do;  a=a j;  b= x%j b /*�*if ÷, add both divisors to α & ß.    */
sig= sig +j +x%j /*�*bump the sigma (the sum of divisors).*/
end
end   /*�*j*/                            /*�* [↑]  %  is the REXX integer division*/
/*�* [↓]  adjust for a square.        ___*/
if j*j==x  then  return sig+j  a j b       /*�*Was  X  a square?    If so, add  √ X */
return sig    a   b       /*�*return the divisors  (both lists).   */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Zum:  procedure; parse arg x .                   /*�*obtain a # to be tested for Zumkeller*/
if x<6    then return 0                    /*�*test if X is too low     "      "    */
if x<945  then if x//2==1  then return 0   /*�*  "   " "  "  "   "  for odd    "    */
parse value  PDaS(x)  with  sigma pdivs    /*�*obtain sigma and the proper divisors.*/
if sigma//2  then return 0                 /*�*Is the  sigma  odd?    Not Zumkeller.*/
newV4= words(pdivs)                            /*�*count the number of divisors for  X. */
if newV4<3       then return 0                 /*�*Not enough divisors?    "      "     */
if x//2      then do; newV6= sigma - x - x     /*�*use abundant optimization for odd #'s*/
return newV6>0 & newV6//2==0 /*�*Abundant is > 0 and even?  It's a Zum*/
end
if newV4>23      then return 1                 /*�*# divisors is 24 or more?  It's a Zum*/

do i=1  for newV4;   newV2.i= word(pdivs, i)  /*�*assign proper divisors to the @ array*/
end   /*�*i*/
c=0;            u= 2**newV4;   newV3.= .
do p=1  for u-2;       b= x2b(d2x(p))  /*�*convert P──►binary with leading zeros*/
b= right(strip(b, 'L', 0), newV4, 0)       /*�*ensure enough leading zeros for  B.  */
r= reverse(b); if newV3.r\==. then iterate /*�*is this binary# a palindrome of prev?*/
c= c + 1;   yy.c= b;   newV3.b=            /*�*store this particular combination.   */
end   /*�*p*/

do part=1  for c;      p1= 0;   p2= 0  /*�*test of two partitions add to same #.*/
newV6= yy.part                             /*�*obtain one method of partitioning.   */
do cp=1  for newV4                       /*�*obtain the sums of the two partitions*/
if substr(newV6, cp, 1)  then p1= p1 + newV2.cp     /*�*if a  one, then add it to  P1.*/
else p2= p2 + newV2.cp     /*�* " " zero,   "   "   "  "  P2.*/
end   /*�*cp*/
if p1==p2  then return 1               /*�*Partition sums equal?  Then X is Zum.*/
end   /*�*part*/
return 0                                   /*�*no partition sum passed.  X isn't Zum*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zumkeller-numbers\zumkeller-numbers.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
