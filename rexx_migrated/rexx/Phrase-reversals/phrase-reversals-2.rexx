/*ª*REXX program reverses  words and also letters  in a string in various (several) ways. */
parse arg newV1                                      /*ª*obtain optional arguments from the CL*/
if newV1=''  then newV1= "rosetta code phrase reversal"  /*ª*Not specified?  Then use the default.*/
L=;  W=                                          /*ª*initialize two REXX variables to null*/
do j=1  for words(newV1);   newV2= word(newV1, j) /*ª*extract each word in the  $  string. */
L= L reverse(newV2);        W= newV2 W        /*ª*reverse letters;  reverse words.     */
end   /*ª*j*/
say '   the original phrase used: '          newV1
say '   original phrase reversed: '  reverse(newV1)
say '  reversed individual words: '    strip(L)
say '  reversed words in phrases: '          W   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Phrase-reversals\phrase-reversals-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
