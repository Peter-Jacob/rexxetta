/*ª*REXX program reads a (bio-informational) FASTA file and displays the contents. */
Parse Arg iFID .                          /*ª*iFID:  the input file to be read.    */
If iFID==''  Then iFID='FASTA2.IN'        /*ª*Not specified?  Then use the default.*/
name=''                                   /*ª*the name of an output file (so far). */
data=''
/*ª*the value of the output file's stuff.*/
Do While lines(iFID)\==0                  /*ª*process the  FASTA  file contents.   */
x=strip(linein(iFID),'T')               /*ª*read a line (a record) from the file,*/
/*ª*--------- and strip trailing blanks. */
Select
When x=='' Then                       /*ª* If the line is all blank,           */
Nop                                 /*ª* ignore it.                          */
When left(x,1)==';' Then Do
If name=='' Then name=substr(x,2)
Say x
End
When left(x,1)=='>'  Then Do
If data\=='' Then
Say name':' data
name=substr(x,2)
data=''
End
Otherwise
data=space(data||translate(x, ,'*'),0)
End
End
If data\=='' Then
Say name':'  data                       /*ª* [?]  show output of last file used. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\FASTA-format\fasta-format-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
