Call stripd ' apples, pears # and bananas'
Call stripd ' apples, pears and bananas'
Exit
stripd:
Parse Arg old
dlist='#;'                        /*�* delimiter list             */
p=verify(old,dlist,'M')          /*�* find position of delimiter */
If p>0 Then                       /*�* delimiter found            */
new=strip(left(old,p-1))
Else
new=strip(old)
Say '>'old'<'
Say '>'new'<'
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-comments-from-a-string\strip-comments-from-a-string-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
