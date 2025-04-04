/*ͺ*REXX program illustrates building a simple inverted index  and  a method of word find.*/
newV2.=                                              /*ͺ*a dictionary of words   (so far).    */
newV4=                                               /*ͺ*a list of found words   (so far).    */
call invertI 0, 'BURMA0.TXT'                     /*ͺ*read the file:  BURMA0.TXT  Β·Β·Β·      */
call invertI 1, 'BURMA1.TXT'                     /*ͺ*  "   "    "    BURMA1.TXT  Β·Β·Β·      */
call invertI 2, 'BURMA2.TXT'                     /*ͺ*  "   "    "    BURMA2.TXT  Β·Β·Β·      */
call invertI 3, 'BURMA3.TXT'                     /*ͺ*  "   "    "    BURMA3.TXT  Β·Β·Β·      */
call invertI 4, 'BURMA4.TXT'                     /*ͺ*  "   "    "    BURMA4.TXT  Β·Β·Β·      */
call invertI 5, 'BURMA5.TXT'                     /*ͺ*  "   "    "    BURMA5.TXT  Β·Β·Β·      */
call invertI 6, 'BURMA6.TXT'                     /*ͺ*  "   "    "    BURMA6.TXT  Β·Β·Β·      */
call invertI 7, 'BURMA7.TXT'                     /*ͺ*  "   "    "    BURMA7.TXT  Β·Β·Β·      */
call invertI 8, 'BURMA8.TXT'                     /*ͺ*  "   "    "    BURMA8.TXT  Β·Β·Β·      */
call invertI 9, 'BURMA9.TXT'                     /*ͺ*  "   "    "    BURMA9.TXT  Β·Β·Β·      */
call findAword  "huz"                            /*ͺ*find a word.                         */
call findAword  "60"                             /*ͺ*find another word.                   */
call findAword  "don't"                          /*ͺ*and find another word.               */
call findAword  "burma-shave"                    /*ͺ*and find yet another word.           */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
findAword: procedure expose newV2.;  arg x           /*ͺ*get an uppercase version of the X arg*/
parse arg ox                          /*ͺ*get original (as-is)  value of X arg.*/
newV5=newV2.x;    oxo='βββ'ox"βββ"
if newV5==''  then do
say 'word'   oxo   "not found."
return 0
end
newV3=newV5                                  /*ͺ*save _ text, pass it back to invoker.*/
say 'word'  oxo  "found in:"
do  until newV5=='';    parse var   newV5   f  w  newV5
say '       file='f   "  word="w
end   /*ͺ*until Β·Β·Β· */
return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
invertI:   procedure expose newV2. newV4; parse arg newV6,fn /*ͺ*the file number and the filename.    */
call lineout fn                       /*ͺ*close the file, Β·Β·Β· just in case.    */
w=0                                   /*ͺ*the number of words found  (so far). */
do  while lines(fn)\==0           /*ͺ* [β]   process the entire file.      */
newV5=space( linein(fn) )             /*ͺ*read a line, elide superfluous blanks*/
if newV5==''  then iterate            /*ͺ*if a blank record,  then ignore it.  */
say 'file' newV6", record:" newV5         /*ͺ*display the record βββΊ terminal.     */

do  until newV5==''                /*ͺ*pick off words from record until done*/
parse upper var   newV5   newV7  newV5     /*ͺ*pick off a word  (it's in uppercase).*/
newV7=stripper(newV7)                  /*ͺ*strip any trailing punctuation.      */
if newV7=''  then iterate          /*ͺ*is the word now all blank (or null)? */
w=w+1                          /*ͺ*bump the word counter (index).       */
newV2.newV7=newV2.newV7  newV6  w                  /*ͺ*append the new word to a list.       */
if wordpos(newV7,newV4)==0  then newV4=newV4 newV7 /*ͺ*add it to the list of words found.   */
end   /*ͺ*until Β·Β·Β· */
end      /*ͺ*while Β·Β·Β· */
say;     call lineout fn              /*ͺ*close the file, just to be neat&safe.*/
return w                              /*ͺ*return the index of word in record.  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
stripper:  procedure;  parse arg q               /*ͺ*remove punctuation at the end of word*/
newV1= '.,:;?ΒξεχΦ·!ΒξεχΦ΄βΒ·';        do j=1  for length(newV1)
q=strip(q, 'T', substr(newV1, j, 1) )
end   /*ͺ*j*/
return q
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Inverted-index\inverted-index.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
