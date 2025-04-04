/*ͺ*REXX program demonstrates REXX special variables:  RC,  RESULT,  SIGL */
/*ͺ*line two.  */
/*ͺ*line three.*/             say copies('β',79)
rc=1/3                     /*ͺ*line four. */
signal youWho              /*ͺ*line five. */
myLoo='this got skipped'   /*ͺ*line six.  */
youwho:                    /*ͺ*line seven.*/
sep=copies('β', 9)         /*ͺ*line eight.*/
say sep  'SIGL=' sigl      /*ͺ*line nine. */
say sep  'REXX source statement' SIGL '=' sourceline(sigl)
say copies('β',79)
g=44
call halve  g
say sep  'rc='     rc
say sep  'result=' result
say copies('β',79)
h=66
hh=halve(h)
say sep  'rc='     rc
say sep  'result=' result
say sep  'hh='     hh
say copies('β',79)
'DIR  /ad  /b'                         /*ͺ*display the directories (Bare).*/
say sep  'rc='     rc
say sep  'result=' result
say copies('β',79)
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββHALVE subroutineββββββββββββββββββββ*/
halve: return arg(1) / 2               /*ͺ*a simple halving function.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Special-variables\special-variables-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
