/*ª*REXX program  writes  an  entire file  with a  single write  (a long text record).    */
oFID= 'OUTPUT.DAT'                               /*ª*name of the output file to be used.  */
/*ª* [â†“]  50 bytes, including the fences.*/
newV1 = '<<<This is the text that is written to a file. >>>'
/*ª* [â†“]  COPIES  creates a 50k byte str.*/
call charout oFID, copies(newV1,1000), 1             /*ª*write the longish text to the file.  */
/*ª* [â†‘]  the "1"  writes text â”€â”€â–º rec #1*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-entire-file\write-entire-file-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
