/*ª*REXX program determines what characters are  lowercase and uppercase  (Latin) letters.*/
newV1=                                              /*ª*set lowercase alphabet string to null*/
newV2=                                              /*ª* "  uppercase     "       "    "   " */
do newV3=0  for 2**8                             /*ª*traipse through  all  the characters.*/
newV4=d2c(newV3)     /*ª*convert decimal number to character. */
if datatype(newV4, 'L')  then newV1=newV1 newV4            /*ª*Lowercase?  Then add char to the list*/
if datatype(newV4, 'U')  then newV2=newV2 newV4            /*ª*Uppercase?    "   "   "    "  "    " */
end   /*ª*#*/                                  /*ª* [â†‘]  put all the letters into a list*/

say '    lowercase letters: '   newV1               /*ª*display all the  lowercase  letters. */
say '    uppercase letters: '   newV2               /*ª*   "     "   "   uppercase     "     */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-lowercase-and-uppercase-letters\idiomatically-determine-all-the-lowercase-and-uppercase-letters-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
