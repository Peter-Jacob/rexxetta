/*ª*REXX program demonstrates the use of dynamic variable names & setting a val.*/
parse arg newVar newValue
say 'Arguments as they were entered via the command line: '   newVar    newValue
say
call value newVar, newValue
say 'The newly assigned value (as per the VALUE bif)------' newVar value(newVar)
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dynamic-variable-names\dynamic-variable-names.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
