/*�*REXX program   reads  and  displays  (with a count)  a file,  one line at a time.     */
parse arg fID .                                  /*�*obtain optional argument from the CL.*/
if fID==''  then exit 8                          /*�*Was no fileID specified?  Then quit. */
say center(' displaying file: ' fID" ", 79, '═') /*�*show the name of the file being read.*/
call linein fID, 1, 0                            /*�*see the comment in the section header*/
say                                              /*�* [↓]  show a file's contents (lines).*/
do newV1=1  while lines(fID)\==0                /*�*loop whilst there are lines in file. */
y= linein(fID)                              /*�*read a line and assign contents to Y.*/
say y                                       /*�*show the content of the line (record)*/
end   /*�*#*/
say                                              /*�*stick a fork in it,  we're all done. */
say center(' file '   fID   " has "   newV1-1   ' records.', 79, '═')     /*�*show rec count. */
call lineout  fID                                /*�*close the input file  (most REXXes). */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-a-file-line-by-line\read-a-file-line-by-line-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
