/*�*REXX pgm (pathological FP problem): the Siegfried Rump's example (problem dated 1988).*/
parse arg digs show .                            /*�*obtain optional arguments from the CL*/
if digs=='' | digs==","  then digs=150           /*�*Not specified?  Then use the default.*/
if show=='' | show==","  then show= 20           /*�* "      "         "   "   "     "    */
numeric digits digs                              /*�*have REXX use "digs" decimal digits. */
a= 77617.0                                       /*�*initialize  A  to it's defined value.*/
b= 33096.0                                       /*�*     "      B   "   "     "      "   */
/*�*display SHOW digits past the dec. pt.*/
say 'f(a,b)='    format(   f(a,b), , show)       /*�*display result from the  F  function.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
f:  procedure; parse arg a,b;  return  333.75* b**6   +   a**2 * (11* a**2* b**2  -  b**6,
- 121*b**4  - 2)     +     5.5*b**8    +    a / (2*b)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pathological-floating-point-problems\pathological-floating-point-problems-3.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
