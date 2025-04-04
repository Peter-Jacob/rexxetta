/*ͺ*REXX program determines if the   STDIN   is a   terminal device   or  other.          */
signal on syntax                                 /*ͺ*if syntax error, then jump βββΊ SYNTAX*/
say  'output device:'  testSTDIN()               /*ͺ*displays   terminal   ββorββ   other */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
testSTDIN: syntax.=1;  signal .; .: z.= sigl;  call linein ,2; ..:  syntax.= 0; return z..
/*ͺ* [β]  must/should be all on one line.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
syntax:  z..= 'other'                            /*ͺ*when a SYNTAX error occurs, come here*/
if syntax.  then do                              /*ͺ*are we handling  STDIN  thingy error?*/
if sigl==z.  then z..= 'terminal';    signal ..     /*ͺ*is this a stdin ?*/
end                             /*ͺ* [β]   can't use a   RETURN   here.  */

/*ͺ*    Β·Β·Β·  handle other REXX syntax errors here  Β·Β·Β·   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Check-output-device-is-a-terminal\check-output-device-is-a-terminal.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
