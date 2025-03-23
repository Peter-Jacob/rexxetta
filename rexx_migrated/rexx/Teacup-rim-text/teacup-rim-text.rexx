/*�*REXX pgm finds circular words (length>2),  using a dictionary,  suppress permutations.*/
parse arg iFID L .                               /*�*obtain optional arguments from the CL*/
if iFID==''|iFID==","  then iFID= 'wordlist.10k' /*�*Not specified?  Then use the default.*/
if    L==''|   L==","  then    L= 3              /*�* "      "         "   "   "     "    */
newV3= 0                                             /*�*number of words in dictionary, Len>L.*/
newV1.=                                              /*�*stemmed array of non─duplicated words*/
do r=0  while lines(iFID) \== 0           /*�*read all lines (words) in dictionary.*/
parse upper value  linein(iFID)  with z . /*�*obtain a word from the dictionary.   */
if length(z)<L | newV1.z\==''  then iterate   /*�*length must be  L  or more,  no dups.*/
if \datatype(z, 'U')       then iterate   /*�*Word contains non-letters?  Then skip*/
newV1.z = z                                   /*�*assign a word from the dictionary.   */
newV3= newV3 + 1;     newV2.newV3= z                      /*�*bump word count; append word to list.*/
end   /*�*r*/                               /*�* [↑]  dictionary need not be sorted. */
cw= 0                                            /*�*the number of circular words (so far)*/
say "There're "    r    ' entries in the dictionary (of all types):  '      iFID
say "There're "    newV3    ' words in the dictionary of at least length '      L
say
do j=1  for newV3;      x= newV2.j;      y= x     /*�*obtain the  Jth  word in the list.   */
if x==''  then iterate                    /*�*if a null, don't show variants.      */
yy= y                                     /*�*the start of a list of the variants. */
do k=1  for length(x)-1     /*�*"circulate" the litters in the word. */
y= substr(y, 2)left(y, 1)   /*�*add the left letter to the right end.*/
if newV1.y==''  then iterate j  /*�*if not a word,  then skip this word. */
yy= yy','   y               /*�*append to the list of the variants.  */
newV1.y=                        /*�*nullify word to suppress permutations*/
end   /*�*k*/
cw= cw + 1                                /*�*bump counter of circular words found.*/
say 'circular word: '     yy              /*�*display a circular word and variants.*/
end   /*�*j*/
say
say cw     ' circular words were found.'         /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Teacup-rim-text\teacup-rim-text.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
