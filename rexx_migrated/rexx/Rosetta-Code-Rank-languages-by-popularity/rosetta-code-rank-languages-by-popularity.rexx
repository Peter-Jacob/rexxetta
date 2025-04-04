/*ͺ*REXX program reads two files  and  displays a  ranked list  of Rosetta Code languages.*/
parse arg catFID lanFID outFID .                 /*ͺ*obtain optional arguments from the CL*/
call init                                        /*ͺ*initialize some  REXX  variables.    */
call get                                         /*ͺ*obtain data from two separate files. */
call eSort newV11,0                                   /*ͺ*sort languages along with members.   */
call tSort                                       /*ͺ*  "      "     that are tied in rank.*/
call eSort newV11,1                                   /*ͺ*  "      "     along with members.   */
call out                                         /*ͺ*create the  RC_POP.OUT (output) file.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV9;   do jc=length(newV9)-3  to 1  by -3; newV9= insert(",",newV9,jc); end;  return newV9
s:      if arg(1)==1  then return arg(3);      return word(arg(2) 's',1)   /*ͺ*pluralizer.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eSort: procedure expose newV6. newV5. !tr.;    arg N,p2;     h= N      /*ͺ*sort: number of members*/
do     while  h>1;         h= h % 2                /*ͺ*halve number of records*/
do i=1  for N-h;         j= i;         k= h + i  /*ͺ*sort this part of list.*/
if p2  then do  while newV2.k==newV2.j  &  newV5.k>newV5.j   /*ͺ*this uses a hard swap β*/
newV10= newV5.j;  newV11= newV2.j;  newV5.j= newV5.k;  newV2.j= newV2.k;   newV5.k= newV10;  newV2.k= newV11
if h>=j  then leave;               j= j - h;     k= k - h
end   /*ͺ*while !tR.k==Β·Β·Β·*/
else do  while newV6.k<newV6.j                    /*ͺ*this uses a hard swap β*/
newV10= newV5.j;  newV11= newV6.j;    newV5.j= newV5.k;    newV6.j= newV6.k;     newV5.k= newV10;    newV6.k= newV11
if h>=j  then leave;               j= j - h;     k= k - h
end   /*ͺ*while #.k<Β·Β·Β·*/
end               /*ͺ*i*/           /*ͺ*hard swaps needed for embedded blanks.*/
end                 /*ͺ*while h>1*/;               return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
get: langs= 0;           call rdr 'languages'    /*ͺ*assign languages  ββββΊ  L.Ξ±Ξ±Ξ±        */
call rdr 'categories'   /*ͺ*append categories ββββΊ catHeap       */
newV11= 0
do j=1  until  catHeap==''            /*ͺ*process the heap of categories.      */
parse var catHeap cat.j newV1 catHeap /*ͺ*get a category from the  catHeap.    */
parse var cat.j  cat.j '<' "(" mems . /*ͺ*untangle the strangeβlooking string. */
cat.j= space(cat.j); newV12=cat.j; upper newV12 /*ͺ*remove any superfluous blanks.       */
if newV12=='' | \L.newV12          then iterate /*ͺ*it's blank  or  it's not a language. */
if pos(',', mems)\==0    then mems= space(translate(mems,,","), 0) /*ͺ*Β¬commas.*/
if \datatype(mems, 'W')  then iterate /*ͺ*is the "members" number not numeric? */
newV6.0= newV6.0 + mems                       /*ͺ*bump the number of  members  found.  */
if u.newV12\==0  then do;     do f=1  for newV11  until newV12==newV4.f
end   /*ͺ*f*/
newV6.f= newV6.f + mems; iterate j   /*ͺ*languages in different cases.*/
end                  /*ͺ* [β]  handle any possible duplicates.*/
u.newV12= u.newV12 + 1;       newV11= newV11 + 1          /*ͺ*bump a couple of counters.           */
newV6.newV11= newV6.newV11 + mems;  newV5.newV11= cat.j;  newV4.newV11=newV12 /*ͺ*bump the counter;  assign it (upper).*/
end   /*ͺ*j*/

