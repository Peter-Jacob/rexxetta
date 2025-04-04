/*ͺ*REXX program counts the occurrences of all characters in a file,  and note that all   */
/*ͺ* Latin alphabet letters are uppercased for also counting {Latin} letters (both cases).*/
/*ͺ*ββββββββββββββββββββββββββββββββββββ~~~~~~~~~~ββββββββββββββββββββββββββββββββββββββββ*/
abc = 'abcdefghijklmnopqrstuvwxyz'               /*ͺ*define an (Latin or English) alphabet*/
abcU= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'               /*ͺ*define an uppercase version of  [β]. */
parse arg fileID .                               /*ͺ*this last char isn't a middle dot: Β· */
if fileID==''  then fileID= 'JUNK.TXT'           /*ͺ*ΒΏnone specified? Then use the default*/
totChars= 0;           totLetters= 0             /*ͺ*count of all chars and of all letters*/
pad= left('',18);      pad9= left('', 18%2)      /*ͺ*used for the indentations of output. */
newV2.= 0                                            /*ͺ*wouldn't it be neat to use Ξ instead?*/
do j=1  while lines(fileID)\==0             /*ͺ*read the file 'til the cows come home*/
rec= linein(fileID)                         /*ͺ*get a line/record from the input file*/
/*ͺ* [β]  process all characters in  REC.*/
do k=1  for length(rec)                   /*ͺ*examine/count each of the characters.*/
totChars= totChars + 1                    /*ͺ*bump count of number of characters.  */
c= substr(rec, k, 1);      newV2.c= newV2.c + 1   /*ͺ*Peel off a character; bump its count.*/
if \datatype(c, 'M')  then iterate        /*ͺ*Not a Latin letter?   Get next char.β */
totLetters= totLetters + 1                /*ͺ*bump the count for [Latin] letters. β‘*/
upper c                                   /*ͺ* βββββββ uppercase a Latin character.*/
newV2..c= newV2..c + 1                            /*ͺ*bump the  (Latin)  letter's count.   */
end   /*ͺ*k*/                               /*ͺ*no Greek glyphs:  Ξ±ΓΞΟΞξεχΦ³ΟΒ΅ΟΞ¦ΞΞ©Ξ΄ΟΞ΅ Β·Β·Β· */
end     /*ͺ*j*/                               newV1= δοξε βω ξοχ¬ ος νC$C?βC) B,*/
LL= '(Latin) letter'   /*ͺ*literal used for a  "SAY"  (below).  */
w= length(totChars)                              /*ͺ*used for rightβaligning the counts.  */
say 'file βββββ'  fileId  "βββββ has"   j-1   'records and has'   totLetters LL"s.";   say
do L=0  for 256;    c= d2c(L)               /*ͺ*display all noneβzero letter counts. */
if newV2..c==0  then iterate                    /*ͺ*Has a zero count? Then skip character*/
say pad9  LL' '    c    " (also" translate(c,abc,abcU)')  count:'      right(newV2..c, w)
end   /*ͺ*L*/                                 /*ͺ*we may be in a rut, but not a caΓ±yon.*/
say                                              /*ͺ*Β‘The old name for Eygpt was Γygpt!  _*/
say 'file βββββ'    fileId     "βββββ has"     totChars     'characters.'          /*ͺ* β */
say                                              /*ͺ*The name for Β« Β» chars is guillemets.*/
do newV3=0  for 256;    y= d2c(newV3)               /*ͺ*display all noneβzero char counts.   */
if newV2.y==0  then iterate                     /*ͺ*ΒΏΓ zero count?  Then ignore character*/
c= d2c(newV3);               ch= c              /*ͺ*C  is the character glyph of a char. */
if c<<' ' | newV3==255  then ch=                /*ͺ*don't show some control characters.  */
if c==' '           then ch= 'blank'        /*ͺ*show a blank's  {true}  name.        */
say pad right(ch, 5)         " ('"d2x(newV3,2)"'x  character count:"      right(newV2.c, w)
end   /*ͺ*#*/                                 /*ͺ*255 isn't quite β, but sometimes βββ */
say                                              /*ͺ*not a good place for dithering: ββββ */
say  pad   pad9   'βΌ endβofβlist βΌ'              /*ͺ*show we are at the end of the list.  */
/*ͺ*Β§Β§Β§Β§ Talk about a mishmash of 2Β’ comments. β¬β¬^β¬β¬ stick a fork in it, we're all done. β»*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Letter-frequency\letter-frequency-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
