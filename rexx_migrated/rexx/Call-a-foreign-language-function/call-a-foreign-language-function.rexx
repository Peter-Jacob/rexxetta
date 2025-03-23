/*ª*REXX program  calls (invoke)  a "foreign"  (non-REXX)  language routine/program.      */

cmd = "MODE"                                     /*ª*define the command that is to be used*/
opts= 'CON:  CP  /status'                        /*ª*define the options to be used for cmd*/

address  'SYSTEM'  cmd  opts                     /*ª*invoke a cmd via the SYSTEM interface*/

/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Call-a-foreign-language-function\call-a-foreign-language-function.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
