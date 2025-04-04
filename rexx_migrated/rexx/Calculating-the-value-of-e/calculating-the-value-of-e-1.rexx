/*ͺ*REXX pgm calculates  e  to a # of decimal digits. If digs<0, a running value is shown.*/
parse arg digs .                                 /*ͺ*get optional number of decimal digits*/
if digs=='' | digs==","  then digs= 101          /*ͺ*Not specified?  Then use the default.*/
numeric digits abs(digs);     w=length(digits()) /*ͺ*use the absolute value of  digs.     */
e= 1;     q= 1               /*ͺ*1st value of  e    and     q.        */
do newV1=1  until e==old;   old= e             /*ͺ*start calculations at the second term*/
q= q / newV1                                   /*ͺ*calculate the divisor for this term. */
e= e + q                                   /*ͺ*add quotient to running   e   value. */
if digs>0  then iterate                    /*ͺ*DIGS>0?  Then don't show running digs*/
newV2= compare(e, old)                         /*ͺ*$  is first digit not compared equal.*/
if newV2>0  then say right('with', 10)    right(newV1+1, w)     "terms,"      right(newV2-1, w),
"decimal digits were calculated for   e   (Napier's constant)"     /*ͺ*   β   */
end   /*ͺ*#*/                                /*ͺ* -1  is for the decimal pointβββββ   */
say                                              /*ͺ*stick a fork in it,  we're all done. */
say '(with'    abs(digs)      "decimal digits)   the value of   e   is:";         say e
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calculating-the-value-of-e\calculating-the-value-of-e-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
