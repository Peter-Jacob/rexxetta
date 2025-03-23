/*�*REXX program creates an indexable string of lowercase ASCII or EBCDIC characters: a─►z*/
newV1=                                               /*�*set lowercase letters list to  null. */
do j=0  for 2**8;                newV2=d2c(j)  /*�*convert decimal  J  to a character.  */
if datatype(newV2, 'L')  then newV1=newV1 || newV2         /*�*Is lowercase?  Then add it to $ list.*/
end   /*�*j*/                                /*�* [↑]  add lowercase letters ──► $    */
say newV1                                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-lower-case-ASCII-alphabet\generate-lower-case-ascii-alphabet-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
