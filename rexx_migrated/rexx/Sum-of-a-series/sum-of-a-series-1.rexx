/*ª*REXX program sums the first    N    terms of     1/(k**2),          k=1 â”€â”€â–º  N.       */
parse arg N D .                                  /*ª*obtain optional arguments from the CL*/
if N=='' | N==","  then N=1000                   /*ª*Not specified?  Then use the default.*/
if D=='' | D==","  then D=  60                   /*ª* "      "         "   "   "     "    */
numeric digits D                                 /*ª*use D digits (9 is the REXX default).*/
newV1=0                                              /*ª*initialize the sum to zero.          */
do k=1  for N                          /*ª* [â†“]  compute for   N   terms.       */
newV1=newV1  +  1/k**2                         /*ª*add a squared reciprocal to the sum. */
end   /*ª*k*/

say 'The sum of'     N     "terms is:"    newV1      /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-a-series\sum-of-a-series-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
