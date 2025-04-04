/*ͺ*REXX program  finds words  with the  largest set of  anagrams  (of the same size).    */
iFID= 'unixdict.txt'                             /*ͺ*the dictionary input File IDentifier.*/
newV3=;     newV1.=;      ww=0;       uw=0;      most=0  /*ͺ*initialize a bunch of REXX variables.*/
/*ͺ* [β]  read the entire file (by lines)*/
do  while lines(iFID) \== 0                  /*ͺ*Got any data?   Then read a record.  */
parse value  linein(iFID)  with  newV4 .         /*ͺ*obtain a word from an input line.    */
len=length(newV4);  if len<3  then iterate       /*ͺ*onesies and twosies words can't win. */
if \datatype(newV4, 'M')      then iterate       /*ͺ*ignore any  nonβanagramable words.   */
uw=uw + 1                                    /*ͺ*count of the (useable) words in file.*/
newV5=sortA(newV4)                                   /*ͺ*sort the letters in the word.        */
newV1.newV5=newV1.newV5 newV4;       newV6=words(newV1.newV5)                /*ͺ*append it to !._;  bump the counter. */
if newV6==most  then newV3=newV3 newV5                       /*ͺ*append the sorted wordβββΊ max anagram*/
else if newV6>most  then do;   newV3=newV5;   most=newV6;   if len>ww  then ww=len;    end
end   /*ͺ*while*/                              /*ͺ*$ βββ list of high count anagrams.   */
say 'βββββββββββββββββββββββββ'    uw    "usable words in the dictionary file: "      iFID
say
do m=1  for words(newV3);   z=subword(newV3, m, 1)  /*ͺ*the high count of the anagrams.      */
say '     '     left(word(newV1.z, 1),  ww)      '   [anagrams: '      subword(newV1.z, 2)"]"
end   /*ͺ*m*/                                 /*ͺ*W   is the maximum width of any word.*/
say
say 'βββββ Found'   words(newV3)    "words  (each of which have"    words(newV1.z)-1  'anagrams).'
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sortA: arg char 2 xx,newV2.                          /*ͺ*get the first letter of arg;  @.=null*/
newV2.char=char                               /*ͺ*no need to concatenate the first char*/
/*ͺ*[β]  sort/put letters alphabetically.*/
do length(xx);   parse var xx char 2 xx;    newV2.char=newV2.char || char;    end
/*ͺ*reassemble word with sorted letters. */
return newV2.a || newV2.b || newV2.c || newV2.d || newV2.e || newV2.f||newV2.g||newV2.h||newV2.i||newV2.j||newV2.k||newV2.l||newV2.m||,
newV2.n || newV2.o || newV2.p || newV2.q || newV2.r || newV2.s||newV2.t||newV2.u||newV2.v||newV2.w||newV2.x||newV2.y||newV2.z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anagrams\anagrams-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
