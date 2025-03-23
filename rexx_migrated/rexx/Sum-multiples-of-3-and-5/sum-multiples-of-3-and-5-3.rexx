/*�*REXX program counts all  integers  from  1 ──► N─1   that are multiples of  3  or  5. */
parse arg N t .                                  /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 1000                  /*�*Not specified?  Then use the default.*/
if t=='' | t==","  then t=    1                  /*�* "      "         "   "   "      "   */
numeric digits 1000;    w= 2 + length(t)         /*�*W: used for formatting 'e' part of Y.*/
say 'The sum of all positive integers that are a multiple of  3  and  5  are:'
say                                              /*�* [↓]  change the format/look of nE+nn*/
do t;      parse value format(N,2,1,,0) 'E0'  with  m 'E' newV1 .   /*�*get the exponent.*/
y= right( (m/1)'e'  ||  (newV1+0), w)"-1"       /*�*this fixes a bug in a certain REXX.  */
z= n - 1;        if t==1  then y= z         /*�*handle a special case of a one─timer.*/
say 'integers from 1 ──►'    y    " is "    sumDiv(z,3) + sumDiv(z,5) - sumDiv(z,3*5)
N= N'0'                                     /*�*fast *10 multiply for next iteration.*/
end   /*�*t*/                                 /*�* [↑]  simply append a zero to the num*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumDiv: procedure;  parse arg x,d;       newV2= x % d;              return d * newV2 * (newV2+1) % 2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-multiples-of-3-and-5\sum-multiples-of-3-and-5-3.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
