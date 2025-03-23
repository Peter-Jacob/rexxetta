/*ª*REXX pgm finds N terms of the Sylvester's sequence & the sum of the their reciprocals.*/
parse arg n .                                    /*ª*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 10                    /*ª*Not specified?  Then use the default.*/
numeric digits max(9, 2**(n-7) * 13 + 1)         /*ª*calculate how many dec. digs we need.*/
newV1.0= 2                                           /*ª*the value of the 1st Sylvester number*/
newV2= 0
do j=0  for n;      jm= j - 1            /*ª*calculate the Sylvester sequence.    */
if j>0  then newV1.j= newV1.jm**2 - newV1.jm + 1     /*ª*calculate  a  Sylvester sequence num.*/
say 'Sylvester('j") â”€â”€â–º "   newV1.j          /*ª*display the Sylvester index & number.*/
newV2= newV2   +   1 / newV1.j                       /*ª*add its reciprocal to the recip. sum.*/
end   /*ª*j*/
say                                              /*ª*stick a fork in it,  we're all done. */
numeric digits digits() - 1
say 'sum of the first '   n   " reciprocals using"   digits()   'decimal digits: '   newV2 / 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sylvesters-sequence\sylvesters-sequence.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
