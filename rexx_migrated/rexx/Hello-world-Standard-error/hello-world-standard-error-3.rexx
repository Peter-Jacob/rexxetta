/*�* REXX ---------------------------------------------------------------
* 07.07.2014 Walter Pachl
* enter the appropriate command shown in a command prompt.
*    "rexx serr.rex 2>err.txt"
* or "regina serr.rex 2>err.txt"
* 2>file will redirect the stderr stream to the specified file.
* I don't know any other way to catch this stream
*--------------------------------------------------------------------*/
Parse Version v
Say v
Call lineout 'stderr','Good bye, world!'
Call lineout ,'Hello, world!'
Say 'and this is the error output:'
'type err.txt'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hello-world-Standard-error\hello-world-standard-error-3.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
