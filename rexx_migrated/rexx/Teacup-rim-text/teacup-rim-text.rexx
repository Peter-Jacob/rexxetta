/*ª*REXX pgm finds circular words (length>2),  using a dictionary,  suppress permutations.*/
parse arg iFID L .                               /*ª*obtain optional arguments from the CL*/
if iFID==''|iFID==","  then iFID= 'wordlist.10k' /*ª*Not specified?  Then use the default.*/
if    L==''|   L==","  then    L= 3              /*ª* "      "         "   "   "     "    */
newV3= 0                                             /*ª*number of words in dictionary, Len>L.*/
newV1.=                                              /*ª*stemmed array of nonâ”€duplicated words*/
do r=0  while lines(iFID) \== 0           /*ª*read all lines (words) in dictionary.*/
parse upper value  linein(iFID)  with z . /*ª*obtain a word from the dictionary.   */
if length(z)<L | newV1.z\==''  then iterate   /*ª*length must be  L  or more,  no dups.*/
if \datatype(z, 'U')       then iterate   /*ª*Word contains non-letters?  Then skip*/
newV1.z = z                                   /*ª*assign a word from the dictionary.   */
newV3= newV3 + 1;     newV2.newV3= z                      /*ª*bump word count; append word to list.*/
end   /*ª*r*/                               /*ª* [â†‘]  dictionary need not be sorted. */
cw= 0                                            /*ª*the number of circular words (so far)*/
say "There're "    r    ' entries in the dictionary (of all types):  '      iFID
say "There're "    newV3    ' words in the dictionary of at least length '      L
say
do j=1  for newV3;      x= newV2.j;      y= x     /*ª*obtain the  Jth  word in the list.   */
if x==''  then iterate                    /*ª*if a null, don't show variants.      */
yy= y                                     /*ª*the start of a list of the variants. */
do k=1  for length(x)-1     /*ª*"circulate" the litters in the word. */
y= substr(y, 2)left(y, 1)   /*ª*add the left letter to the right end.*/
if newV1.y==''  then iterate j  /*ª*if not a word,  then skip this word. */
yy= yy','   y               /*ª*append to the list of the variants.  */
newV1.y=                        /*ª*nullify word to suppress permutations*/
end   /*ª*k*/
cw= cw + 1                                /*ª*bump counter of circular words found.*/
say 'circular word: '     yy              /*ª*display a circular word and variants.*/
end   /*ª*j*/
say
say cw     ' circular words were found.'         /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Teacup-rim-text\teacup-rim-text.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
