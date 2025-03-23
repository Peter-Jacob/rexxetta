/*�*REXX program  writes  an  entire file  with a  single write  (a long text record).    */
oFID= 'OUTPUT.DAT'                               /*�*name of the output file to be used.  */
/*�* [↓]  50 bytes, including the fences.*/
newV1 = '<<<This is the text that is written to a file. >>>'
/*�* [↓]  COPIES  creates a 50k byte str.*/
call charout oFID, copies(newV1,1000), 1             /*�*write the longish text to the file.  */
/*�* [↑]  the "1"  writes text ──► rec #1*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-entire-file\write-entire-file-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
