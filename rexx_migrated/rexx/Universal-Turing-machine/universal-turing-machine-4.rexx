/*�*REXX program executes a  Turing machine  based on   initial state,  tape, and rules.  */
state = 'A'                                      /*�*the initial  Turing machine  state.  */
term  = 'halt'                                   /*�*a state that is used for the  halt.  */
blank =  0                                       /*�*this character is a  "true"  blank.  */
call Turing_rule  'A 1 1 right A'                /*�*define a rule for the Turing machine.*/
call Turing_rule  'A 2 3 right B'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'A 0 0 left  E'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'B 1 1 right B'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'B 2 2 right B'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'B 0 0 left  C'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'C 1 2 left  D'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'C 2 2 left  C'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'C 3 2 left  E'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'D 1 1 left  D'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'D 2 2 left  D'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'D 3 1 right A'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'E 1 1 left  E'                /*�*   "   "   "   "   "     "      "    */
call Turing_rule  'E 0 0 right halt'             /*�*   "   "   "   "   "     "      "    */
call Turing_init   1 2 2 1 2 2 1 2 1 2 1 2 1 2   /*�*initialize the tape to some string(s)*/
call TM                                          /*�*go and invoke the Turning machine.   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
TM: ∙∙∙
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Universal-Turing-machine\universal-turing-machine-4.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
