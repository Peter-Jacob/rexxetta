/*ͺ*REXX pgm finds & shows Zumkeller numbers: 1st N; 1st odd M; 1st odd V not ending in 5.*/
parse arg n m v .                                /*ͺ*obtain optional arguments from the CL*/
if n=='' | n==","  then n= 220                   /*ͺ*Not specified?  Then use the default.*/
if m=='' | m==","  then m=  40                   /*ͺ* "      "         "   "   "     "    */
if v=='' | v==","  then v=  40                   /*ͺ* "      "         "   "   "     "    */
newV1= ' Zumkeller numbers are: '                 /*ͺ*literal used for displaying messages.*/
sw= linesize() - 1                               /*ͺ*obtain the usable screen width.      */
say
if n>0  then say center(' The first '       n       newV1,  sw, "β")
newV4= 0                                             /*ͺ*the count of Zumkeller numbers so far*/
newV5=                                               /*ͺ*initialize the  $  list  (to a null).*/
do j=1  until newV4==n                       /*ͺ*traipse through integers 'til done.  */
if \Zum(j)  then iterate                 /*ͺ*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*ͺ*bump Zumkeller count;  add to $ list.*/
end   /*ͺ*j*/

if newV5\==''  then say newV5                            /*ͺ*Are there any residuals? Then display*/
say
if m>0  then say center(' The first odd '   m       newV1,  sw, "β")
newV4= 0                                             /*ͺ*the count of Zumkeller numbers so far*/
newV5=                                               /*ͺ*initialize the  $  list  (to a null).*/
do j=1  by 2  until newV4==m                 /*ͺ*traipse through integers 'til done.  */
if \Zum(j)  then iterate                 /*ͺ*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*ͺ*bump Zumkeller count;  add to $ list.*/
end   /*ͺ*j*/

if newV5\==''  then say newV5                            /*ͺ*Are there any residuals? Then display*/
say
if v>0  then say center(' The first odd '   v       " (not ending in 5) " newV1,  sw, 'β')
newV4= 0                                             /*ͺ*the count of Zumkeller numbers so far*/
newV5=                                               /*ͺ*initialize the  $  list  (to a null).*/
do j=1  by 2  until newV4==v                 /*ͺ*traipse through integers 'til done.  */
if right(j,1)==5  then iterate           /*ͺ*skip if odd number ends in digit "5".*/
if \Zum(j)  then iterate                 /*ͺ*if not a Zumkeller number, then skip.*/
newV4= newV4 + 1;           call addnewV5            /*ͺ*bump Zumkeller count;  add to $ list.*/
end   /*ͺ*j*/

if newV5\==''  then say newV5                            /*ͺ*Are there any residuals? Then display*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
addnewV5: newV6= strip(newV5 j, 'L');   if length(newV6)<sw  then do;  newV5= newV6;  return;  end    /*ͺ*add to $*/
say  strip(newV5, 'L');                              newV5= j;  return          /*ͺ*say, add*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
iSqrt: procedure; parse arg x;  r= 0;  q= 1;                    do while q<=x; q=q*4;  end
do while q>1; q= q%4; newV6= x-r-q; r= r%2; if newV6>=0  then do; x= newV6; r= r+q; end; end
return r                                  /*ͺ*R  is the integer square root of  X. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
PDaS: procedure; parse arg x 1 b;  odd= x//2     /*ͺ*obtain  X  and  B (the 1st argument).*/
if x==1  then return 1 1                   /*ͺ*handle special case for unity.       */
r= iSqrt(x)                                /*ͺ*calculate integer square root of  X. */
a= 1                                       /*ͺ* [β]  use all, or only odd numbers.  */
sig= a + b                                 /*ͺ*initialize the sigma  (so far)   ___ */
do j=2+odd  by 1+odd  to r - (r*r==x)  /*ͺ*divide by some integers up to   β X  */
if x//j==0  then do;  a=a j;  b= x%j b /*ͺ*if Γ·, add both divisors to Ξ± & Γ.    */
sig= sig +j +x%j /*ͺ*bump the sigma (the sum of divisors).*/
end
end   /*ͺ*j*/                            /*ͺ* [β]  %  is the REXX integer division*/
/*ͺ* [β]  adjust for a square.        ___*/
if j*j==x  then  return sig+j  a j b       /*ͺ*Was  X  a square?    If so, add  β X */
return sig    a   b       /*ͺ*return the divisors  (both lists).   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Zum:  procedure; parse arg x .                   /*ͺ*obtain a # to be tested for Zumkeller*/
if x<6    then return 0                    /*ͺ*test if X is too low     "      "    */
if x<945  then if x//2==1  then return 0   /*ͺ*  "   " "  "  "   "  for odd    "    */
parse value  PDaS(x)  with  sigma pdivs    /*ͺ*obtain sigma and the proper divisors.*/
if sigma//2  then return 0                 /*ͺ*Is the  sigma  odd?    Not Zumkeller.*/
newV4= words(pdivs)                            /*ͺ*count the number of divisors for  X. */
if newV4<3       then return 0                 /*ͺ*Not enough divisors?    "      "     */
if x//2      then do; newV6= sigma - x - x     /*ͺ*use abundant optimization for odd #'s*/
return newV6>0 & newV6//2==0 /*ͺ*Abundant is > 0 and even?  It's a Zum*/
end
if newV4>23      then return 1                 /*ͺ*# divisors is 24 or more?  It's a Zum*/

do i=1  for newV4;   newV2.i= word(pdivs, i)  /*ͺ*assign proper divisors to the @ array*/
end   /*ͺ*i*/
c=0;            u= 2**newV4;   newV3.= .
do p=1  for u-2;       b= x2b(d2x(p))  /*ͺ*convert PβββΊbinary with leading zeros*/
b= right(strip(b, 'L', 0), newV4, 0)       /*ͺ*ensure enough leading zeros for  B.  */
r= reverse(b); if newV3.r\==. then iterate /*ͺ*is this binary# a palindrome of prev?*/
c= c + 1;   yy.c= b;   newV3.b=            /*ͺ*store this particular combination.   */
end   /*ͺ*p*/

do part=1  for c;      p1= 0;   p2= 0  /*ͺ*test of two partitions add to same #.*/
newV6= yy.part                             /*ͺ*obtain one method of partitioning.   */
do cp=1  for newV4                       /*ͺ*obtain the sums of the two partitions*/
if substr(newV6, cp, 1)  then p1= p1 + newV2.cp     /*ͺ*if a  one, then add it to  P1.*/
else p2= p2 + newV2.cp     /*ͺ* " " zero,   "   "   "  "  P2.*/
end   /*ͺ*cp*/
if p1==p2  then return 1               /*ͺ*Partition sums equal?  Then X is Zum.*/
end   /*ͺ*part*/
return 0                                   /*ͺ*no partition sum passed.  X isn't Zum*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zumkeller-numbers\zumkeller-numbers.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
