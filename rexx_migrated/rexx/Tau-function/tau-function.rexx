/*ͺ*REXX program counts the number of divisors (tau,  or sigma_0)  up to and including  N.*/
parse arg LO HI cols .                           /*ͺ*obtain optional argument from the CL.*/
if   LO=='' |   LO==","  then  LO=   1           /*ͺ*Not specified?  Then use the default.*/
if   HI=='' |   HI==","  then  HI=  LO + 100 - 1 /*ͺ*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols= 20           /*ͺ* "      "         "   "   "     "    */
w= 2 + (HI>45359)                                /*ͺ*W:  used to align the output columns.*/
say 'The number of divisors  (tau)  for integers up to '    n    " (inclusive):";      say
say 'βindexβ'   center(" tau (number of divisors) ",  cols * (w+1)  +  1,  'β')
newV1=;                                   c= 0       /*ͺ*$:  the output list,  shown ROW/line.*/
do j=LO  to HI;       c= c + 1   /*ͺ*list # proper divisors (tau) 1 βββΊ N */
newV1= newV1  right( tau(j), w)          /*ͺ*add a tau number to the output list. */
if c//cols \== 0  then iterate   /*ͺ*Not a multiple of ROW? Don't display.*/
idx= j - cols + 1                /*ͺ*calculate index value (for this row).*/
say center(idx, 7)    newV1;  newV1=     /*ͺ*display partial list to the terminal.*/
end   /*ͺ*j*/

if newV1\==''  then say center(idx+cols, 7)    newV1     /*ͺ*there any residuals left to display ?*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tau: procedure; parse arg x 1 y                  /*ͺ*X  and  $  are both set from the arg.*/
if x<6  then return 2 + (x==4) - (x==1)     /*ͺ*some low #s should be handled special*/
odd= x // 2                                 /*ͺ*check if  X  is odd (remainder of 1).*/
if odd  then       newV2= 2                     /*ͺ*Odd?    Assume divisor count of  2.  */
else do;   newV2= 4;   y= x % 2;   end  /*ͺ*Even?      "      "      "    "  4.  */
/*ͺ* [β]  start with known number of divs*/
do j=3  for x%2-3  by 1+odd  while j<y   /*ͺ*for odd number,  skip even numbers.  */
if x//j==0  then do                      /*ͺ*if no remainder, then found a divisor*/
newV2= newV2 + 2;   y= x % j    /*ͺ*bump # of divisors;  calculate limit.*/
if j>=y  then do;   newV2= newV2 - 1;   leave;   end   /*ͺ*reached limit?*/
end                     /*ͺ*                     ___             */
else if j*j>x  then leave    /*ͺ*only divide up to   β x              */
end   /*ͺ*j*/;               return newV2      /*ͺ* [β]  this form of DO loop is faster.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tau-function\tau-function.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
