/*�*REXX pgm displays the name (& possible path) of the REXX program name.*/
parse version newV2
parse source newV3 newV1 newV4

say right(newV2 '◄──►' space(arg(1) arg(2)), 79, '─')   /*�*show title.*/
say "     REXX's name of system being used:"  newV3
say '     how the REXX program was invoked:'  newV1
say '    name of the REXX program and path:'  newV4

if arg()>1  then return 0              /*�*don't let this program recurse.*/
/*�*Mama said that cursing is a sin*/
/*�*invoke ourself with a  2nd arg.*/
call prog_nam  , 'subroutine'          /*�*call ourself as a  subroutine. */
zz = prog_nam( , 'function')           /*�*  "     "     " "  function.   */
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Program-name\program-name-5.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
