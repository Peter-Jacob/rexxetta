/*�* Include a file and INTERPRET it; this code uses ARexx file IO BIFs */
say 'This is a program running.'
if Open(other,'SYS:Rexxc/otherprogram.rexx','READ') then do
say "Now we opened a file with another chunk of code. Let's read it into a variable."
othercode=''
do until EOF(other)
othercode=othercode || ReadLn(other) || ';'
end
call Close(other)
say 'Now we run it as part of our program.'
interpret othercode
end
say 'The usual program resumes here.'
exit 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Include-a-file\include-a-file-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
