/*ª*REXX program implements the "NOTES" command (append text to a file from the C.L.). */
notes = 'notes.txt'                           /*ª*the  fileID  of the  'notes'  file.  */
Select
When arg(1)='?' Then Do
Say "'rexx notes text' appends text to file" notes
Say "'rexx notes' displays file" notes
End
When arg()==0  Then Do                      /*ª*No arguments?  Then display the file.*/
Do while lines(notes)>0
Say linein(notes)                       /*ª* display a line of file --> screen.  */
End
End
Otherwise Do
timestamp=right(date(),11,0) time() date('W') /*ª*create current date & time stamp */
If 'f2'x==2  Then tab='05'x               /*ª* this is an EBCDIC system.           */
Else tab='09'x               /*ª*  "   "  "  ASCII    "               */
Call lineout notes,timestamp              /*ª*append the timestamp to "notes" file.*/
Call lineout notes,tab||arg(1)            /*ª*   "    "     text    "    "      "  */
End
End                                         /*ª*stick a fork in it,  we're all Done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Take-notes-on-the-command-line\take-notes-on-the-command-line.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
