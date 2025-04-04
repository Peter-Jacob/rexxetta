/*ͺ*REXX programs demonstrates shortβcircuit evaluation testing  (in an   IF   statement).*/
parse arg LO HI .                                /*ͺ*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO= -2                 /*ͺ*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=  2                 /*ͺ* "      "         "   "   "     "    */

do j=LO  to HI                          /*ͺ*process from the  low  to  the  high.*/
x=a(j)  &  b(j)                         /*ͺ*compute  function A  and  function B */
y=a(j)  |  b(j)                         /*ͺ*   "         "    "   or      "    " */
if \y  then y=b(j)                      /*ͺ*   "         "    B   (for negation).*/
say  copies('β', 30)        '  x=' || x            '  y='y                '  j='j
say
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a: say '      A  entered with:'  arg(1);    return abs( arg(1) // 2)   /*ͺ*1=odd, 0=even  */
b: say '      B  entered with:'  arg(1);    return arg(1) < 0          /*ͺ*1=neg, 0=if not*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Short-circuit-evaluation\short-circuit-evaluation.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
