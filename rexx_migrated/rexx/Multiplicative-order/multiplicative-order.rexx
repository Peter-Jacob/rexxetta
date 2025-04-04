/*�*REXX pgm computes multiplicative order of a minimum integer  N  such that  a^n mod m≡1*/
wa= 0;  wm= 0     /*�*       ═a═   ══m══     */    /*�*maximum widths of the A and M values.*/
newV1.=.;                newV1.1=   3      10
newV1.2=  37    1000
newV1.3=  37   10000
newV1.4=  37    3343
newV1.5=  37    3344
newV1.6=   2    1000
pad= left('', 9)
d= 500                                           /*�*use 500 decimal digits for a starter.*/
do w=1  for 2                               /*�*when W≡1, find max widths of A and M.*/
do j=1  while newV1.j\==.;         parse var  newV1.j     a  .  1  r  m  ,  n
if w==1  then do;  wa= max(wa, length(a) );     wm= max(wm, length(m) );    iterate
end
if m//a==0  then n= ' [solution not possible]'     /*�*test co─prime for  A and B. */
numeric digits d                          /*�*start with  100  decimal digits.     */
if n==''  then do n= 2;    p= r * a       /*�*compute product──may have an exponent*/
parse  var  p  'E'  newV2      /*�*try to extract the exponent from  P. */
if newV2\==''   then do;  numeric digits newV2+d  /*�*bump the decimal digs.*/
p=r*a               /*�*recalculate integer P.*/
end
if p//m==1  then leave     /*�*now, perform the nitty─gritty modulo.*/
r= p                       /*�*assign product to R for next multiply*/
end   /*�*n*/                /*�* [↑]    //   is really  ÷  remainder.*/
say pad  'a='  right(a,wa)  pad  "m=" right(m,wm)  pad  'multiplicative order:'   n
end   /*�*j*/
end     /*�*w*/                               /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multiplicative-order\multiplicative-order.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
