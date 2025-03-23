/*�*REXX program calculates and displays   factorions   in  bases  nine ───► twelve.      */
parse arg LOb HIb lim .                          /*�*obtain optional arguments from the CL*/
if LOb=='' | LOb==","  then LOb=       9         /*�*Not specified?  Then use the default.*/
if HIb=='' | HIb==","  then HIb=      12         /*�* "      "         "   "   "      "   */
if lim=='' | lim==","  then lim= 1500000  -  1   /*�* "      "         "   "   "      "   */

do fact=0  to HIb;   newV1.fact= newV4(fact)           /*�*use memoization for factorials.      */
end   /*�*fact*/

do base=LOb  to  HIb                           /*�*process all the required bases.      */
newV2= 1 2                                         /*�*initialize the list  (@)  to  1 & 2. */
do j=3  for lim-2;  newV3= 0               /*�*initialize the sum   ($)  to  zero.  */
t= j   /*�*define the target  (for the sum !'s).*/
do until t==0;    d= t // base      /*�*obtain a "digit".*/
newV3= newV3 + newV1.d        /*�*add  !(d) to sum.*/
t= t % base       /*�*get a new target.*/
end   /*�*until*/
if newV3==j  then newV2= newV2 j                   /*�*Good factorial sum? Then add to list.*/
end   /*�*i*/
say
say 'The factorions for base '      right( base, length(HIb) )        " are: "         newV2
end   /*�*base*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV4: procedure; parse arg x;  newV4=1;    do j=2  to x;  newV4=newV4*j;  end;   return newV4  /*�*factorials*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factorions\factorions.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
