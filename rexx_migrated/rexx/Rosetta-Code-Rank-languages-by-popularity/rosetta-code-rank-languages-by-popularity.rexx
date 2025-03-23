/*�*REXX program reads two files  and  displays a  ranked list  of Rosetta Code languages.*/
parse arg catFID lanFID outFID .                 /*�*obtain optional arguments from the CL*/
call init                                        /*�*initialize some  REXX  variables.    */
call get                                         /*�*obtain data from two separate files. */
call eSort newV11,0                                   /*�*sort languages along with members.   */
call tSort                                       /*�*  "      "     that are tied in rank.*/
call eSort newV11,1                                   /*�*  "      "     along with members.   */
call out                                         /*�*create the  RC_POP.OUT (output) file.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV9;   do jc=length(newV9)-3  to 1  by -3; newV9= insert(",",newV9,jc); end;  return newV9
s:      if arg(1)==1  then return arg(3);      return word(arg(2) 's',1)   /*�*pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eSort: procedure expose newV6. newV5. !tr.;    arg N,p2;     h= N      /*�*sort: number of members*/
do     while  h>1;         h= h % 2                /*�*halve number of records*/
do i=1  for N-h;         j= i;         k= h + i  /*�*sort this part of list.*/
if p2  then do  while newV2.k==newV2.j  &  newV5.k>newV5.j   /*�*this uses a hard swap ↓*/
newV10= newV5.j;  newV11= newV2.j;  newV5.j= newV5.k;  newV2.j= newV2.k;   newV5.k= newV10;  newV2.k= newV11
if h>=j  then leave;               j= j - h;     k= k - h
end   /*�*while !tR.k==···*/
else do  while newV6.k<newV6.j                    /*�*this uses a hard swap ↓*/
newV10= newV5.j;  newV11= newV6.j;    newV5.j= newV5.k;    newV6.j= newV6.k;     newV5.k= newV10;    newV6.k= newV11
if h>=j  then leave;               j= j - h;     k= k - h
end   /*�*while #.k<···*/
end               /*�*i*/           /*�*hard swaps needed for embedded blanks.*/
end                 /*�*while h>1*/;               return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
get: langs= 0;           call rdr 'languages'    /*�*assign languages  ───►  L.ααα        */
call rdr 'categories'   /*�*append categories ───► catHeap       */
newV11= 0
do j=1  until  catHeap==''            /*�*process the heap of categories.      */
parse var catHeap cat.j newV1 catHeap /*�*get a category from the  catHeap.    */
parse var cat.j  cat.j '<' "(" mems . /*�*untangle the strange─looking string. */
cat.j= space(cat.j); newV12=cat.j; upper newV12 /*�*remove any superfluous blanks.       */
if newV12=='' | \L.newV12          then iterate /*�*it's blank  or  it's not a language. */
if pos(',', mems)\==0    then mems= space(translate(mems,,","), 0) /*�*¬commas.*/
if \datatype(mems, 'W')  then iterate /*�*is the "members" number not numeric? */
newV6.0= newV6.0 + mems                       /*�*bump the number of  members  found.  */
if u.newV12\==0  then do;     do f=1  for newV11  until newV12==newV4.f
end   /*�*f*/
newV6.f= newV6.f + mems; iterate j   /*�*languages in different cases.*/
end                  /*�* [↑]  handle any possible duplicates.*/
u.newV12= u.newV12 + 1;       newV11= newV11 + 1          /*�*bump a couple of counters.           */
newV6.newV11= newV6.newV11 + mems;  newV5.newV11= cat.j;  newV4.newV11=newV12 /*�*bump the counter;  assign it (upper).*/
end   /*�*j*/

