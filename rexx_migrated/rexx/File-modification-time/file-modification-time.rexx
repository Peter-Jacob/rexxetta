/*�*REXX program obtains and displays a  file's  time of modification.                    */
parse arg newV1 .                                    /*�*obtain required argument from the CL.*/
if newV1==''  then do;  say "***error*** no filename was specified.";   exit 13;   end
q=stream(newV1, 'C', "QUERY TIMESTAMP")              /*�*get file's modification time info.   */
if q==''  then q="specified file doesn't exist." /*�*set an error indication message.     */
say 'For file: '  newV1                              /*�*display the file ID information.     */
say 'timestamp of last modification: ' q         /*�*display the modification time info.  */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\File-modification-time\file-modification-time.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
