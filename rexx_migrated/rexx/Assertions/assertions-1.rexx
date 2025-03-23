/*ª* REXX ***************************************************************
* There's no assert feature in Rexx. That's how I'd implement it
* 10.08.2012 Walter Pachl
**********************************************************************/
x.=42
x.2=11
Do i=1 By 1
Call assert x.i,42
End
Exit
assert:
Parse Arg assert_have,assert_should_have
If assert_have\==assert_should_have Then Do
Say 'Assertion fails in line' sigl
Say 'expected:' assert_should_have
Say '   found:' assert_have
Say sourceline(sigl)
Say 'Look around'
Trace ?R
Nop
Signal Syntax
End
Return
Syntax: Say 'program terminated'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Assertions\assertions-1.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