newV7.=;        newV3= '(total) number of'       /*�*array holds indication of TIED langs.*/
call tell right(commas(newV11),    9) newV3 'languages detected in the category file'
call tell right(commas(langs),9) '   "       "    "     "         "     "  "  language   "
call tell right(commas(newV6.0),  9) newV3 'entries (solutions) detected', , 1;    term= 0
return                                      /*�*don't show any more msgs──►term. [↑] */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init: sep= '█';  L.=0;  newV6.=0;  u.=newV6.;  catHeap=;  term=1;  old.= /*�*assign some REXX vars*/
if catFID==''  then catFID= "RC_POP.CAT"   /*�*Not specified?  Then use the default.*/
if lanFID==''  then lanFID= "RC_POP.LAN"   /*�* "      "         "   "   "     "    */
if outFID==''  then outFID= "RC_POP.OUT"   /*�* "      "         "   "   "     "    */
call tell center('timestamp: '  date()  time("Civil"),79,'═'), 2, 1;      return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
out:  w= length( commas(newV11) );     rank= 0        /*�* [↓]  show by ascending rank of lang.*/
do t=newV11  by -1  for newV11;   rank= rank + 1 /*�*bump rank of a programming language. */
call tell   right('rank:'    right(commas(newV2.t), w),  20-1)      right(newV7.t, 7),
right('('commas(newV6.t)  left("entr"s(newV6.t, 'ies', "y")')', 9), 20)  newV5.t
end   /*�*#*/                            /*�* [↑]   S(···)   pluralizes a word.   */
call tell left('', 27)  "☼  end─of─list.  ☼", 1, 2;      return    /*�*bottom title.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rdr:  arg which 2;        igAst= 1               /*�*ARG uppers WHICH, obtain the 1st char*/
if which=='L'  then inFID= lanFID          /*�*use this fileID for the  languages.  */
if which=='C'  then inFID= catFID          /*�* "    "     "    "   "   categories. */
Uyir=  'α«ëα«»α«┐α«░α»ì/Uyir'              /*�*Unicode (in text)  name for  Uyir    */
old.0= '╬����ֱ�C++'     ;    new.0= "µC++"      /*�*Unicode ╬����ֱ�C++  ───► ASCII─8: µC++    */
old.1= 'UC++'      ;    new.1= "µC++"      /*�*old      UC++  ───► ASCII─8: µC++    */
old.2= '╨����ֱ�╨Ü-'     ;    new.2= "MK-"       /*�*Unicode ╨����ֱ�╨Ü─  ───► ASCII-8: MK-     */
old.3= 'D├⌐j├á'    ;    new.3= "Déjà"      /*�*Unicode ├⌐j├á  ───► ASCII─8: Déjà    */
old.4= 'Cach├⌐'    ;    new.4= "Caché"     /*�*Unicode Cach├⌐ ───► ASCII─8: Caché   */
old.5= '??-61/52'  ;    new.5= "MK-61/52"  /*�*somewhere past, a mis─translated: MK-*/
old.6= 'F┼ìrmul├ª' ;    new.6= 'Fôrmulæ'   /*�*Unicode        ───► ASCII─8: Fôrmulæ */
old.7= '╨����ֱ�iniZinc' ;    new.7= 'MiniZinc'  /*�*Unicode        ───► ASCII─8: MiniZinc*/
old.8=  Uyir       ;    new.8= 'Uyir'      /*�*Unicode        ───► ASCII─8: Uyir    */
old.9= 'Perl 6'    ;    new.9= 'Raku'      /*�* (old name)    ───► (new name)       */

do recs=0   while  lines(inFID) \== 0    /*�*read a file, a single line at a time.*/
newV13= translate( linein(inFID), , '9'x)     /*�*handle any stray  TAB  ('09'x) chars.*/
newV8= space(newV13);   if newV8==''  then iterate  /*�*ignore all blank lines in the file(s)*/
do v=0  while old.v \== ''       /*�*translate Unicode variations of langs*/
if pos(old.v, newV8) \==0  then newV8= changestr(old.v, newV8, new.v)
end   /*�*v*/                      /*�* [↑]  handle different lang spellings*/
if igAst  then do;  igAst= pos(' * ', newV13)==0;      if igAst  then iterate;      end
if pos('RETRIEVED FROM', translate(newV8))\==0  then leave   /*�*pseudo End─Of─Data?.*/
if which=='L'  then do;  if left(newV8, 1)\=="*"  then iterate  /*�*lang ¬legitimate?*/
parse upper var   newV8   '*'  newV8  "<";    newV8= space(newV8)
if newV8==''  then iterate;                L.newV8= 1
langs= langs + 1     /*�*bump number of languages found. */
iterate
end                  /*�* [↓]  extract computer language name.*/
if left(newV8, 1)=='*'  then newV8= sep  ||  space( substr(newV8, 2) )
catHeap= catHeap  newV8                     /*�*append to the catHeap (CATegory) heap*/
end   /*�*recs*/
call  tell   right( commas(recs), 9)       'records read from file: '        inFID
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell:          do '0'arg(2);   call lineout outFID," "     ;   if term  then say ;     end
call lineout outFID,arg(1)  ;   if term  then say arg(1)
do '0'arg(3);   call lineout outFID," "     ;   if term  then say ;     end
return       /*�*show BEFORE blank lines (if any), message, show AFTER blank lines.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tSort: tied=;                            r= 0    /*�*add true rank (tR) ───► the entries. */
do j=newV11  by -1  for newV11;     r= r+1;   tR= r;   newV2.j= r;   jp= j+1;   jm= j-1
if tied==''  then pR= r;  tied=   /*�*handle when language rank is untied. */
if newV6.j==newV6.jp | newV6.j==newV6.jm  then do;    newV7.j= '[tied]';     tied= newV7.j;     end
if newV6.j==newV6.jp              then do;    tR= pR;            newV2.j= pR;     end
else pR= r
end   /*�*j*/;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rosetta-Code-Rank-languages-by-popularity\rosetta-code-rank-languages-by-popularity.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
