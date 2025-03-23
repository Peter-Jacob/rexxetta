/*ª*REXX program prompts & reads/obtains a string, and also the number 75000 from terminal*/
say 'Please enter a string:'                     /*ª*issue a prompt message to the term.  */
parse pull userString                            /*ª*the (char) string can be any length. */
/*ª* [â†‘]  the string could be null/empty.*/
do  until userNumber=75000                     /*ª*repeat this loop until satisfied.    */
say                                            /*ª*display a blank line to the terminal.*/
say 'Please enter the number 75000'            /*ª*display a nice prompt message to term*/
parse pull userNumber                          /*ª*obtain the user text from terminal.  */
end   /*ª*until*/                                /*ª*check if the response is legitimate. */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\User-input-Text\user-input-text.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
