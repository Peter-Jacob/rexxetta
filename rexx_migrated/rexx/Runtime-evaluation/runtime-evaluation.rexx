/*ª*REXX program illustrates the ability to  execute code  entered  at runtime (from C.L.)*/
numeric digits 10000000                          /*ª*ten million digits should do it.     */
bee=51
stuff= 'bee=min(-2,44);  say 13*2 "[from inside the box.]";  abc=abs(bee)'
interpret stuff
say 'bee='  bee
say 'abc='  abc
say
/*ª* [â†“]  now, we hear from the user.    */
say 'enter an expression:'
pull expression
say
say 'expression entered is:'  expression
say

interpret '?='expression

say 'length of result='length(?)
say ' left 50 bytes of result='left(?,50)"Â·Â·Â·"
say 'right 50 bytes of result=Â·Â·Â·'right(?, 50)   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Runtime-evaluation\runtime-evaluation.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
