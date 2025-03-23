/*�*REXX program determines if the   STDIN   is a   terminal device   or  other.          */
signal on syntax                                 /*�*if syntax error, then jump ──► SYNTAX*/
say  'output device:'  testSTDIN()               /*�*displays   terminal   ──or──   other */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
testSTDIN: syntax.=1;  signal .; .: z.= sigl;  call linein ,2; ..:  syntax.= 0; return z..
/*�* [↑]  must/should be all on one line.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
syntax:  z..= 'other'                            /*�*when a SYNTAX error occurs, come here*/
if syntax.  then do                              /*�*are we handling  STDIN  thingy error?*/
if sigl==z.  then z..= 'terminal';    signal ..     /*�*is this a stdin ?*/
end                             /*�* [↑]   can't use a   RETURN   here.  */

/*�*    ···  handle other REXX syntax errors here  ···   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Check-output-device-is-a-terminal\check-output-device-is-a-terminal.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
