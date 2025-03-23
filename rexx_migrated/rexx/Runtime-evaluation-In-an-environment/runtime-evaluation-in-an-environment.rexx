/*�*REXX program demonstrates a run─time evaluation of an expression (entered at run─time)*/
say '──────── enter the 1st expression to be evaluated:'

parse pull x                                     /*�*obtain an expression from the console*/
y.1= x                                           /*�*save the provided expression for  X. */
say

say '──────── enter the 2nd expression to be evaluated:'

parse pull x                                     /*�*obtain an expression from the console*/
y.2= x                                           /*�*save the provided expression for  X. */

say
say '────────  1st expression entered is: '  y.1
say '────────  2nd expression entered is: '  y.2
say

interpret 'say "──────── value of the difference is: "' y.2  "-"  '('y.1")"  /*�* ◄─────┐ */
/*�*       │ */
/*�*       │ */
/*�*subtract 1st exp. from the 2nd──►──┘ */

drop x                                           /*�*X var. is no longer a global variable*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Runtime-evaluation-In-an-environment\runtime-evaluation-in-an-environment.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
