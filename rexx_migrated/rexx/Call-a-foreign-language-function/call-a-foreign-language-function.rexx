/*�*REXX program  calls (invoke)  a "foreign"  (non-REXX)  language routine/program.      */

cmd = "MODE"                                     /*�*define the command that is to be used*/
opts= 'CON:  CP  /status'                        /*�*define the options to be used for cmd*/

address  'SYSTEM'  cmd  opts                     /*�*invoke a cmd via the SYSTEM interface*/

/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-foreign-language-function\call-a-foreign-language-function.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
