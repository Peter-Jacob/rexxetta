/*ª*REXX program reverses the order of tokens in a string (but not the letters).*/
newV1.=;                    newV1.1  =  "---------- Ice and Fire ------------"
newV1.2  =  ' '
newV1.3  =  "fire, in end will world the say Some"
newV1.4  =  "ice. in say Some"
newV1.5  =  "desire of tasted I've what From"
newV1.6  =  "fire. favor who those with hold I"
newV1.7  =  ' '
newV1.8  =  "... elided paragraph last ..."
newV1.9  =  ' '
newV1.10 =  "Frost Robert -----------------------"

do j=1  while  newV1.j\==''              /*ª*process each of the 10 lines of poem.*/
newV2=                                   /*ª*nullify the  $  string (the new line)*/
do k=1  for  words(newV1.j)           /*ª*process each word in a   @.j  string.*/
newV2=word(newV1.j,k) newV2                   /*ª*prepend a word to the new line  ($). */
end   /*ª*k*/                       /*ª* [â†‘]  we could do this another way.  */

say newV2                                /*ª*display the newly constructed line.  */
end      /*ª*j*/                       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Reverse-words-in-a-string\reverse-words-in-a-string-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
