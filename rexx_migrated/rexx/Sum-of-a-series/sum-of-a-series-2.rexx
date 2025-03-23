/*�*REXX program sums the first    N    terms o f    1/(k**2),          k=1 ──►  N.       */
parse arg N D .                                  /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=1000                   /*�*Not specified?  Then use the default.*/
if D=='' | D==","  then D=  60                   /*�* "      "         "   "   "     "    */
numeric digits D                                 /*�*use D digits (9 is the REXX default).*/
w=length(N)                                      /*�*W   is used for aligning the output. */
newV1=0                                              /*�*initialize the sum to zero.          */
do k=1  for N                              /*�* [↓]  compute for   N   terms.       */
newV1=newV1  +  1/k**2                             /*�*add a squared reciprocal to the sum. */
parse var k s 2 m '' -1 e                  /*�*obtain the start and end decimal digs*/
if e\==0  then iterate                     /*�*does K  end  with the dec digit  0 ? */
if s\==1  then iterate                     /*�*  "  " start   "   "   "    "    1 ? */
if m\=0   then iterate                     /*�*  "  " middle  contain any non-zero ?*/
if k==N   then iterate                     /*�*  "  " equal N, then skip running sum*/
say  'The sum of'   right(k,w)     "terms is:"  newV1         /*�*display a running sum.*/
end   /*�*k*/
say                                                             /*�*a blank line for sep. */
say        'The sum of'   right(k-1,w)   "terms is:"  newV1         /*�*display the final sum.*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-a-series\sum-of-a-series-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
