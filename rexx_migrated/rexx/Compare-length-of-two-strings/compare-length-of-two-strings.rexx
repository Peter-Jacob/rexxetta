/*ª* REXX */
list = '"abcd","123456789","abcdef","1234567"'
Do i=1 By 1 While list>''
Parse Var list s.i ',' list
s.i=strip(s.i,,'"')
End
n=i-1
Do While n>1
max=0
Do i=1 To n
If length(s.i)>max Then Do
k=i
max=length(s.i)
End
End
Call o s.k
If k<n Then
s.k=s.n
n=n-1
End
Call o s.1
Exit
o:
Say length(arg(1)) arg(1)
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Compare-length-of-two-strings\compare-length-of-two-strings.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
