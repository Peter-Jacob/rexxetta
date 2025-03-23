/*ª*REXX*/

of='file.txt'
'erase' of
s=copies('1234567890',10000)
Call charout of,s
Call lineout of
Say chars(of) length(s)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-entire-file\write-entire-file-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
