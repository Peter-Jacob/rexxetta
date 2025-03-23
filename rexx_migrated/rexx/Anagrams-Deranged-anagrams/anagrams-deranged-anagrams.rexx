/*�*REXX program finds the  largest  deranged word  (within an identified dictionary).    */
iFID= 'unixdict.txt';     words=0                /*�*input file ID; number of words so far*/
wL.=0                                            /*�*number of words of length  L.  so far*/
do while lines(iFID)\==0                   /*�*read each word in the file  (word=X).*/
x= strip( linein( iFID) )                  /*�*pick off a word from the input line. */
L= length(x);       if L<3 then iterate    /*�*onesies & twosies can't possible win.*/
words= words + 1                           /*�*bump the count of  (usable)  words.  */
newV4.words= L                                 /*�*the length of the word found.        */
newV5.words= x                                 /*�*save the word in an array.           */
wL.L= wL.L+1;       newV7= wL.L                /*�*bump counter of words of length  L.  */
newV2.L.newV7= x                                  /*�*array   of words of length  L.       */
do i=1  while x\=='';  parse var x newV6.i +1 x;  end  /*�*i*/
call eSort L;       z=;     do j=1  for L;         z= z || newV6.j;           end  /*�*j*/
newV1.L.newV7= z                                 /*�*store the sorted word (letters).     */
newV3.words= newV1.L.newV7                          /*�*store the sorted length  L  version. */
end   /*�*while*/
a.=                                              /*�*all the  anagrams  for word  X.      */
say copies('─', 30)   words   'usable words in the dictionary file: '     iFID
m= 0;              n.= 0                         /*�*# anagrams for word  X;   m=max L.   */
do j=1  for words                         /*�*process usable words that were found.*/
Lx= newV4.j;   if Lx<m  then iterate          /*�*get length of word; skip if too short*/
x= newV5.j;    xs= newV3.j                       /*�*get some vital statistics for  X     */
do k=1  for wL.Lx                     /*�*process all the words of length  L.  */
if xs\== newV1.Lx.k  then iterate       /*�*is this not a true anagram of  X ?   */
if x  ==  newV2.Lx.k  then iterate       /*�*skip of processing anagram on itself.*/
do c=1  for Lx                   /*�*ensure no character position shared. */
if substr(newV5.j, c, 1) == substr(newV2.Lx.k, c, 1)  then iterate k
end   /*�*c*/                      /*�* [+]  now compare the rest of chars. */
n.j= n.j + 1;     a.j= a.j   newV2.Lx.k  /*�*bump counter;  then add ──► anagrams.*/
m= max(m, Lx)                         /*�*M  is the maximum length of a word.  */
end        /*�*k*/
end            /*�*j*/

do k=1  for words                             /*�*now, search all words for the maximum*/
if newV4.k==m   then if n.k\==0   then if word(a.k, 1) > newV5.k  then say  newV5.k  a.k
end   /*�*k*/                                   /*�* [↑]  REXX has no short-circuits.    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eSort: procedure expose newV6.;  parse arg ho 1 h    /*�*obtain number of elements; also copy.*/
do while h>1;      h=h % 2;                    do i=1  for ho-h;   j= i;   k= h+i
do while newV6.k<newV6.j;  t=newV6.j;  newV6.j=newV6.k;  newV6.k=t;   if h>=j  then leave;  j=j-h;  k=k-h
end   /*�*while !.k···*/;         end  /*�*i*/;         end  /*�*while h>1*/;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anagrams-Deranged-anagrams\anagrams-deranged-anagrams.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
