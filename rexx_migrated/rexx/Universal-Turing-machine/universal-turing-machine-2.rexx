/*�*REXX program executes a  Turing machine  based on   initial state,  tape, and rules.  */
state = 'a'                                      /*�*the initial  Turing machine  state.  */
term  = 'halt'                                   /*�*a state that is used for a  halt.    */
blank =  0                                       /*�*this character is a  "true"  blank.  */
call Turing_rule  'a 0 1 right b'                /*�*define a rule for the Turing machine.*/
call Turing_rule  'a 1 1 left  c'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'b 0 1 left  a'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'b 1 1 right b'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'c 0 1 left  b'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'c 1 1 stay  halt'             /*�*   "   "   "   "   "     "      "    */
call Turing_init                                 /*�*initialize the tape to some string(s)*/
call TM                                          /*�*go and invoke the  Turning machine.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
TM: ∙∙∙
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Universal-Turing-machine\universal-turing-machine-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
