/*�*REXX program  creates  two exceptions and demonstrates how to  handle  (catch)  them. */
call foo                                         /*�*invoke the  FOO  function  (below).  */
say 'The REXX mainline program has completed.'   /*�*indicate that Elroy was here.        */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
foo:   call bar;   call bar                      /*�*invoke  BAR  function  twice.        */
return 0                                  /*�*return a zero to the invoker.        */
/*�*the 1st  U0  in REXX program is used.*/
U0:    say 'exception U0 caught in FOO'          /*�*handle the  U0  exception.           */
return -2                                 /*�*return to the invoker.               */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bar:   call baz                                  /*�*have BAR function invoke BAZ function*/
return 0                                  /*�*return a zero to the invoker.        */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
baz:   if symbol('BAZ#')=='LIT'  then baz#=0     /*�*initialize the first BAZ invocation #*/
baz# = baz#+1                             /*�*bump the BAZ invocation number by 1. */
if baz#==1  then signal U0                /*�*if first  invocation, then raise  U0 */
if baz#==2  then signal U1                /*�* " second      "        "    "    U1 */
return 0                                  /*�*return a   0  (zero)  to the invoker.*/
/*�* [↓]  this  U0 subroutine is ignored.*/
U0:    return -1                                 /*�*handle exception if not caught.      */
U1:    return -1                                 /*�*   "       "      "  "     "         */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Exceptions-Catch-an-exception-thrown-in-a-nested-call\exceptions-catch-an-exception-thrown-in-a-nested-call.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
