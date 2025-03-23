/*�*REXX program sums the first    N    terms of     1/(k**2),          k=1 ──►  N.       */
parse arg N D .                                  /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=1000                   /*�*Not specified?  Then use the default.*/
if D=='' | D==","  then D=  60                   /*�* "      "         "   "   "     "    */
numeric digits D                                 /*�*use D digits (9 is the REXX default).*/
newV1=0                                              /*�*initialize the sum to zero.          */
do k=1  for N                          /*�* [↓]  compute for   N   terms.       */
newV1=newV1  +  1/k**2                         /*�*add a squared reciprocal to the sum. */
end   /*�*k*/

say 'The sum of'     N     "terms is:"    newV1      /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-a-series\sum-of-a-series-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
