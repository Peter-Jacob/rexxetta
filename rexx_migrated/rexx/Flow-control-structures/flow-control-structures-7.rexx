...
signal on syntax
...
y=4 - 4
x=66
say x/y                  /*ͺ*divide x by y.*/
say "yup, that's a divide by zero, by gum."
exit

syntax: say

/*ͺ* We can now possibly do some repair work , but most people trap */
/*ͺ* the condition, display where it happened, the REXX sourceline  */
/*ͺ* (the actual REXX statement),  which condition was triggered,   */
/*ͺ* display any other pertinent REXX variables, which line in the  */
/*ͺ* REXX program, and then (usually) exit with some kind of error  */
/*ͺ* message and error code indicator.                              */
/*ͺ* Note:  the "name" of the REXX program isn't quite accurate,    */
/*ͺ* rather, it is the name that was invoked (called by), which may */
/*ͺ* be different name than the actual program being executed.      */

say 'ββββββββββββββββββββββerror!βββββββββββββββββββββββββ'
say 'that division (above) will cause control to get here.'
parse source . . fid .
say;  say  'REXX raised a SYNTAX error in program:' fid
say;  say  'it occurred on line' sigl
say;  say  'the REXX statement is:'     /*ͺ*put it on separate line.*/
say  sourceline(sigl)
say;  say  'which code:' condition('C') "error"
say;  say  'error code:' condition('D')
say;  say  "Moral: don't do that."
exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flow-control-structures\flow-control-structures-7.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
