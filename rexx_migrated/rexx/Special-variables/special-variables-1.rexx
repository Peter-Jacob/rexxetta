/*�*REXX program demonstrates REXX special variables:  RC,  RESULT,  SIGL */
/*�*line two.  */
/*�*line three.*/             say copies('═',79)
rc=1/3                     /*�*line four. */
signal youWho              /*�*line five. */
myLoo='this got skipped'   /*�*line six.  */
youwho:                    /*�*line seven.*/
sep=copies('─', 9)         /*�*line eight.*/
say sep  'SIGL=' sigl      /*�*line nine. */
say sep  'REXX source statement' SIGL '=' sourceline(sigl)
say copies('═',79)
g=44
call halve  g
say sep  'rc='     rc
say sep  'result=' result
say copies('═',79)
h=66
hh=halve(h)
say sep  'rc='     rc
say sep  'result=' result
say sep  'hh='     hh
say copies('═',79)
'DIR  /ad  /b'                         /*�*display the directories (Bare).*/
say sep  'rc='     rc
say sep  'result=' result
say copies('═',79)
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────HALVE subroutine────────────────────*/
halve: return arg(1) / 2               /*�*a simple halving function.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Special-variables\special-variables-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
