/*�*REXX program implements a simple  ASSERT  function;  the expression can be compound.  */
a =  1                                         /*�*assign a value to the   A   variable.*/
b =  -2                                        /*�*   "   "   "    "  "    B       "    */
gee =  7.00                                      /*�*   "   "   "    "  "   GEE      "    */
zee = 26                                         /*�*   "   "   "    "  "   ZEE      "    */

call assert (a = 1)
call assert (b > 0)
call assert (gee = 7)
call assert (zee = a  &  zee>b)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
assert: if arg(1)=1  then return;    parse value sourceline(sigl)  with x;  say
say '===== ASSERT failure in REXX line' sigl", the statement is:";  say '====='  x
say;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Assertions\assertions-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
