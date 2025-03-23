/*�*REXX pgm converts a # to English into the phrase:  a is b, b is c, ... four is magic. */
numeric digits 3003                              /*�*be able to handle gihugic numbers.   */
parse arg x                                      /*�*obtain optional numbers from the C.L.*/
if x=''  then x= -164 0 4 6 11 13 75 100 337 9223372036854775807   /*�*use these defaults?*/
newV1.= .                                            /*�*stemmed array used for memoization.  */
do j=1  for words(x)                      /*�*process each of the numbers in list. */
say 4_is( word(x, j) )                    /*�*display phrase that'll be returned.  */
say                                       /*�*display a blank line between outputs.*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
4_is:  procedure expose newV1.;     parse arg newV2,,newV3                /*�*obtain the start number.*/
if newV2\==4  then do  until L==4                          /*�*Not 4?   Process number.*/
newV1.newV2= newV3spellnewV2(newV2  'quiet minus negative') /*�*spell number in English.*/
newV2= newV1.newV2;           L= length(newV2)          /*�*get the length of spelt#*/
if newV1.L==.  then newV1.L= newV3spellnewV2(L 'quiet') /*�*¬spelt before? Spell it.*/
newV3= newV3   newV2   "is"   newV1.L','                /*�*add phrase to the answer*/
newV2= L                                    /*�*use the new number, ··· */
end   /*�*until*/                         /*�* ··· which will be spelt*/
newV3= strip(newV3 'four is magic.')              /*�*finish the sentence with the finale. */
parse var newV3 first 2 other;  upper first   /*�*capitalize the first letter of output*/
return first  ||  other                   /*�*return the sentence to the invoker.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Four-is-magic\four-is-magic.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
