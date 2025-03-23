/*ª*REXX program tests for a    Y  or  N    key when entered from keyboard after a prompt.*/
prompt = 'Please enter   Y  or  N   for verification:'   /*ª*this is the  PROMPT  message.*/

do  until  pos(ans, 'NYny') \== 0              /*ª*keep prompting until answer= Y N y n */
say;       say prompt                          /*ª*display blank line;  display prompt. */
ans=inKey('wait')                              /*ª*get the answer(s) from the terminal. */
end   /*ª*until*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Keyboard-input-Obtain-a-Y-or-N-response\keyboard-input-obtain-a-y-or-n-response-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
