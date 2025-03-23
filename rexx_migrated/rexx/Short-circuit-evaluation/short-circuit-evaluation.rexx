/*�*REXX programs demonstrates short─circuit evaluation testing  (in an   IF   statement).*/
parse arg LO HI .                                /*�*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO= -2                 /*�*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI=  2                 /*�* "      "         "   "   "     "    */

do j=LO  to HI                          /*�*process from the  low  to  the  high.*/
x=a(j)  &  b(j)                         /*�*compute  function A  and  function B */
y=a(j)  |  b(j)                         /*�*   "         "    "   or      "    " */
if \y  then y=b(j)                      /*�*   "         "    B   (for negation).*/
say  copies('═', 30)        '  x=' || x            '  y='y                '  j='j
say
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
a: say '      A  entered with:'  arg(1);    return abs( arg(1) // 2)   /*�*1=odd, 0=even  */
b: say '      B  entered with:'  arg(1);    return arg(1) < 0          /*�*1=neg, 0=if not*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Short-circuit-evaluation\short-circuit-evaluation.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
