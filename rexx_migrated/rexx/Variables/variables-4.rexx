/*ª*REXX pgm to do a "bad" assignment  (with an unassigned REXX variable).*/

signal on noValue                      /*ª*usually, placed at pgm start.  */

xxx=aaaaa                              /*ª*tries to assign aaaaa â”€â”€â”€â–º xxx */

say xxx 'or somesuch'
exit

noValue:                               /*ª*this can be dressed up better. */
badLine  =sigl                         /*ª*REXX line number that failed.  */
badSource=sourceline(badLine)          /*ª*REXX source line Â·Â·Â·           */
badVar   =condition('D')               /*ª*REXX var name that's Â¬ defined.*/
say
say '*** error! ***'
say 'undefined variable' badvar "at REXX line number" badLine
say
say badSource
say
exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Variables\variables-4.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
