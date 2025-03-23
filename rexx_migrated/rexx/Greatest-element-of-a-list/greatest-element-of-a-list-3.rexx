/*�*REXX program finds the  greatest element  in a list of numbers entered at the terminal*/
say '──────────────────  Please enter a list of numbers  (separated by blanks or commas):'
parse pull newV1;           newV2=words(newV1)               /*�*get a list of numbers from terminal. */
newV1=translate(newV1, , ',')                            /*�*change all commas  (,)  to  blanks.  */
big=word(newV1,1);          do j=2  to newV2             /*�*traipse through the list of numbers. */
big=max(big, word(newV1,j))  /*�*use a BIF for finding the max number.*/
end   /*�*j*/
say                                              /*�*stick a fork in it,  we're all done. */
say '────────────────── The biggest value in the list of '    newV2    " elements is: "    big
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-element-of-a-list\greatest-element-of-a-list-3.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
