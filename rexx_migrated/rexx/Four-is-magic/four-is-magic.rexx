/*ช*REXX pgm converts a # to English into the phrase:  a is b, b is c, ... four is magic. */
numeric digits 3003                              /*ช*be able to handle gihugic numbers.   */
parse arg x                                      /*ช*obtain optional numbers from the C.L.*/
if x=''  then x= -164 0 4 6 11 13 75 100 337 9223372036854775807   /*ช*use these defaults?*/
newV1.= .                                            /*ช*stemmed array used for memoization.  */
do j=1  for words(x)                      /*ช*process each of the numbers in list. */
say 4_is( word(x, j) )                    /*ช*display phrase that'll be returned.  */
say                                       /*ช*display a blank line between outputs.*/
end   /*ช*j*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
4_is:  procedure expose newV1.;     parse arg newV2,,newV3                /*ช*obtain the start number.*/
if newV2\==4  then do  until L==4                          /*ช*Not 4?   Process number.*/
newV1.newV2= newV3spellnewV2(newV2  'quiet minus negative') /*ช*spell number in English.*/
newV2= newV1.newV2;           L= length(newV2)          /*ช*get the length of spelt#*/
if newV1.L==.  then newV1.L= newV3spellnewV2(L 'quiet') /*ช*ยฌspelt before? Spell it.*/
newV3= newV3   newV2   "is"   newV1.L','                /*ช*add phrase to the answer*/
newV2= L                                    /*ช*use the new number, ยทยทยท */
end   /*ช*until*/                         /*ช* ยทยทยท which will be spelt*/
newV3= strip(newV3 'four is magic.')              /*ช*finish the sentence with the finale. */
parse var newV3 first 2 other;  upper first   /*ช*capitalize the first letter of output*/
return first  ||  other                   /*ช*return the sentence to the invoker.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Four-is-magic\four-is-magic.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
