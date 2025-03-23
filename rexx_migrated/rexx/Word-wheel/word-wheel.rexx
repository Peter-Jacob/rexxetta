/*�*REXX pgm finds (dictionary) words which can be found in a specified word wheel (grid).*/
parse arg grid minL iFID .                       /*�*obtain optional arguments from the CL*/
if grid==''|grid==","  then grid= 'ndeokgelw'    /*�*Not specified?  Then use the default.*/
if minL==''|minL==","  then minL= 3              /*�* "      "         "   "   "     "    */
if iFID==''|iFID==","  then iFID= 'UNIXDICT.TXT' /*�* "      "         "   "   "     "    */
oMinL= minL;                minL= abs(minL)      /*�*if negative, then don't show a list. */
gridU= grid;  upper gridU                        /*�*get an uppercase version of the grid.*/
Lg= length(grid);           Hg= Lg % 2  +  1     /*�*get length of grid & the middle char.*/
ctr= substr(grid, Hg, 1);   upper ctr            /*�*get uppercase center letter in grid. */
wrds= 0                                          /*�*# words that are in the dictionary.  */
wees= 0                                          /*�*"   "     "   "  too short.          */
bigs= 0                                          /*�*"   "     "   "  too long.           */
dups= 0                                          /*�*"   "     "   "  duplicates.         */
ills= 0                                          /*�*"   "     "   contain  "not" letters.*/
good= 0                                          /*�*"   "     "   contain center letter. */
nine= 0                                          /*�*" wheel─words that contain 9 letters.*/
say '                                Reading the file: ' iFID         /*�*align the text. */
newV1.= .                                            /*�*uppercase non─duplicated dict. words.*/
newV3=                                               /*�*the list of dictionary words in grid.*/
do recs=0  while lines(iFID)\==0            /*�*process all words in the dictionary. */
u= space( linein(iFID), 0);   upper u       /*�*elide blanks;  uppercase the word.   */
L= length(u)                                /*�*obtain the length of the word.       */
if newV1.u\==.           then do; dups= dups+1; iterate; end  /*�*is this a duplicate?   */
if L<minL            then do; wees= wees+1; iterate; end  /*�*is the word too short? */
if L>Lg              then do; bigs= bigs+1; iterate; end  /*�*is the word too long?  */
if \datatype(u,'M')  then do; ills= ills+1; iterate; end  /*�*has word non─letters?  */
newV1.u=                                        /*�*signify that  U  is a dictionary word*/
wrds= wrds + 1                              /*�*bump the number of "good" dist. words*/
if pos(ctr, u)==0        then iterate       /*�*word doesn't have center grid letter.*/
good= good + 1                              /*�*bump # center─letter words in dict.  */
if verify(u, gridU)\==0  then iterate       /*�*word contains a letter not in grid.  */
if pruned(u, gridU)      then iterate       /*�*have all the letters not been found? */
if L==9  then nine= nine + 1                /*�*bump # words that have nine letters. */
newV3= newV3 u                                      /*�*add this word to the "found" list.   */
end   /*�*recs*/
say
say '    number of  records (words) in the dictionary: '   right( commas(recs), 9)
say '    number of ill─formed words in the dictionary: '   right( commas(ills), 9)
say '    number of  duplicate words in the dictionary: '   right( commas(dups), 9)
say '    number of  too─small words in the dictionary: '   right( commas(wees), 9)
say '    number of  too─long  words in the dictionary: '   right( commas(bigs), 9)
say '    number of acceptable words in the dictionary: '   right( commas(wrds), 9)
say '    number center─letter words in the dictionary: '   right( commas(good), 9)
say '    the minimum length of words that can be used: '   right( commas(minL), 9)
say '                the word wheel (grid) being used: '   grid
say '      center of the word wheel (grid) being used: '   right('↑', Hg)
say;  newV4= words(newV3);   newV3= strip(newV3)
say '    number of word wheel words in the dictionary: '   right( commas(newV4   ), 9)
say '    number of   nine-letter   wheel words  found: '   right( commas(nine), 9)
if newV4==0  |  oMinL<0  then exit newV4
say
say '    The list of word wheel words found:';   say copies('─', length(newV3));  say lower(newV3)
exit newV4                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
lower:  arg aa; newV5='abcdefghijklmnopqrstuvwxyz'; newV2=newV5; upper newV2;  return translate(aa,newV5,newV2)
commas: parse arg newV6;  do jc=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, jc); end;  return newV6
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pruned: procedure; parse arg aa,gg               /*�*obtain word to be tested, & the grid.*/
do n=1  for length(aa);    p= pos( substr(aa,n,1), gg);  if p==0  then return 1
gg= overlay(., gg, p)                 /*�*"rub out" the found character in grid*/
end   /*�*n*/;               return 0   /*�*signify that the  AA  passed the test*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-wheel\word-wheel.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
