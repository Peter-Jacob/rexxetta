y=123                        /*�*define a REXX variable, value is 123  */
push y                       /*�*pushes   123   onto the stack.        */
pull g                       /*�*pops last value stacked & removes it. */
q=empty()                    /*�*invokes the  EMPTY  subroutine (below)*/
exit                         /*�*stick a fork in it, we're done.       */

empty: return queued()       /*�*subroutine returns # of stacked items.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stack\stack-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
