stripchars: Procedure
Parse Arg i,s                 /*�* get input and chars to be removed */
o=''                          /*�* initialize result                 */
Do While i\==''               /*�* loop through input                */
Parse Var i c +1 i          /*�* get one character                 */
If pos(c,s)=0 Then          /*�* it's not to be removed            */
o=o||c                    /*�* append it to the result           */
End
Return o                      /*�* return the result                 */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-a-set-of-characters-from-a-string\strip-a-set-of-characters-from-a-string-4.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
