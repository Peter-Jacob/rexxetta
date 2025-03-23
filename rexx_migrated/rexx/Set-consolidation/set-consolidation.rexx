/*�*REXX program demonstrates a method of    set consolidating    using some sample sets. */
newV1.=;               newV1.1 = '{A,B}     {C,D}'
newV1.2 = "{A,B}     {B,D}"
newV1.3 = '{A,B}     {C,D}     {D,B}'
newV1.4 = '{H,I,K}   {A,B}     {C,D}     {D,B}     {F,G,H}'
newV1.5 = '{snow,ice,slush,frost,fog} {icebergs,icecubes} {rain,fog,sleet}'

do j=1  while newV1.j\==''                /*�*traipse through each of sample sets. */
call SETconsolidate newV1.j               /*�*have the function do the heavy work. */
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isIn:  return wordpos(arg(1), arg(2))\==0        /*�*is (word) argument 1 in the set arg2?*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
SETconsolidate: procedure;  parse arg old;       newV3= words(old);       new=
say ' the old set='  space(old)

do k=1  for newV3                           /*�* [↓]  change all commas to a blank.  */
newV2.k= translate( word(old, k), , '},{')  /*�*create a list of words  (aka, a set).*/
end   /*�*k*/                             /*�* [↑]  ··· and also remove the braces.*/

do  until \changed;     changed= 0      /*�*consolidate some sets  (well, maybe).*/
do set=1  for newV3-1
do item=1  for words(newV2.set);       x= word(newV2.set, item)
do other=set+1  to newV3
if isIn(x, newV2.other)  then do;  changed= 1           /*�*it's changed*/
newV2.set= newV2.set newV2.other;       newV2.other=
iterate set
end
end   /*�*other*/
end       /*�*item */
end           /*�*set  */
end                /*�*until ¬changed*/

do set=1  for newV3;                  newV4=                            /*�*elide dups*/
do items=1  for words(newV2.set);   x= word(newV2.set, items)
if x==','  then iterate;        if x==''  then leave
newV4= newV4 x                                                        /*�*build new.*/
do  until  \isIn(x, newV2.set);      newV5= wordpos(x, newV2.set)
newV5= wordpos(x, newV2.set)
newV2.set= subword(newV2.set, 1, newV5-1) ',' subword(newV2.set, newV5+1)  /*�*purify set*/
end   /*�*until ¬isIn ··· */
end          /*�*items*/
newV2.set= translate( strip(newV4), ',', " ")
end            /*�*set*/

do i=1  for newV3; if newV2.i==''  then iterate /*�*ignore any  set  that is a null set. */
new= space(new   '{'newV2.i"}")             /*�*prepend and append a set identifier. */
end   /*�*i*/

say ' the new set='  new;         say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Set-consolidation\set-consolidation.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
