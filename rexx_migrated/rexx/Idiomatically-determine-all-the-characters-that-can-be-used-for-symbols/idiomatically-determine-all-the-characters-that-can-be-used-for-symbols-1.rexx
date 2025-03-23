/*�*REXX program determines what  characters  are valid for REXX symbols. */
newV1=                                     /*�*set   symbol characters "   "  */
do j=0  for 2**8                    /*�*traipse through all the chars. */
newV2=d2c(j)                            /*�*convert decimal number to char.*/
if datatype(newV2,'S')  then newV1=newV1 || newV2   /*�*Symbol char?  Then add to list.*/
end   /*�*j*/                         /*�* [↑] put some chars into a list*/

say '     symbol characters: '  newV1      /*�*display all  symbol characters.*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Idiomatically-determine-all-the-characters-that-can-be-used-for-symbols\idiomatically-determine-all-the-characters-that-can-be-used-for-symbols-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
