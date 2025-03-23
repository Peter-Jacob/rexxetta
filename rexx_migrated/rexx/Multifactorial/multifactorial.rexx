/*�*REXX program calculates and displays K-fact (multifactorial) of non-negative integers.*/
numeric digits 1000                              /*�*get ka-razy with the decimal digits. */
parse arg num deg .                              /*�*get optional arguments from the C.L. */
if num=='' | num==","   then num=15              /*�*Not specified?  Then use the default.*/
if deg=='' | deg==","   then deg=10              /*�* "      "         "   "   "     "    */
say '═══showing multiple factorials (1 ──►'     deg")  for numbers  1 ──►"      num
say
do d=1  for deg                             /*�*the factorializing (degree)  of  !'s.*/
newV1=                                          /*�*the list of factorials  (so far).    */
do f=1  for num                      /*�* ◄── perform a ! from  1 ───► number.*/
newV1=newV1  Kfact(f, d)                     /*�*build a  list  of factorial products.*/
end   /*�*f*/                          /*�* [↑]    D   can default to  unity.   */

say right('n'copies("!", d), 1+deg)    right('['d"]", 2+length(num) )':'     newV1
end          /*�*d*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Kfact: procedure; newV2=1;   do j=arg(1)  to 2  by -word(arg(2) 1,1);  newV2=newV2*j;  end;   return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multifactorial\multifactorial.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
