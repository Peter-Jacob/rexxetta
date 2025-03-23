/*ª*REXX program determines what  characters  are valid for REXX symbols. */
newV1=                                     /*ª*set   symbol characters "   "  */
do j=0  for 2**8                    /*ª*traipse through all the chars. */
newV2=d2c(j)                            /*ª*convert decimal number to char.*/
if datatype(newV2,'S')  then newV1=newV1 || newV2   /*ª*Symbol char?  Then add to list.*/
end   /*ª*j*/                         /*ª* [â†‘] put some chars into a list*/

say '     symbol characters: '  newV1      /*ª*display all  symbol characters.*/
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-characters-that-can-be-used-for-symbols\idiomatically-determine-all-the-characters-that-can-be-used-for-symbols-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
