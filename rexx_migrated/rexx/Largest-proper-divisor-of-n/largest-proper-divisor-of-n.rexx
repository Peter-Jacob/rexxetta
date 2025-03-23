/*�*REXX program finds the largest proper divisors of all numbers  (up to a given limit). */
parse arg n cols .                               /*�*obtain optional argument from the CL.*/
if    n=='' |    n==","  then    n= 101          /*�*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=  10          /*�* "      "         "   "   "     "    */
w= length(n)  +  1                               /*�*W:  the length of any output column. */
newV1 = "largest proper divisor of  N,  where  N  < "       n
idx = 1                                          /*�*initialize the index (output counter)*/
say ' index │'center(newV1,  1 + cols*(w+1)     ) /*�*display the title for the output.    */
say '───────┼'center(""  ,  1 + cols*(w+1), '─') /*�*   "     "   sep   "   "     "       */
newV2=                                               /*�*a list of largest proper divs so far.*/
do j=1  for n-1;  newV2= newV2 right(LPDIV(j), w)   /*�*add a largest proper divisor ──► list*/
if j//cols\==0  then iterate                /*�*have we populated a line of output?  */
say center(idx, 7)'│'  substr(newV2, 2);   newV2=   /*�*display what we have so far  (cols). */
idx= idx + cols                             /*�*bump the  index  count for the output*/
end   /*�*j*/

if newV2\==''  then say center(idx, 7)"│"  substr(newV2, 2)  /*�*possible display residual output.*/
say '───────┴'center(""  ,  1 + cols*(w+1), '─') /*�*display the foot separator.          */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LPDIV:  procedure; parse arg x;  if x<4  then return 1   /*�*obtain  X;  test if  X < 4.  */
odd= x // 2;    beg= x % 2                       /*�*use BEG as the first divisor.*/
if odd  then if beg//2==0  then beg= beg -  1    /*�*Is X odd?  Then make BEG odd.*/
do k=beg  by -1-odd           /*�*begin at halfway point and decrease. */
if x//k==0  then return k     /*�*Remainder=0?  Got largest proper div.*/
end   /*�*k*/
return 1     /*�*If we get here,  then  X  is a prime.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Largest-proper-divisor-of-n\largest-proper-divisor-of-n.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
