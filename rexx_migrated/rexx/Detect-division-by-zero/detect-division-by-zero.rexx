/*�*REXX program  demonstrates  detection  and handling  division by zero.                */
signal on syntax                                 /*�*handle all REXX syntax errors.       */
x = sourceline()                                 /*�*being cute, x=is the size of this pgm*/
y = x - x                                        /*�*setting to zero the obtuse way.      */
z = x / y                                        /*�*this'll trigger it,  furrrr shurrre. */
exit                                             /*�*We're kaput.   Ja vohl !             */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:    if rc==42  then do;  say                 /*�*first,  check for a specific error.  */
say center(' ***error*** ', 79, "═")
say 'Division by zero detected at line  '       @ ,
"  and the REXX statement is:"
say sourceLine(@)
say
exit 42
end
say
say center(' error! ', 79, "*")
do newV1=1  for arg();   say;     say arg(newV1);       say
end   /*�*#*/
exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
syntax: @=sigl;   call err  'REXX program'   condition("C")   'error',   condition('D'), ,
'REXX source statement (line'   sigl"):",    sourceLine(sigl)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Detect-division-by-zero\detect-division-by-zero.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
