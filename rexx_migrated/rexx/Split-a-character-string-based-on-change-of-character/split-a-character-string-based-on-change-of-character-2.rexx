/*ª* REXX */
Parse arg str                         /*ª*obtain optional arguments from the CL*/
if str==''  then str= 'gHHH5YY++///\' /*ª*Not specified?  Then use the default.*/
input=str
x=''
cp=''
result=''
Do While str<>''
Parse Var str c +1 str
If c==cp Then x=x||c
Else Do
If x>>'' Then
result=result||x', '
x=c
End
cp=c
End
result=result||x
say '      input string: '    input
say '     output string: '    result
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Split-a-character-string-based-on-change-of-character\split-a-character-string-based-on-change-of-character-2.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
