/*ª*REXX program to separate a string of comma-delimited words and echo */
sss='Hello,How,Are,You,Today'
say 'input string='sss
say ''
say 'Words in the string:'
ss =translate(sss,' ',',')
dot='.'
Do i=1 To words(ss)
If i=words(ss) Then dot=''
say word(ss,i)dot
End
say 'End-of-list.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tokenize-a-string\tokenize-a-string-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
