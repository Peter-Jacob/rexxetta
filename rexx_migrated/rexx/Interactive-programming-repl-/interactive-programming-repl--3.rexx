/*�*REXX program demonstrates  interactive programming  by using a  function [F].         */
say '══════════════════ enter the function  F  with three comma-separated arguments:'
parse pull funky
interpret  'SAY'  funky
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
f:  return arg(1) || copies(arg(3),2) || arg(2)  /*�*return the required string to invoker*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Interactive-programming-repl-\interactive-programming-repl--3.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
