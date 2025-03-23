/*�*REXX program  computes and displays the   Pythagorean means  [Amean,  Gmean,  Hmean]. */
numeric digits 20                                /*�*use a little extra for the precision.*/
parse arg n .                                    /*�*obtain the optional argument from CL.*/
if n=='' | n==","  then n= 10                    /*�*None specified?  Then use the default*/
sum= 0;  prod= 1;  rSum= 0                       /*�*initialize sum/product/reciprocal sum*/
newV1=;                       do newV2=1  for n;  newV1= newV1 newV2 /*�*generate list by appending # to list.*/
sum = sum   +   newV2      /*�*compute the sum of all the elements. */
prod= prod  *   newV2      /*�*compute the product of all elements. */
rSum= rSum  + 1/newV2      /*�*compute the sum of the reciprocals.  */
end   /*�*#*/
say ' list ='newV1                                   /*�*display the list of numbers used.    */
say 'Amean ='  sum / n                           /*�*calculate & display  arithmetic mean.*/
say 'Gmean ='  Iroot(prod, n)                    /*�*    "     "     "    geometric    "  */
if result=="[n/a]"  then say '***error***: root' y "can't be even if 1st argument is < 0."
say 'Hmean ='  n   / rSum                        /*�*    "     "     "    harmonic     "  */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Iroot: procedure; parse arg x 1 ox, y 1 oy       /*�*get both args, and also a copy of X&Y*/
if x=0 | x=1 | y=1  then return x         /*�*handle special case of zero and unity*/
if y=0              then return 1         /*�*   "      "      "   " a   zero root.*/
if x<0 & y//2==0    then return  '[n/a]'  /*�*indicate result is "not applicable". */
x= abs(x);          y= abs(y);   m= y - 1 /*�*use the absolute value for  X and Y. */
oDigs= digits();    a= oDigs + 5          /*�*save original digits;  add five digs.*/
g= (x+1) / y*2                            /*�*use this as the first guesstimate.   */
d= 5                                      /*�*start with 5 dec digs, saves CPU time*/
do  until d==a;      d= min(d + d, a) /*�*keep going as digits are increased.  */
numeric digits d;    f= d - 2         /*�*limit digits to  original digits + 5.*/
og=                                   /*�*use a non─guess for the old G (guess)*/
do forever;       gm= g**m         /*�*keep computing at the   Yth   root.  */
newV3= format( (m*g*gm + x)/(y*gm),,f) /*�*this is the nitty─gritty calculation.*/
if newV3=g  |  newV3=og  then leave        /*�*are we close enough yet?             */
og= g;            g= newV3             /*�*save guess ──► OG; set the new guess.*/
end   /*�*forever*/
end      /*�*until  */

g= g * sign(ox);  if oy<0  then  g= 1 / g /*�*adjust for original X sign; neg. root*/
numeric digits oDigs;      return   g / 1 /*�*normalize to original decimal digits.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Pythagorean-means\averages-pythagorean-means.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
