/*ช*REXX program finds the  largest  deranged word  (within an identified dictionary).    */
iFID= 'unixdict.txt';     words=0                /*ช*input file ID; number of words so far*/
wL.=0                                            /*ช*number of words of length  L.  so far*/
do while lines(iFID)\==0                   /*ช*read each word in the file  (word=X).*/
x= strip( linein( iFID) )                  /*ช*pick off a word from the input line. */
L= length(x);       if L<3 then iterate    /*ช*onesies & twosies can't possible win.*/
words= words + 1                           /*ช*bump the count of  (usable)  words.  */
newV4.words= L                                 /*ช*the length of the word found.        */
newV5.words= x                                 /*ช*save the word in an array.           */
wL.L= wL.L+1;       newV7= wL.L                /*ช*bump counter of words of length  L.  */
newV2.L.newV7= x                                  /*ช*array   of words of length  L.       */
do i=1  while x\=='';  parse var x newV6.i +1 x;  end  /*ช*i*/
call eSort L;       z=;     do j=1  for L;         z= z || newV6.j;           end  /*ช*j*/
newV1.L.newV7= z                                 /*ช*store the sorted word (letters).     */
newV3.words= newV1.L.newV7                          /*ช*store the sorted length  L  version. */
end   /*ช*while*/
a.=                                              /*ช*all the  anagrams  for word  X.      */
say copies('โ', 30)   words   'usable words in the dictionary file: '     iFID
m= 0;              n.= 0                         /*ช*# anagrams for word  X;   m=max L.   */
do j=1  for words                         /*ช*process usable words that were found.*/
Lx= newV4.j;   if Lx<m  then iterate          /*ช*get length of word; skip if too short*/
x= newV5.j;    xs= newV3.j                       /*ช*get some vital statistics for  X     */
do k=1  for wL.Lx                     /*ช*process all the words of length  L.  */
if xs\== newV1.Lx.k  then iterate       /*ช*is this not a true anagram of  X ?   */
if x  ==  newV2.Lx.k  then iterate       /*ช*skip of processing anagram on itself.*/
do c=1  for Lx                   /*ช*ensure no character position shared. */
if substr(newV5.j, c, 1) == substr(newV2.Lx.k, c, 1)  then iterate k
end   /*ช*c*/                      /*ช* [+]  now compare the rest of chars. */
n.j= n.j + 1;     a.j= a.j   newV2.Lx.k  /*ช*bump counter;  then add โโโบ anagrams.*/
m= max(m, Lx)                         /*ช*M  is the maximum length of a word.  */
end        /*ช*k*/
end            /*ช*j*/

do k=1  for words                             /*ช*now, search all words for the maximum*/
if newV4.k==m   then if n.k\==0   then if word(a.k, 1) > newV5.k  then say  newV5.k  a.k
end   /*ช*k*/                                   /*ช* [โ]  REXX has no short-circuits.    */
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
eSort: procedure expose newV6.;  parse arg ho 1 h    /*ช*obtain number of elements; also copy.*/
do while h>1;      h=h % 2;                    do i=1  for ho-h;   j= i;   k= h+i
do while newV6.k<newV6.j;  t=newV6.j;  newV6.j=newV6.k;  newV6.k=t;   if h>=j  then leave;  j=j-h;  k=k-h
end   /*ช*while !.kยทยทยท*/;         end  /*ช*i*/;         end  /*ช*while h>1*/;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anagrams-Deranged-anagrams\anagrams-deranged-anagrams.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
