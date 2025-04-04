/*ช*REXX program  demonstrates  the  use of    labels    and  also a   CALL   statement.  */
blarney = -0                                     /*ช*just a blarney & balderdash statement*/
signal do_add                                    /*ช*transfer program control to a  label.*/
ttt = sinD(30)                                   /*ช*this REXX statement is never executed*/
/*ช* [โ]   Note the case doesn't matter. */
DO_Add:                                          /*ช*coming here from the SIGNAL statement*/

say 'calling the sub:  add.2.args'
call add.2.args 1, 7                             /*ช*pass two arguments:   1   and a   7  */
say 'sum =' result                               /*ช*display the result from the function.*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
add.2.args: procedure;  parse arg x,y;   return x+y       /*ช*first come, first served ยทยทยท*/
add.2.args: say 'Whoa Nelly!! Has the universe run amok?' /*ช*didactic, but never executed*/
add.2.args: return  arg(1) + arg(2)                       /*ช*concise,   "    "       "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Scope-Function-names-and-labels\scope-function-names-and-labels.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
