/*ª*REXX program tests for a    Y  or  N    key when entered from keyboard after a prompt.*/

do queued();   pull;   end                     /*ª*flush the stack if anything is queued*/

prompt = 'Please enter   Y  or  N   for verification:'   /*ª*this is the  PROMPT  message.*/

do  until  pos(ans,'NY')\==0 & length(ans)==1  /*ª*keep looking for a  Y  or  N  answer.*/
say;       say prompt                          /*ª*display blank line;  display prompt. */
pull ans                                       /*ª*get the answer(s)  and  uppercase it.*/
ans=space(ans, 0)                              /*ª*elide all blanks.                    */
end   /*ª*until*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Keyboard-input-Obtain-a-Y-or-N-response\keyboard-input-obtain-a-y-or-n-response-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
