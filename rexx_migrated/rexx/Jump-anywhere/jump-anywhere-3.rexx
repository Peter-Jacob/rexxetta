/*ª* REXX ***************************************************************
* 12.12.2012 Walter Pachl
**********************************************************************/
Signal On Syntax
Parse Upper Arg part
If part<>'' Then
Interpret 'Signal' part
Say 'Executing default part'
Signal eoj
a:Say 'executing part A'
Signal eoj
b:Say 'executing part B'
Signal eoj
Syntax:
Say 'argument must be a or b or omitted'
Exit
eoj: say 'here we could print statistics'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jump-anywhere\jump-anywhere-3.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
