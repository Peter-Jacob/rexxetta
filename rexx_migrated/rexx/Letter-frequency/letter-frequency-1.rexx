/*�*REXX program counts the occurrences of all characters in a file,  and note that all   */
/*�* Latin alphabet letters are uppercased for also counting {Latin} letters (both cases).*/
/*�*════════════════════════════════════~~~~~~~~~~════════════════════════════════════════*/
abc = 'abcdefghijklmnopqrstuvwxyz'               /*�*define an (Latin or English) alphabet*/
abcU= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'               /*�*define an uppercase version of  [↑]. */
parse arg fileID .                               /*�*this last char isn't a middle dot: · */
if fileID==''  then fileID= 'JUNK.TXT'           /*�*¿none specified? Then use the default*/
totChars= 0;           totLetters= 0             /*�*count of all chars and of all letters*/
pad= left('',18);      pad9= left('', 18%2)      /*�*used for the indentations of output. */
newV2.= 0                                            /*�*wouldn't it be neat to use Θ instead?*/
do j=1  while lines(fileID)\==0             /*�*read the file 'til the cows come home*/
rec= linein(fileID)                         /*�*get a line/record from the input file*/
/*�* [↓]  process all characters in  REC.*/
do k=1  for length(rec)                   /*�*examine/count each of the characters.*/
totChars= totChars + 1                    /*�*bump count of number of characters.  */
c= substr(rec, k, 1);      newV2.c= newV2.c + 1   /*�*Peel off a character; bump its count.*/
if \datatype(c, 'M')  then iterate        /*�*Not a Latin letter?   Get next char.⌠*/
totLetters= totLetters + 1                /*�*bump the count for [Latin] letters. ⌡*/
upper c                                   /*�* ◄─────◄ uppercase a Latin character.*/
newV2..c= newV2..c + 1                            /*�*bump the  (Latin)  letter's count.   */
end   /*�*k*/                               /*�*no Greek glyphs:  αßΓπ����ֳσµτΦΘΩδφε ··· */
end     /*�*j*/                               newV1=����������������C$C?�C)�B,*/
LL= '(Latin) letter'   /*�*literal used for a  "SAY"  (below).  */
w= length(totChars)                              /*�*used for right─aligning the counts.  */
say 'file ─────'  fileId  "───── has"   j-1   'records and has'   totLetters LL"s.";   say
do L=0  for 256;    c= d2c(L)               /*�*display all none─zero letter counts. */
if newV2..c==0  then iterate                    /*�*Has a zero count? Then skip character*/
say pad9  LL' '    c    " (also" translate(c,abc,abcU)')  count:'      right(newV2..c, w)
end   /*�*L*/                                 /*�*we may be in a rut, but not a cañyon.*/
say                                              /*�*¡The old name for Eygpt was Æygpt!  _*/
say 'file ─────'    fileId     "───── has"     totChars     'characters.'          /*�* √ */
say                                              /*�*The name for « » chars is guillemets.*/
do newV3=0  for 256;    y= d2c(newV3)               /*�*display all none─zero char counts.   */
if newV2.y==0  then iterate                     /*�*¿Å zero count?  Then ignore character*/
c= d2c(newV3);               ch= c              /*�*C  is the character glyph of a char. */
if c<<' ' | newV3==255  then ch=                /*�*don't show some control characters.  */
if c==' '           then ch= 'blank'        /*�*show a blank's  {true}  name.        */
say pad right(ch, 5)         " ('"d2x(newV3,2)"'x  character count:"      right(newV2.c, w)
end   /*�*#*/                                 /*�*255 isn't quite ∞, but sometimes ∙∙∙ */
say                                              /*�*not a good place for dithering: ░▒▓█ */
say  pad   pad9   '☼ end─of─list ☼'              /*�*show we are at the end of the list.  */
/*�*§§§§ Talk about a mishmash of 2¢ comments. ▬▬^▬▬ stick a fork in it, we're all done. ☻*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Letter-frequency\letter-frequency-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
