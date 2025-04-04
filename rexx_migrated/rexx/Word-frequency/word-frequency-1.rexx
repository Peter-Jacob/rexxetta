/*ช*REXX pgm displays top 10 words in a file (includes foreign letters),  case is ignored.*/
parse arg fID top .                              /*ช*obtain optional arguments from the CL*/
if fID=='' | fID==","  then fID= 'les_mes.txt'   /*ช*None specified? Then use the default.*/
if top=='' | top==","  then top= 10              /*ช*  "      "        "   "   "     "    */
call init                                        /*ช*initialize varied bunch of variables.*/
call rdr
say right('word', 40)  " "  center(' rank ', 6)  "  count "   /*ช*display title for output*/
say right('โโโโ', 40)  " "  center('โโโโโโ', 6)  " โโโโโโโ"   /*ช*   "    title separator.*/

do  until otops==tops | tops>top            /*ช*process enough words to satisfy  TOP.*/
WL=;         mk= 0;    otops= tops          /*ช*initialize the word list (to a NULL).*/

do n=1  for c;    z= newV2.n;      k= newV1.z  /*ช*process the list of words in the file*/
if k==mk  then WL= WL z                /*ช*handle cases of tied number of words.*/
if k> mk  then do;  mk=k;  WL=z;  end  /*ช*this word count is the current max.  */
end   /*ช*n*/

wr= max( length(' rank '), length(top) )    /*ช*find the maximum length of the rank #*/

do d=1  for words(WL);  y= word(WL, d) /*ช*process all words in the  word list. */
if d==1  then w= max(10, length(newV1.y) ) /*ช*use length of the first number used. */
say right(y, 40)         right( commas(tops), wr)          right(commas(newV1.y), w)
newV1.y= .                                 /*ช*nullify word count for next go 'round*/
end   /*ช*d*/                            /*ช* [โ]  this allows a non-sorted list. */

tops= tops + words(WL)                      /*ช*correctly handle any  tied  rankings.*/
end        /*ช*until*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
16bit:  do k=1 for xs; newV4=word(x,k); newV5=changestr('โ'left(newV4,1),newV5,right(newV4,1)); end;  return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
init:   x= 'รร  รฅร ร'C C*C	 C+C	 C!C  C3C" ยชรฆ ยบรง ย๎ๅ๗ึณรจ โรฉ ยฌรช ยฝรซ ยซรฎ ยปรฏ โรฑ โ๎ๅ๗ึตรด โฃรน โรป โรผงป     ๘๓ฝ ๗๏๒ไ๓จ๘ฉ
abcL="abcdefghijklmnopqrstuvwxyz'"       /*ช*lowercase letters of Latin alphabet. */
abcU= abcL;            upper abcU        /*ช*uppercase version of Latin alphabet. */
accL= 'รผรฉรขรร รรรชรซรจรฏรฎรฌรฉรฆรดรรฒรปรนร๎ๅ๗ึณรกรญรณรบร'       /*ช*some lowercase accented characters.  */
accU= 'รรฉรขร๎ๅ๗ึตร รฅร'C*C+C(C/C.C,C	CC4C6C2C;C9CnewV3C!C-C3C:C1'       ฏช*  "  uppercase    "         "        ชฏ
accG= 'ฮฑรฮฯฮฃฯยตฯฮฆฮฮฉฮดฯฮต'                   /*ช*  "  upper/lowercase Greek letters.  */
ll= abcL || abcL ||accL ||accL || accG               /*ช*chars of  after letters. */
uu= abcL || abcU ||accL ||accU || accG || xrange()   /*ช*  "    " before    "     */
newV1.= 0;    q= "'";    totW= 0;    newV2.= newV1.;    c= 0;    tops= 1;          return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
rdr:   do #=0  while lines(fID)\==0; newV5=linein(fID) /*ช*loop whilst there're lines in file.*/
if pos('โ', newV5) \== 0  then call 16bit       /*ช*are there any  16-bit  characters ?*/
newV5= translate( newV5, ll, uu)                    /*ช*trans. uppercase letters to lower. */
do while newV5 \= '';    parse var  newV5  z  newV5  /*ช*process each word in the  $  line. */
parse var  z     z1  2  zr  ''  -1  zL   /*ช*obtain: first, middle, & last char.*/
if z1==q  then do; z=zr; if z==''  then iterate; end /*ช*starts with apostrophe?*/
if zL==q  then z= strip(left(z, length(z) - 1))      /*ช*ends     "       "    ?*/
if z==''  then iterate                               /*ช*if Z is now null, skip.*/
if newV1.z==0  then do;  c=c+1; newV2.c=z;  end  /*ช*bump word cnt; assign word to array*/
totW= totW + 1;      newV1.z= newV1.z + 1        /*ช*bump total words; bump a word count*/
end   /*ช*while*/
end      /*ช*#*/
say commas(totW)     ' words found  ('commas(c)    "unique)  in "    commas(#),
' records read from file: '     fID;        say;          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-frequency\word-frequency-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
