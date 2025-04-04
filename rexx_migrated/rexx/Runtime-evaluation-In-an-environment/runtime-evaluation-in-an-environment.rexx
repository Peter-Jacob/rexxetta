/*ͺ*REXX program demonstrates a runβtime evaluation of an expression (entered at runβtime)*/
say 'ββββββββ enter the 1st expression to be evaluated:'

parse pull x                                     /*ͺ*obtain an expression from the console*/
y.1= x                                           /*ͺ*save the provided expression for  X. */
say

say 'ββββββββ enter the 2nd expression to be evaluated:'

parse pull x                                     /*ͺ*obtain an expression from the console*/
y.2= x                                           /*ͺ*save the provided expression for  X. */

say
say 'ββββββββ  1st expression entered is: '  y.1
say 'ββββββββ  2nd expression entered is: '  y.2
say

interpret 'say "ββββββββ value of the difference is: "' y.2  "-"  '('y.1")"  /*ͺ* βββββββ */
/*ͺ*       β */
/*ͺ*       β */
/*ͺ*subtract 1st exp. from the 2ndβββΊβββ */

drop x                                           /*ͺ*X var. is no longer a global variable*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Runtime-evaluation-In-an-environment\runtime-evaluation-in-an-environment.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
