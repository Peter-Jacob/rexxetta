i=13
signal label
say 'This is never executed'
sub: Procedure Expose i
Do i=1 To 10;
label:
Say 'label reached, i='i
Signal real_start
End
Return
real_start:
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Jump-anywhere\jump-anywhere-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
