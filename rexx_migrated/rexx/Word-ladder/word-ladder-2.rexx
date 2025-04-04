/*ͺ*REXX program finds words  (within an identified dict.)  to solve a word ladder puzzle.*/
parse arg base targ iFID .                       /*ͺ*obtain optional arguments from the CL*/
if base=='' | base=="," then base= 'boy'         /*ͺ*Not specified?  Then use the default.*/
if targ=='' | targ=="," then targ= 'man'         /*ͺ* "      "         "   "   "     "    */
if iFID=='' | iFID=="," then iFID='unixdict.txt' /*ͺ* "      "         "   "   "     "    */
abc=  'abcdefghijklmnopqrstuvwxyz'               /*ͺ*the lowercase (Latin) alphabet.      */
abcU= abc;    upper abcU                         /*ͺ* "  uppercase    "        "          */
base= lower(base);           targ= lower(targ)   /*ͺ*lowercase the BASE and also the TARG.*/
L= length(base)                               /*ͺ*length of the BASE  (in characters). */
if L<2  then call err 'base word is too small or missing'              /*ͺ*oops, too small*/
if length(targ)\==L  then call msg , "target word isn't the same length as the base word"
call letters                                     /*ͺ*assign letters,  faster than SUBSTR. */
newV4= 0                                             /*ͺ*# of words whose length matches BASE.*/
newV1.=                                              /*ͺ*default value of any dictionary word.*/
do recs=0  while lines(iFID)\==0        /*ͺ*read each word in the file  (word=X).*/
x= lower(strip( linein( iFID) ) )       /*ͺ*pick off a word from the input line. */
if length(x)\==L  then iterate          /*ͺ*Word not correct length?  Then skip. */
newV4= newV4 + 1;         newV1.x= 1                /*ͺ*bump # words with length L; semaphore*/
end   /*ͺ*recs*/                          /*ͺ* [β]   semaphore name is uppercased. */
newV2.= 0
say copies('β', 30)     recs       "words in the dictionary file: "       iFID
say copies('β', 30)       newV4        "words in the dictionary file of length: "  L
say copies('β', 30)   ' base  word is: '  base
say copies('β', 30)   'target word is: '  targ
rung= targ
newV5= base
do f=1  for m;    call look;  if result\==''  then leave      /*ͺ*Found?  Quit.*/
end   /*ͺ*f*/
say
if f>m  then call msg  'no word ladder solution possible for '   base   " βββΊ "   targ

do f-2;       newV5= base;    newV2.= 0   /*ͺ*process all the rungs that were found*/
do forever; call look;  if result\==''  then leave      /*ͺ*Found?  Quit.*/
end   /*ͺ*forever*/
end     /*ͺ*f-2*/
call show words(rung)
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
msg:  say;   if arg()==2  then say '***error*** ' arg(2);  else say arg(1);  say;  exit 13
show: say 'a solution: ' base; do j=1 to arg(1); say left('',12) word(rung,j); end; return
letters:     do m=1  for length(abc);         a.m= substr(abc, m, 1);         end;  return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
look: procedure expose newV1. newV2. a. newV5 abc base L rung targ search;        rungs= word(rung, 1)
newV3=;                                                            rungnewV4= words(rungs)
do i=1  for words(newV5);                  y= word(newV5, i);     newV2.y= 1
do k=1  for L
do n=1  for 26;  z= overlay(a.n, y, k)             /*ͺ*change a letter*/
if newV1.z==''  then iterate       /*ͺ*Is this not a word?  Then skip it. */
if newV2.z      then iterate       /*ͺ* "   "   a  repeat?    "    "   "  */
if z==rungs then rung= y rung  /*ͺ*prepend a word to the rung list.   */
if z==rungs & rungnewV4>1  then return z               /*ͺ*shortβcircuit. */
if z==targ  then return z
newV3= newV3 z                       /*ͺ*append a possible ladder word to $$*/
end   /*ͺ*n*/
end      /*ͺ*k*/
end         /*ͺ*i*/
newV5= newV3;                         return ''
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Word-ladder\word-ladder-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
