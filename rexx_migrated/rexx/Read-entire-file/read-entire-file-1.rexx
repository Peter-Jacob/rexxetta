/*�*REXX program reads an entire file line-by-line  and  stores it as a continuous string.*/
parse arg iFID .                                 /*�*obtain optional argument from the CL.*/
if iFID==''  then iFID= 'a_file'                 /*�*Not specified?  Then use the default.*/
newV1=                                               /*�*a string of file's contents (so far).*/
do  while lines(iFID)\==0           /*�*read the file's lines until finished.*/
newV1=newV1 || linein(iFID)                 /*�*append a (file's) line to the string,*/
end   /*�*while*/                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-entire-file\read-entire-file-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
