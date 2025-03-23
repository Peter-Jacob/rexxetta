/*ª*REXX program creates an indexable string of lowercase ASCII or EBCDIC characters: aâ”€â–ºz*/
newV1=                                               /*ª*set lowercase letters list to  null. */
do j=0  for 2**8;                newV2=d2c(j)  /*ª*convert decimal  J  to a character.  */
if datatype(newV2, 'L')  then newV1=newV1 || newV2         /*ª*Is lowercase?  Then add it to $ list.*/
end   /*ª*j*/                                /*ª* [â†‘]  add lowercase letters â”€â”€â–º $    */
say newV1                                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-lower-case-ASCII-alphabet\generate-lower-case-ascii-alphabet-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
