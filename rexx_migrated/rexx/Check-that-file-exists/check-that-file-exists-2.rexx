/*ª* Check if a file already exists */
filename='file.txt'
IF ~Openfile(filename) THEN CALL Openfile(':'filename)
EXIT 0
Openfile:
IF ~Exists(filename) THEN RETURN 0
CALL Open(filehandle,filename,'APPEND')
RETURN 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Check-that-file-exists\check-that-file-exists-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
