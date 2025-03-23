/*�*REXX program determines what characters are  lowercase and uppercase  (Latin) letters.*/
newV1=                                              /*�*set lowercase alphabet string to null*/
newV2=                                              /*�* "  uppercase     "       "    "   " */
do newV3=0  for 2**8                             /*�*traipse through  all  the characters.*/
newV4=d2c(newV3)     /*�*convert decimal number to character. */
if datatype(newV4, 'L')  then newV1=newV1 newV4            /*�*Lowercase?  Then add char to the list*/
if datatype(newV4, 'U')  then newV2=newV2 newV4            /*�*Uppercase?    "   "   "    "  "    " */
end   /*�*#*/                                  /*�* [↑]  put all the letters into a list*/

say '    lowercase letters: '   newV1               /*�*display all the  lowercase  letters. */
say '    uppercase letters: '   newV2               /*�*   "     "   "   uppercase     "     */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-lowercase-and-uppercase-letters\idiomatically-determine-all-the-lowercase-and-uppercase-letters-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
