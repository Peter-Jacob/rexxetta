/*�*REXX pgm displays top 10 words in a file (includes foreign letters),  case is ignored.*/
parse arg fID top .                              /*�*obtain optional arguments from the CL*/
if fID=='' | fID==","  then fID= 'les_mes.txt'   /*�*None specified? Then use the default.*/
if top=='' | top==","  then top= 10              /*�*  "      "        "   "   "     "    */
call init                                        /*�*initialize varied bunch of variables.*/
call rdr
say right('word', 40)  " "  center(' rank ', 6)  "  count "   /*�*display title for output*/
say right('════', 40)  " "  center('══════', 6)  " ═══════"   /*�*   "    title separator.*/

do  until otops==tops | tops>top            /*�*process enough words to satisfy  TOP.*/
WL=;         mk= 0;    otops= tops          /*�*initialize the word list (to a NULL).*/

do n=1  for c;    z= newV2.n;      k= newV1.z  /*�*process the list of words in the file*/
if k==mk  then WL= WL z                /*�*handle cases of tied number of words.*/
if k> mk  then do;  mk=k;  WL=z;  end  /*�*this word count is the current max.  */
end   /*�*n*/

wr= max( length(' rank '), length(top) )    /*�*find the maximum length of the rank #*/

do d=1  for words(WL);  y= word(WL, d) /*�*process all words in the  word list. */
if d==1  then w= max(10, length(newV1.y) ) /*�*use length of the first number used. */
say right(y, 40)         right( commas(tops), wr)          right(commas(newV1.y), w)
newV1.y= .                                 /*�*nullify word count for next go 'round*/
end   /*�*d*/                            /*�* [↑]  this allows a non-sorted list. */

tops= tops + words(WL)                      /*�*correctly handle any  tied  rankings.*/
end        /*�*until*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
16bit:  do k=1 for xs; newV4=word(x,k); newV5=changestr('├'left(newV4,1),newV5,right(newV4,1)); end;  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init:   x= 'Çà åÅ �'C�C*C	�C+C	�C!C �C3C" ªæ ºç ����ֳè ⌐é ¬ê ½ë «î »ï ▒ñ ����ֵô ╣ù ╗û ╝ü����������������
abcL="abcdefghijklmnopqrstuvwxyz'"       /*�*lowercase letters of Latin alphabet. */
abcU= abcL;            upper abcU        /*�*uppercase version of Latin alphabet. */
accL= 'üéâÄàÅÇêëèïîìéæôÖòûù����ֳáíóúÑ'       /*�*some lowercase accented characters.  */
accU= 'Üéâ����ֵàå�'C*C+C(C/C.C,C	CC4C6C2C;C9CnewV3C!C-C3C:C1'���������*  "  uppercase    "         "        ��
accG= 'αßΓπΣσµτΦΘΩδφε'                   /*�*  "  upper/lowercase Greek letters.  */
ll= abcL || abcL ||accL ||accL || accG               /*�*chars of  after letters. */
uu= abcL || abcU ||accL ||accU || accG || xrange()   /*�*  "    " before    "     */
newV1.= 0;    q= "'";    totW= 0;    newV2.= newV1.;    c= 0;    tops= 1;          return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rdr:   do #=0  while lines(fID)\==0; newV5=linein(fID) /*�*loop whilst there're lines in file.*/
if pos('├', newV5) \== 0  then call 16bit       /*�*are there any  16-bit  characters ?*/
newV5= translate( newV5, ll, uu)                    /*�*trans. uppercase letters to lower. */
do while newV5 \= '';    parse var  newV5  z  newV5  /*�*process each word in the  $  line. */
parse var  z     z1  2  zr  ''  -1  zL   /*�*obtain: first, middle, & last char.*/
if z1==q  then do; z=zr; if z==''  then iterate; end /*�*starts with apostrophe?*/
if zL==q  then z= strip(left(z, length(z) - 1))      /*�*ends     "       "    ?*/
if z==''  then iterate                               /*�*if Z is now null, skip.*/
if newV1.z==0  then do;  c=c+1; newV2.c=z;  end  /*�*bump word cnt; assign word to array*/
totW= totW + 1;      newV1.z= newV1.z + 1        /*�*bump total words; bump a word count*/
end   /*�*while*/
end      /*�*#*/
say commas(totW)     ' words found  ('commas(c)    "unique)  in "    commas(#),
' records read from file: '     fID;        say;          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-frequency\word-frequency-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
