/*�*REXX program sums the first    N    terms of     1/(k**2),          k=1 ──►  N.       */
parse arg N D .                                  /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=1000                   /*�*Not specified?  Then use the default.*/
if D=='' | D==","  then D=  60                   /*�* "      "         "   "   "     "    */
numeric digits D                                 /*�*use D digits (9 is the REXX default).*/
w=length(N)                                      /*�*W   is used for aligning the output. */
newV1=0                                              /*�*initialize the sum to zero.          */
old=1                                            /*�*the new sum to compared to the old.  */
p=0                                              /*�*significant decimal precision so far.*/
do k=1  for N                               /*�* [↓]  compute for   N   terms.       */
newV1=newV1  +  1/k**2                              /*�*add a squared reciprocal to the sum. */
c=compare(newV1,old)                            /*�*see how we're doing with precision.  */
if c>p  then do                             /*�*Got another significant decimal dig? */
say 'The significant sum of'  right(k,w)      "terms is:"      left(newV1,c)
p=c                            /*�*use the new significant precision.   */
end                            /*�* [↑]  display significant part of sum*/
old=newV1                                       /*�*use "old" sum for the next compare.  */
end   /*�*k*/
say                                              /*�*display blank line for the separator.*/
say 'The sum of'   right(N,w)    "terms is:"     /*�*display the  sum's  preamble line.   */
say newV1                                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-a-series\sum-of-a-series-3.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
