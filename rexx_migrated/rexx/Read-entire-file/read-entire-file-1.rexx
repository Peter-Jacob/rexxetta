/*ª*REXX program reads an entire file line-by-line  and  stores it as a continuous string.*/
parse arg iFID .                                 /*ª*obtain optional argument from the CL.*/
if iFID==''  then iFID= 'a_file'                 /*ª*Not specified?  Then use the default.*/
newV1=                                               /*ª*a string of file's contents (so far).*/
do  while lines(iFID)\==0           /*ª*read the file's lines until finished.*/
newV1=newV1 || linein(iFID)                 /*ª*append a (file's) line to the string,*/
end   /*ª*while*/                     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Read-entire-file\read-entire-file-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
