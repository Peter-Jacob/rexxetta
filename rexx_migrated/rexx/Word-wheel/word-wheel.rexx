/*ͺ*REXX pgm finds (dictionary) words which can be found in a specified word wheel (grid).*/
parse arg grid minL iFID .                       /*ͺ*obtain optional arguments from the CL*/
if grid==''|grid==","  then grid= 'ndeokgelw'    /*ͺ*Not specified?  Then use the default.*/
if minL==''|minL==","  then minL= 3              /*ͺ* "      "         "   "   "     "    */
if iFID==''|iFID==","  then iFID= 'UNIXDICT.TXT' /*ͺ* "      "         "   "   "     "    */
oMinL= minL;                minL= abs(minL)      /*ͺ*if negative, then don't show a list. */
gridU= grid;  upper gridU                        /*ͺ*get an uppercase version of the grid.*/
Lg= length(grid);           Hg= Lg % 2  +  1     /*ͺ*get length of grid & the middle char.*/
ctr= substr(grid, Hg, 1);   upper ctr            /*ͺ*get uppercase center letter in grid. */
wrds= 0                                          /*ͺ*# words that are in the dictionary.  */
wees= 0                                          /*ͺ*"   "     "   "  too short.          */
bigs= 0                                          /*ͺ*"   "     "   "  too long.           */
dups= 0                                          /*ͺ*"   "     "   "  duplicates.         */
ills= 0                                          /*ͺ*"   "     "   contain  "not" letters.*/
good= 0                                          /*ͺ*"   "     "   contain center letter. */
nine= 0                                          /*ͺ*" wheelβwords that contain 9 letters.*/
say '                                Reading the file: ' iFID         /*ͺ*align the text. */
newV1.= .                                            /*ͺ*uppercase nonβduplicated dict. words.*/
newV3=                                               /*ͺ*the list of dictionary words in grid.*/
do recs=0  while lines(iFID)\==0            /*ͺ*process all words in the dictionary. */
u= space( linein(iFID), 0);   upper u       /*ͺ*elide blanks;  uppercase the word.   */
L= length(u)                                /*ͺ*obtain the length of the word.       */
if newV1.u\==.           then do; dups= dups+1; iterate; end  /*ͺ*is this a duplicate?   */
if L<minL            then do; wees= wees+1; iterate; end  /*ͺ*is the word too short? */
if L>Lg              then do; bigs= bigs+1; iterate; end  /*ͺ*is the word too long?  */
if \datatype(u,'M')  then do; ills= ills+1; iterate; end  /*ͺ*has word nonβletters?  */
newV1.u=                                        /*ͺ*signify that  U  is a dictionary word*/
wrds= wrds + 1                              /*ͺ*bump the number of "good" dist. words*/
if pos(ctr, u)==0        then iterate       /*ͺ*word doesn't have center grid letter.*/
good= good + 1                              /*ͺ*bump # centerβletter words in dict.  */
if verify(u, gridU)\==0  then iterate       /*ͺ*word contains a letter not in grid.  */
if pruned(u, gridU)      then iterate       /*ͺ*have all the letters not been found? */
if L==9  then nine= nine + 1                /*ͺ*bump # words that have nine letters. */
newV3= newV3 u                                      /*ͺ*add this word to the "found" list.   */
end   /*ͺ*recs*/
say
say '    number of  records (words) in the dictionary: '   right( commas(recs), 9)
say '    number of illβformed words in the dictionary: '   right( commas(ills), 9)
say '    number of  duplicate words in the dictionary: '   right( commas(dups), 9)
say '    number of  tooβsmall words in the dictionary: '   right( commas(wees), 9)
say '    number of  tooβlong  words in the dictionary: '   right( commas(bigs), 9)
say '    number of acceptable words in the dictionary: '   right( commas(wrds), 9)
say '    number centerβletter words in the dictionary: '   right( commas(good), 9)
say '    the minimum length of words that can be used: '   right( commas(minL), 9)
say '                the word wheel (grid) being used: '   grid
say '      center of the word wheel (grid) being used: '   right('β', Hg)
say;  newV4= words(newV3);   newV3= strip(newV3)
say '    number of word wheel words in the dictionary: '   right( commas(newV4   ), 9)
say '    number of   nine-letter   wheel words  found: '   right( commas(nine), 9)
if newV4==0  |  oMinL<0  then exit newV4
say
say '    The list of word wheel words found:';   say copies('β', length(newV3));  say lower(newV3)
exit newV4                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
lower:  arg aa; newV5='abcdefghijklmnopqrstuvwxyz'; newV2=newV5; upper newV2;  return translate(aa,newV5,newV2)
commas: parse arg newV6;  do jc=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, jc); end;  return newV6
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pruned: procedure; parse arg aa,gg               /*ͺ*obtain word to be tested, & the grid.*/
do n=1  for length(aa);    p= pos( substr(aa,n,1), gg);  if p==0  then return 1
gg= overlay(., gg, p)                 /*ͺ*"rub out" the found character in grid*/
end   /*ͺ*n*/;               return 0   /*ͺ*signify that the  AA  passed the test*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-wheel\word-wheel.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
