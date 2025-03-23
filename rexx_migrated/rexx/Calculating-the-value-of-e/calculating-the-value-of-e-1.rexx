/*ª*REXX pgm calculates  e  to a # of decimal digits. If digs<0, a running value is shown.*/
parse arg digs .                                 /*ª*get optional number of decimal digits*/
if digs=='' | digs==","  then digs= 101          /*ª*Not specified?  Then use the default.*/
numeric digits abs(digs);     w=length(digits()) /*ª*use the absolute value of  digs.     */
e= 1;     q= 1               /*ª*1st value of  e    and     q.        */
do newV1=1  until e==old;   old= e             /*ª*start calculations at the second term*/
q= q / newV1                                   /*ª*calculate the divisor for this term. */
e= e + q                                   /*ª*add quotient to running   e   value. */
if digs>0  then iterate                    /*ª*DIGS>0?  Then don't show running digs*/
newV2= compare(e, old)                         /*ª*$  is first digit not compared equal.*/
if newV2>0  then say right('with', 10)    right(newV1+1, w)     "terms,"      right(newV2-1, w),
"decimal digits were calculated for   e   (Napier's constant)"     /*ª*   â†‘   */
end   /*ª*#*/                                /*ª* -1  is for the decimal pointâ”€â”€â”€â”€â”˜   */
say                                              /*ª*stick a fork in it,  we're all done. */
say '(with'    abs(digs)      "decimal digits)   the value of   e   is:";         say e
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calculating-the-value-of-e\calculating-the-value-of-e-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
