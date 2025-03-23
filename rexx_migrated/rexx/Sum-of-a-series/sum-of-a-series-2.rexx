/*ª*REXX program sums the first    N    terms o f    1/(k**2),          k=1 â”€â”€â–º  N.       */
parse arg N D .                                  /*ª*obtain optional arguments from the CL*/
if N=='' | N==","  then N=1000                   /*ª*Not specified?  Then use the default.*/
if D=='' | D==","  then D=  60                   /*ª* "      "         "   "   "     "    */
numeric digits D                                 /*ª*use D digits (9 is the REXX default).*/
w=length(N)                                      /*ª*W   is used for aligning the output. */
newV1=0                                              /*ª*initialize the sum to zero.          */
do k=1  for N                              /*ª* [â†“]  compute for   N   terms.       */
newV1=newV1  +  1/k**2                             /*ª*add a squared reciprocal to the sum. */
parse var k s 2 m '' -1 e                  /*ª*obtain the start and end decimal digs*/
if e\==0  then iterate                     /*ª*does K  end  with the dec digit  0 ? */
if s\==1  then iterate                     /*ª*  "  " start   "   "   "    "    1 ? */
if m\=0   then iterate                     /*ª*  "  " middle  contain any non-zero ?*/
if k==N   then iterate                     /*ª*  "  " equal N, then skip running sum*/
say  'The sum of'   right(k,w)     "terms is:"  newV1         /*ª*display a running sum.*/
end   /*ª*k*/
say                                                             /*ª*a blank line for sep. */
say        'The sum of'   right(k-1,w)   "terms is:"  newV1         /*ª*display the final sum.*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-a-series\sum-of-a-series-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
