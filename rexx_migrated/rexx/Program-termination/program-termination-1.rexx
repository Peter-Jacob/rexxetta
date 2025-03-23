/*�*REXX program showing five ways to perform a REXX program termination. */

/*�*─────1st way────────────────────────────────────────────────────────*/
exit


/*�*─────2nd way────────────────────────────────────────────────────────*/
exit  (expression)     /*�*Note: the "expression" doesn't need parentheses*/
/*�*"expression"  is any REXX expression.          */


/*�*─────3rd way────────────────────────────────────────────────────────*/
return                 /*�*which returns to this program's invoker.  If   */
/*�*this is the main body  (and not a subroutine), */
/*�*the REXX interpreter terminates the program.   */


/*�*─────4th way────────────────────────────────────────────────────────*/
return (expression)    /*�* [See the note above concerning parentheses.]  */


/*�*─────5th way────────────────────────────────────────────────────────*/
/*�*control*/
/*�*   │   */        /*�*if there is no EXIT and program control "falls */
/*�*   │   */        /*�*through" to the "bottom" (end) of the program, */
/*�*   │   */        /*�*an   EXIT   is simulated and the program is    */
/*�*   │   */        /*�*terminated.                                    */
/*�*   ↓   */
/*�* e-o-f */        /*�* e-o-f   =   end-of-file.                      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Program-termination\program-termination-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
