/*�*REXX program  demonstrates  the  use of    labels    and  also a   CALL   statement.  */
blarney = -0                                     /*�*just a blarney & balderdash statement*/
signal do_add                                    /*�*transfer program control to a  label.*/
ttt = sinD(30)                                   /*�*this REXX statement is never executed*/
/*�* [↓]   Note the case doesn't matter. */
DO_Add:                                          /*�*coming here from the SIGNAL statement*/

say 'calling the sub:  add.2.args'
call add.2.args 1, 7                             /*�*pass two arguments:   1   and a   7  */
say 'sum =' result                               /*�*display the result from the function.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
add.2.args: procedure;  parse arg x,y;   return x+y       /*�*first come, first served ···*/
add.2.args: say 'Whoa Nelly!! Has the universe run amok?' /*�*didactic, but never executed*/
add.2.args: return  arg(1) + arg(2)                       /*�*concise,   "    "       "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Scope-Function-names-and-labels\scope-function-names-and-labels.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
