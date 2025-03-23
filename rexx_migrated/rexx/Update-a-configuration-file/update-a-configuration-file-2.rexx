fid='updatecf.txt'
oid='updatecf.xxx'; 'erase' oid
options=translate('FAVOURITEFRUIT NEEDSPEELING SEEDSREMOVED NUMBEROFBANANAS numberofstrawberries')
done.=0
Do While lines(fid)>0
l=linein(fid)
c=left(l,1)
option=''
If c='#' | l='' Then
call o l
Else Do
If c=';' Then l=substr(l,3)
Parse Upper Var l option value
Select
When option='NEEDSPEELING' Then
Call o ';' option
When option='SEEDSREMOVED' Then
Call o option
When option='NUMBEROFBANANAS' Then
Call o option 1024
When option='FAVOURITEFRUIT' Then
Call o l
When option='NUMBEROFSTRAWBERRIES' Then
Call o option 62000
Otherwise
Call o '>>>' l
End
End
End
Do while options<>''
Parse Var options option options
If done.option=0 Then
Call o option 62000
End
Exit
o:
If option<>'' & done.option Then
Say 'Duplicate' option 'ignored'
Else Do
Call lineout oid,arg(1)
done.option=1
End
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Update-a-configuration-file\update-a-configuration-file-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
