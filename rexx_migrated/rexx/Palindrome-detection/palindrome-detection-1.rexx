/*�*REXX pgm checks if phrase is palindromic; ignores the case of the letters.  */
parse arg y                            /*�*get (optional) phrase from the C.L.  */
if y=''  then y='In girum imus nocte et consumimur igni'    /*�*[↓] translation.*/
/*�*We walk around in the night and we are burnt by the fire (of love).*/
say 'string = ' y
if isTpal(y)  then                   say 'The string is a true palindrome.'
else if isPal(y)  then say 'The string is an inexact palindrome.'
else say "The string isn't palindromic."
exit                                   /*�*stick a fork in it,  we're all done. */
/*�*────────────────────────────────────────────────────────────────────────────*/
isTpal:  return reverse(arg(1))==arg(1)
isPal:   return isTpal(translate(space(x,0)))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Palindrome-detection\palindrome-detection-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
