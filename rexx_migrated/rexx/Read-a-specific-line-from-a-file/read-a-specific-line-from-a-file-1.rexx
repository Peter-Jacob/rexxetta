/*�*REXX program reads a specific line from a file  (and displays the length and content).*/
parse arg FID n .                                /*�*obtain optional arguments from the CL*/
if FID=='' | FID==","  then  FID= 'JUNK.TXT'     /*�*not specified?  Then use the default.*/
if   n=='' |   n==","  then    n=7               /*�* "      "         "   "   "      "   */

if lines(FID)==0  then  call ser "wasn't found." /*�*see if the file    exists  (or not). */

call linein FID, n-1                             /*�*read the record previous to  N.      */
if lines(FID)==0  then  call ser "doesn't contain"       N        'lines.'
/*�* [↑]  any more lines to read in file?*/

newV1=linein(FID)                                    /*�*read the   Nth  record in the file.  */

say 'File '  FID  " line "  N  ' has a length of: '         length(newV1)
say 'File '  FID  " line "  N  'contents: '   newV1  /*�*display the contents of the Nth line.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ser:   say;     say '***error!***  File '     FID     " "    arg(1);      say;     exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-a-specific-line-from-a-file\read-a-specific-line-from-a-file-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
