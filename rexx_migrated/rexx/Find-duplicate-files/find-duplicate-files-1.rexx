/*ª*REXX program to reads a (DOS) directory  and  finds and displays files that identical.*/
sep=center(' files are identical in size and content: ',79,"â•")    /*ª*define the header. */
tFID= 'c:\TEMP\FINDDUP.TMP'                      /*ª*use this as a temporary  FileID.     */
arg maxSize aDir                                 /*ª*obtain optional arguments from the CL*/
if maxSize='' | maxSize="," then maxSize=1000000 /*ª*filesize limit (in bytes) [1 million]*/
aDir=strip(aDir)                                 /*ª*remove any leading or trailing blanks*/
if right(aDir,1)\=='\'  then aDir=aDir"\"        /*ª*possibly add a trailing backslash [\]*/
"DIR"  aDir  '/a-d-s-h /oS /s | FIND "/" >' tFID /*ª*the (DOS) DIR output â”€â”€â”€â–º temp file. */
pFN=                                             /*ª*the previous  filename and filesize. */
pSZ=;  do j=0  while lines(tFID)\==0             /*ª*process each of the files in the list*/
aLine=linein(tFID)                        /*ª*obtain (DOS) DIR's output about a FID*/
parse var aLine . . sz fn                 /*ª*obtain the filesize and its fileID.  */
sz=space(translate(sz,,','),0)            /*ª*elide any commas from the size number*/
if sz>maxSize  then leave                 /*ª*Is the file > maximum?  Ignore file. */
/*ª* [â†“]  files identical?  (1st million)*/
if sz==pSZ  then  if charin(aDir||pFN,1,sz)==charin(aDir||FN,1,sz)  then do
say sep
say pLine
say aLine
say
end
pSZ=sz;      pFN=FN;      pLine=aLine     /*ª*remember the previous stuff for later*/
end   /*ª*j*/

if lines(tFID)\==0  then 'ERASE' tFID            /*ª*do housecleaning  (delete temp file).*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-duplicate-files\find-duplicate-files-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