newV7.=;        newV3= '(total) number of'       /*ͺ*array holds indication of TIED langs.*/
call tell right(commas(newV11),    9) newV3 'languages detected in the category file'
call tell right(commas(langs),9) '   "       "    "     "         "     "  "  language   "
call tell right(commas(newV6.0),  9) newV3 'entries (solutions) detected', , 1;    term= 0
return                                      /*ͺ*don't show any more msgsβββΊterm. [β] */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
init: sep= 'β';  L.=0;  newV6.=0;  u.=newV6.;  catHeap=;  term=1;  old.= /*ͺ*assign some REXX vars*/
if catFID==''  then catFID= "RC_POP.CAT"   /*ͺ*Not specified?  Then use the default.*/
if lanFID==''  then lanFID= "RC_POP.LAN"   /*ͺ* "      "         "   "   "     "    */
if outFID==''  then outFID= "RC_POP.OUT"   /*ͺ* "      "         "   "   "     "    */
call tell center('timestamp: '  date()  time("Civil"),79,'β'), 2, 1;      return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
out:  w= length( commas(newV11) );     rank= 0        /*ͺ* [β]  show by ascending rank of lang.*/
do t=newV11  by -1  for newV11;   rank= rank + 1 /*ͺ*bump rank of a programming language. */
call tell   right('rank:'    right(commas(newV2.t), w),  20-1)      right(newV7.t, 7),
right('('commas(newV6.t)  left("entr"s(newV6.t, 'ies', "y")')', 9), 20)  newV5.t
end   /*ͺ*#*/                            /*ͺ* [β]   S(Β·Β·Β·)   pluralizes a word.   */
call tell left('', 27)  "βΌ  endβofβlist.  βΌ", 1, 2;      return    /*ͺ*bottom title.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rdr:  arg which 2;        igAst= 1               /*ͺ*ARG uppers WHICH, obtain the 1st char*/
if which=='L'  then inFID= lanFID          /*ͺ*use this fileID for the  languages.  */
if which=='C'  then inFID= catFID          /*ͺ* "    "     "    "   "   categories. */
Uyir=  'Ξ±Β«Γ«Ξ±Β«Β»Ξ±Β«βΞ±Β«βΞ±Β»Γ¬/Uyir'              /*ͺ*Unicode (in text)  name for  Uyir    */
old.0= 'β¬ΒξεχΦ±±C++'     ;    new.0= "Β΅C++"      /*ͺ*Unicode β¬ΒξεχΦ±±C++  ββββΊ ASCIIβ8: Β΅C++    */
old.1= 'UC++'      ;    new.1= "Β΅C++"      /*ͺ*old      UC++  ββββΊ ASCIIβ8: Β΅C++    */
old.2= 'β¨ΒξεχΦ±±β¨Γ-'     ;    new.2= "MK-"       /*ͺ*Unicode β¨ΒξεχΦ±±β¨Γβ  ββββΊ ASCII-8: MK-     */
old.3= 'DββjβΓ‘'    ;    new.3= "DΓ©jΓ "      /*ͺ*Unicode ββjβΓ‘  ββββΊ ASCIIβ8: DΓ©jΓ     */
old.4= 'Cachββ'    ;    new.4= "CachΓ©"     /*ͺ*Unicode Cachββ ββββΊ ASCIIβ8: CachΓ©   */
old.5= '??-61/52'  ;    new.5= "MK-61/52"  /*ͺ*somewhere past, a misβtranslated: MK-*/
old.6= 'FβΌΓ¬rmulβΒͺ' ;    new.6= 'FΓ΄rmulΓ¦'   /*ͺ*Unicode        ββββΊ ASCIIβ8: FΓ΄rmulΓ¦ */
old.7= 'β¨ΒξεχΦ±±iniZinc' ;    new.7= 'MiniZinc'  /*ͺ*Unicode        ββββΊ ASCIIβ8: MiniZinc*/
old.8=  Uyir       ;    new.8= 'Uyir'      /*ͺ*Unicode        ββββΊ ASCIIβ8: Uyir    */
old.9= 'Perl 6'    ;    new.9= 'Raku'      /*ͺ* (old name)    ββββΊ (new name)       */

do recs=0   while  lines(inFID) \== 0    /*ͺ*read a file, a single line at a time.*/
newV13= translate( linein(inFID), , '9'x)     /*ͺ*handle any stray  TAB  ('09'x) chars.*/
newV8= space(newV13);   if newV8==''  then iterate  /*ͺ*ignore all blank lines in the file(s)*/
do v=0  while old.v \== ''       /*ͺ*translate Unicode variations of langs*/
if pos(old.v, newV8) \==0  then newV8= changestr(old.v, newV8, new.v)
end   /*ͺ*v*/                      /*ͺ* [β]  handle different lang spellings*/
if igAst  then do;  igAst= pos(' * ', newV13)==0;      if igAst  then iterate;      end
if pos('RETRIEVED FROM', translate(newV8))\==0  then leave   /*ͺ*pseudo EndβOfβData?.*/
if which=='L'  then do;  if left(newV8, 1)\=="*"  then iterate  /*ͺ*lang Β¬legitimate?*/
parse upper var   newV8   '*'  newV8  "<";    newV8= space(newV8)
if newV8==''  then iterate;                L.newV8= 1
langs= langs + 1     /*ͺ*bump number of languages found. */
iterate
end                  /*ͺ* [β]  extract computer language name.*/
if left(newV8, 1)=='*'  then newV8= sep  ||  space( substr(newV8, 2) )
catHeap= catHeap  newV8                     /*ͺ*append to the catHeap (CATegory) heap*/
end   /*ͺ*recs*/
call  tell   right( commas(recs), 9)       'records read from file: '        inFID
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell:          do '0'arg(2);   call lineout outFID," "     ;   if term  then say ;     end
call lineout outFID,arg(1)  ;   if term  then say arg(1)
do '0'arg(3);   call lineout outFID," "     ;   if term  then say ;     end
return       /*ͺ*show BEFORE blank lines (if any), message, show AFTER blank lines.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tSort: tied=;                            r= 0    /*ͺ*add true rank (tR) ββββΊ the entries. */
do j=newV11  by -1  for newV11;     r= r+1;   tR= r;   newV2.j= r;   jp= j+1;   jm= j-1
if tied==''  then pR= r;  tied=   /*ͺ*handle when language rank is untied. */
if newV6.j==newV6.jp | newV6.j==newV6.jm  then do;    newV7.j= '[tied]';     tied= newV7.j;     end
if newV6.j==newV6.jp              then do;    tR= pR;            newV2.j= pR;     end
else pR= r
end   /*ͺ*j*/;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rosetta-Code-Rank-languages-by-popularity\rosetta-code-rank-languages-by-popularity.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
