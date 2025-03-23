/*�*REXX program demonstrates  interactive programming  by using a  function [F].         */
say f('Rosetta',  "Code",  ':')
say f('The definition of a trivial program is ',  " one that has no bugs.",  '───')
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
f:  return arg(1) || copies(arg(3),2) || arg(2)  /*�*return the required string to invoker*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Interactive-programming-repl-\interactive-programming-repl--2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
