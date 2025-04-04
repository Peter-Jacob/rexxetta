/*ͺ*REXX program determines if a   specified point   is within a   specified triangle.    */
parse arg p a b c .                              /*ͺ*obtain optional arguments from the CL*/
if p=='' | p==","  then p= '(0,0)'               /*ͺ*Not specified?  Then use the default.*/
if a=='' | a==","  then a= '(1.5,2.4)'           /*ͺ* "      "         "   "   "     "    */
if b=='' | b==","  then b= '(5.1,-3.1)'          /*ͺ* "      "         "   "   "     "    */
if c=='' | c==","  then c= '(-3.8,0.5)'          /*ͺ* "      "         "   "   "     "    */
if  ?(p, a, b, c)  then newV3= ' is '                /*ͺ*Is the point  inside the triangle ?  */
else newV3= " isn't "             /*ͺ* "  "    "   outside  "      "       */
say 'point'   p    newV3    " within the triangle "      a     ','       b       ","       c
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cert: parse arg z,W; if datatype(z,'N')  then return z; call serr z /*ͺ*return coΓΆrdinate.*/
serr: say W 'data point '  z  " isn't numeric or missing."; exit 13 /*ͺ*tell error message*/
x: procedure; parse arg "(" x ','      ;  return cert(x,"X")  /*ͺ*return the X coΓΆrdinate.*/
y: procedure; parse arg       ',' y ")";  return cert(y,"Y")  /*ͺ*   "    "  Y      "     */
$: parse arg aa,bb,cc;  return (x(aa)-x(cc)) *(y(bb)-y(cc)) - (x(bb)-x(cc)) *(y(aa)-y(cc))
?: #1=$(p,a,b); newV1=$(p,b,c); newV2=$(p,c,a); return (#1>=0&newV1>=0&newV2>=0) | (#1<=0&newV1<=0&newV2<=0)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-if-a-point-is-within-a-triangle\find-if-a-point-is-within-a-triangle.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
