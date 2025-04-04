/*ͺ*REXX program displays  squareβfree numbers  (integers > 1)  up to a specified limit.  */
numeric digits 20                                /*ͺ*be able to handle larger numbers.    */
parse arg LO HI .                                /*ͺ*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO=   1                /*ͺ*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI= 145                /*ͺ* "      "         "   "   "     "    */
sw= linesize() - 1                               /*ͺ*use one less than a full line.       */
newV2 = 0                                            /*ͺ*count of squareβfree numbers found.  */
newV3=                                               /*ͺ*variable that holds a line of numbers*/
do j=LO  to abs(HI)                         /*ͺ*process all integers between LO & HI.*/
if \isSquareFree(j)   then iterate          /*ͺ*Not squareβfree?   Then skip this #. */
newV2= newV2 + 1                                    /*ͺ*bump the count of squareβfree numbers*/
if HI<0  then iterate                       /*ͺ*Only counting 'em? Then look for more*/
if length(newV3 || j)<sw  then newV3= strip(newV3 j)    /*ͺ*append the number to the output list.*/
else do;   say newV3;   newV3=j;   end   /*ͺ*display a line of numbers.*/
end   /*ͺ*j*/

if newV3\==''  then say newV3                            /*ͺ*are there any residuals to display ? */
newV1= 'The number of squareβfree numbers between '
if HI<0    then say newV1  LO      " and "      abs(HI)       ' (inclusive)  is: '     newV2
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isSquareFree: procedure; parse arg x;  if x<1  then return 0  /*ͺ*is the number too small?*/
odd= x//2                          /*ͺ*ODD=1   if X is odd,   ODD=0 if even.*/
do k=2+odd  to iSqrt(x)  by 1+odd /*ͺ*use all numbers, or just odds*/
if x // k**2 == 0  then return 0  /*ͺ*Is  X  divisible by a square?*/
end   /*ͺ*k*/                       /*ͺ* [β]  Yes? Then Β¬ squareβfree*/
return 1                           /*ͺ* [β]       //  is REXX's Γ· remainder.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
iSqrt: procedure; parse arg x;         q= 1;         do while q<=x;       q= q * 4
end   /*ͺ*while q<=x*/
r= 0
do while q>1;        q= q % 4;     newV4= x - r - q;        r= r % 2
if newV4>=0  then do;    x= newV4;         r= r + q;            end
end   /*ͺ*while q>1*/
return r                                  /*ͺ*R  is the integer square root of  X. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Square-free-integers\square-free-integers.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
