/*ª* REXX ***************************************************************
* 27.10.2010 Walter Pachl
**********************************************************************/
Parse Arg fid
If fid='' Then Do
"ALLOC FI(IN) DA('N561985.PRIV.V100(LL)') SHR REUSE"
'EXECIO * DISKR IN (STEM L. FINIS'   /*ª* read all lines             */
'FREE FI(IN)'
End
Else Do
Do i=1 By 1 While lines(fid)>0
l.i=linein(fid)
End
l.0=i-1
End
maxl = 0                               /*ª* initialize maximum length  */
Do i=1 To l.0                          /*ª* loop through all lines     */
linl=length(l.i)                     /*ª* length of current line     */
Select
When linl>maxl Then Do             /*ª* line longer than preceding */
maxl=linl                        /*ª* initialize maximum length  */
mem.0=1                          /*ª* memory has one entry       */
mem.1=l.i                        /*ª* the current line           */
lin.1=i                          /*ª* its line number            */
End
When linl=maxl Then Do             /*ª* line as long as maximum    */
z=mem.0+1                        /*ª* new memory index           */
mem.z=l.i                        /*ª* the current line           */
lin.z=i                          /*ª* its line number            */
mem.0=z                          /*ª* memory size                */
End
Otherwise                          /*ª* line is shorter than max.  */
Nop                              /*ª* ignore                     */
End
End
If mem.0>0 Then Do
Say 'Maximum line length='maxl
Say ' Line Contents'
Do i=1 To mem.0
Say right(lin.i,5) mem.i
End
End
Else
Say 'No lines in input file or file does not exist'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Longest-string-challenge\longest-string-challenge-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
