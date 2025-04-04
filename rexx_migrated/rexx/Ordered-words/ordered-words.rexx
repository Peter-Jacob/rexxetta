/*ͺ*REXX program  lists  (the longest)  ordered word(s)  from a  supplied  dictionary.    */
iFID= 'UNIXDICT.TXT'                             /*ͺ*the filename of the word dictionary. */
m= 1                                             /*ͺ*maximum length of an ordered word(s).*/
call linein iFID, 1, 0                           /*ͺ*point to the first word in dictionary*/
newV1.=                                              /*ͺ*placeholder array for list of words. */
do j=1  while lines(iFID)\==0; x=linein(iFID) /*ͺ*keep reading until file is exhausted.*/
w= length(x);       if w<m  then iterate      /*ͺ*Word not long enough? Then ignore it.*/
if \datatype(x, 'M')        then iterate      /*ͺ*Is it not a letter?  Then ignore it. */
parse upper var  x      xU  1  z  2           /*ͺ*get uppercase version of X & 1st char*/
do k=2  for w-1;    newV2= substr(xU, k, 1)  /*ͺ*process each letter in uppercase word*/
if newV2<z  then iterate j                   /*ͺ*is letter < than the previous letter?*/
z= newV2                                     /*ͺ*we have a newer current letter.      */
end   /*ͺ*k*/                              /*ͺ* [β]  logic includes  β₯  order.      */
m= w                                          /*ͺ*maybe define a new maximum length.   */
newV1.w= newV1.w  x                                   /*ͺ*add the original word to a word list.*/
end   /*ͺ*j*/                                   /*ͺ*the 1st DO needs an index for ITERATE*/
newV3= words(newV1.m)                      /*ͺ*just a handyβdandy variable to have. */
say newV3  'word's(newV3)  "found (of length" m')';  say /*ͺ*show the number of words and length. */
do n=1  for newV3;   say word(newV1.m, n);   end /*ͺ*display all the words, one to a line.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
ghijk
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
s:  if arg(1)==1  then return '';   return "s"   /*ͺ*a simple pluralizer (merely adds "S")*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ordered-words\ordered-words.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
