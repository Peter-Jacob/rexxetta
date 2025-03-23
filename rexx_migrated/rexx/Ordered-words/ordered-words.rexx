/*�*REXX program  lists  (the longest)  ordered word(s)  from a  supplied  dictionary.    */
iFID= 'UNIXDICT.TXT'                             /*�*the filename of the word dictionary. */
m= 1                                             /*�*maximum length of an ordered word(s).*/
call linein iFID, 1, 0                           /*�*point to the first word in dictionary*/
newV1.=                                              /*�*placeholder array for list of words. */
do j=1  while lines(iFID)\==0; x=linein(iFID) /*�*keep reading until file is exhausted.*/
w= length(x);       if w<m  then iterate      /*�*Word not long enough? Then ignore it.*/
if \datatype(x, 'M')        then iterate      /*�*Is it not a letter?  Then ignore it. */
parse upper var  x      xU  1  z  2           /*�*get uppercase version of X & 1st char*/
do k=2  for w-1;    newV2= substr(xU, k, 1)  /*�*process each letter in uppercase word*/
if newV2<z  then iterate j                   /*�*is letter < than the previous letter?*/
z= newV2                                     /*�*we have a newer current letter.      */
end   /*�*k*/                              /*�* [↑]  logic includes  ≥  order.      */
m= w                                          /*�*maybe define a new maximum length.   */
newV1.w= newV1.w  x                                   /*�*add the original word to a word list.*/
end   /*�*j*/                                   /*�*the 1st DO needs an index for ITERATE*/
newV3= words(newV1.m)                      /*�*just a handy─dandy variable to have. */
say newV3  'word's(newV3)  "found (of length" m')';  say /*�*show the number of words and length. */
do n=1  for newV3;   say word(newV1.m, n);   end /*�*display all the words, one to a line.*/
exit                                             /*�*stick a fork in it,  we're all done. */
ghijk
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:  if arg(1)==1  then return '';   return "s"   /*�*a simple pluralizer (merely adds "S")*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ordered-words\ordered-words.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
