/*�*REXX program illustrates building a simple inverted index  and  a method of word find.*/
newV2.=                                              /*�*a dictionary of words   (so far).    */
newV4=                                               /*�*a list of found words   (so far).    */
call invertI 0, 'BURMA0.TXT'                     /*�*read the file:  BURMA0.TXT  ···      */
call invertI 1, 'BURMA1.TXT'                     /*�*  "   "    "    BURMA1.TXT  ···      */
call invertI 2, 'BURMA2.TXT'                     /*�*  "   "    "    BURMA2.TXT  ···      */
call invertI 3, 'BURMA3.TXT'                     /*�*  "   "    "    BURMA3.TXT  ···      */
call invertI 4, 'BURMA4.TXT'                     /*�*  "   "    "    BURMA4.TXT  ···      */
call invertI 5, 'BURMA5.TXT'                     /*�*  "   "    "    BURMA5.TXT  ···      */
call invertI 6, 'BURMA6.TXT'                     /*�*  "   "    "    BURMA6.TXT  ···      */
call invertI 7, 'BURMA7.TXT'                     /*�*  "   "    "    BURMA7.TXT  ···      */
call invertI 8, 'BURMA8.TXT'                     /*�*  "   "    "    BURMA8.TXT  ···      */
call invertI 9, 'BURMA9.TXT'                     /*�*  "   "    "    BURMA9.TXT  ···      */
call findAword  "huz"                            /*�*find a word.                         */
call findAword  "60"                             /*�*find another word.                   */
call findAword  "don't"                          /*�*and find another word.               */
call findAword  "burma-shave"                    /*�*and find yet another word.           */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
findAword: procedure expose newV2.;  arg x           /*�*get an uppercase version of the X arg*/
parse arg ox                          /*�*get original (as-is)  value of X arg.*/
newV5=newV2.x;    oxo='───'ox"───"
if newV5==''  then do
say 'word'   oxo   "not found."
return 0
end
newV3=newV5                                  /*�*save _ text, pass it back to invoker.*/
say 'word'  oxo  "found in:"
do  until newV5=='';    parse var   newV5   f  w  newV5
say '       file='f   "  word="w
end   /*�*until ··· */
return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
invertI:   procedure expose newV2. newV4; parse arg newV6,fn /*�*the file number and the filename.    */
call lineout fn                       /*�*close the file, ··· just in case.    */
w=0                                   /*�*the number of words found  (so far). */
do  while lines(fn)\==0           /*�* [↓]   process the entire file.      */
newV5=space( linein(fn) )             /*�*read a line, elide superfluous blanks*/
if newV5==''  then iterate            /*�*if a blank record,  then ignore it.  */
say 'file' newV6", record:" newV5         /*�*display the record ──► terminal.     */

do  until newV5==''                /*�*pick off words from record until done*/
parse upper var   newV5   newV7  newV5     /*�*pick off a word  (it's in uppercase).*/
newV7=stripper(newV7)                  /*�*strip any trailing punctuation.      */
if newV7=''  then iterate          /*�*is the word now all blank (or null)? */
w=w+1                          /*�*bump the word counter (index).       */
newV2.newV7=newV2.newV7  newV6  w                  /*�*append the new word to a list.       */
if wordpos(newV7,newV4)==0  then newV4=newV4 newV7 /*�*add it to the list of words found.   */
end   /*�*until ··· */
end      /*�*while ··· */
say;     call lineout fn              /*�*close the file, just to be neat&safe.*/
return w                              /*�*return the index of word in record.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stripper:  procedure;  parse arg q               /*�*remove punctuation at the end of word*/
newV1= '.,:;?����ַ!����ִ∙·';        do j=1  for length(newV1)
q=strip(q, 'T', substr(newV1, j, 1) )
end   /*�*j*/
return q
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Inverted-index\inverted-index.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
