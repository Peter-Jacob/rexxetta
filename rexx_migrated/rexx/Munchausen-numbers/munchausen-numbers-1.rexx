Do n=0 To 10000
If n=m(n) Then
Say n
End
Exit
m: Parse Arg z
res=0
Do While z>''
Parse Var z c +1 z
res=res+c**c
End
Return res
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Munchausen-numbers\munchausen-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
