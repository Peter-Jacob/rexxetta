/*ª*REXX pgm to verify a file's size */
parse arg iFID .                       /*ª*let user specify the file ID.  */
if iFID==''  then iFID="FILESIZ.DAT"   /*ª*Not specified? Then use default*/
say 'size of' iFID':'
Say chars(ifid) '(CR LF included)'
Call lineout ifid /*ª* close the file */
say filesize(ifid) '(net data)'
Call lineout ifid
exit

filesize:  parse arg f;
sz=0;
Do while lines(f)\==0
sz=sz+length(linein(f))
End
return sz
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-size\file-size-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
