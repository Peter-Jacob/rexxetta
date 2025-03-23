/*ª*REXX program reads a (bio-informational) FASTA file and displays the contents. */
Parse Arg ifid .                       /*ª* iFID:  the input file to be read       */
If ifid=='' Then
ifid='FASTA.IN'                      /*ª* Not specified?  Then use the default   */
name=''                                /*ª* the name of an output file (so far)    */
d=''                                   /*ª* the value of the output file's         */
Do While lines(ifid)\==0               /*ª* process the  FASTA  file contents      */
x=strip(linein(ifid),'T')            /*ª* read a line (a record) from the input  */
/*ª* and strip trailing blanks              */
If left(x,1)=='>' Then Do            /*ª* a new file id                          */
Call out                           /*ª* show output name and data              */
name=substr(x,2)                   /*ª* and get the new (or first) output name */
d=''                               /*ª* start with empty contents              */
End
Else                                 /*ª* a line with data                       */
d=d||x                             /*ª* append it to output                    */
End
Call out                               /*ª* show output of last file used.         */
Exit

out:
If d\=='' Then                         /*ª* if there ara data                      */
Say name':' d                        /*ª* show output name and data              */
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\FASTA-format\fasta-format-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
