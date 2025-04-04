/*ͺ*REXX program calculates and displays K-fact (multifactorial) of non-negative integers.*/
numeric digits 1000                              /*ͺ*get ka-razy with the decimal digits. */
parse arg num deg .                              /*ͺ*get optional arguments from the C.L. */
if num=='' | num==","   then num=15              /*ͺ*Not specified?  Then use the default.*/
if deg=='' | deg==","   then deg=10              /*ͺ* "      "         "   "   "     "    */
say 'βββshowing multiple factorials (1 βββΊ'     deg")  for numbers  1 βββΊ"      num
say
do d=1  for deg                             /*ͺ*the factorializing (degree)  of  !'s.*/
newV1=                                          /*ͺ*the list of factorials  (so far).    */
do f=1  for num                      /*ͺ* βββ perform a ! from  1 ββββΊ number.*/
newV1=newV1  Kfact(f, d)                     /*ͺ*build a  list  of factorial products.*/
end   /*ͺ*f*/                          /*ͺ* [β]    D   can default to  unity.   */

say right('n'copies("!", d), 1+deg)    right('['d"]", 2+length(num) )':'     newV1
end          /*ͺ*d*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Kfact: procedure; newV2=1;   do j=arg(1)  to 2  by -word(arg(2) 1,1);  newV2=newV2*j;  end;   return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multifactorial\multifactorial.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
