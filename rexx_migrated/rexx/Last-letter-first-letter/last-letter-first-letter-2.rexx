/*ͺ*REXX program finds the  longest path of word's   lastβletter ββββΊ firstβletter.       */
newV5='audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan',
'deino emboar emolga exeggcute gabite girafarig gulpin haxorus heatmor heatran ivysaur jellicent',
'jumpluff kangaskhan kricketune landorus ledyba loudred lumineon lunatone machamp magnezone mamoswine',
'nosepass petilil pidgeotto pikachu pinsir poliwrath poochyena porygon2 porygonz registeel relicanth',
'remoraid rufflet sableye scolipede scrafty seaking sealeo silcoon simisear snivy snorlax spoink',
'starly tirtouga trapinch treecko tyrogue vigoroth vulpix wailord wartortle whismur wingull yamask'
newV6= words(newV5);  newV2.=;  newV3=newV2.;  ig=0;   og=0;   newV4.=0 /*ͺ*nullify array and the longest path.  */
parse arg limit .;  if limit\==''  then newV6= limit /*ͺ*allow user to specify a scan limit.  */
call buildnewV5                                      /*ͺ*build a stemmed array from the @ list*/
do v=newV6  by -1  for newV6             /*ͺ*scrub the @ list for unusable words. */
parse var newV2.v  F  2  ''  -1  L   /*ͺ*obtain first and last letter of word.*/
if newV4.1.F>1  |  newV4.9.L>1  then iterate             /*ͺ*is this a dead word? */
say 'ignoring dead word:'   newV2.v;      ig= ig + 1;      newV5= delword(newV5, v, 1)
end   /*ͺ*v*/                      /*ͺ*delete dead word from  @ βββ         */
newV6= words(newV5)                                      /*ͺ*recalculate the number of words in @.*/
do v=newV6  by -1  for newV6             /*ͺ*scrub the @ list for stoppable words.*/
parse var newV2.v  F  2  ''  -1  L   /*ͺ*obtain first and last letter of word.*/
if newV4.1.L>0   then iterate        /*ͺ*is this a stop word?                 */
if newV2.v\==''  then  say 'removing stop word:'   newV2.v
og= og + 1;   newV5= delword(newV5, v, 1);      newV3= newV3 newV2.v
end   /*ͺ*v*/                      /*ͺ*delete dead word from  @ βββ         */

if og\==0  then do;   call buildnewV5;   say;   say 'ignoring'   og   "stop word"s(og).
say 'stop words: '    newV3;             say
end
newV1=                                             /*ͺ*nullify the possible longest path.   */
MP= 0;  MPL= 0                                   /*ͺ*the initial   Maximum Path Length.   */
do j=1  for newV6                    /*ͺ*              β       β    β         */
parse  value  newV2.1 newV2.j   with   newV2.j newV2.1;          call scan newV1, 2
parse  value  newV2.1 newV2.j   with   newV2.j newV2.1
end   /*ͺ*j*/
g= words(newV1)
say 'Of'    newV6    "words,"    MP    'path's(MP)    "have the maximum path length of"   g'.'
say;   say 'One example path of that length is: '      word(newV1, 1)
do m=2  to g;      say left('', 36)    word(newV1, m)
end   /*ͺ*m*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
s:    if arg(1)==1  then return arg(3);    return word( arg(2) 's', 1)   /*ͺ*a pluralizer.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
buildnewV5:    do i=1  for newV6;      newV2.i= word(newV5, i)   /*ͺ*build a stemmed array from the list. */
F=  left(newV2.i, 1);   newV4.1.F= newV4.1.F + 1  /*ͺ*F:  1st char; !.1.F=count of 1st char*/
L= right(newV2.i, 1);   newV4.9.L= newV4.9.L + 1  /*ͺ*L: last   "   !.9.L=  "    " last  " */
end   /*ͺ*i*/;        return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
scan: procedure expose newV2. newV6 newV4. newV1 MP MPL;   parse arg newV1,newV7;                    p= newV7 - 1
parse var  newV2.p  ''  -1  LC                 /*ͺ*obtain last character of previous @. */
if newV4.1.LC==0  then return                  /*ͺ*is this a  deadβend  word?           */
/*ͺ* [β]  PARSE obtains first char of @.i*/
do i=newV7  to newV6;  parse var  newV2.i  p  2     /*ͺ*scan for the longest word path.      */
if p==LC  then do                       /*ͺ*is the  firstβcharacter βξεχΦ· lastβchar? */
if newV7==MPL  then MP= MP+1 /*ͺ*bump the  Maximum Paths  Counter.    */
else if newV7>MPL  then do; newV1= newV2.1          /*ͺ*rebuild. */
do n=2  for newV7-2;  newV1=newV1 newV2.n
end   /*ͺ*n*/
newV1= newV1  newV2.i     /*ͺ*add last.*/
MP=1;   MPL=newV7     /*ͺ*new path.*/
end
parse value  newV2.newV7 newV2.i   with   newV2.i newV2.newV7;          call scan newV1, newV7+1
parse value  newV2.newV7 newV2.i   with   newV2.i newV2.newV7
end
end    /*ͺ*i*/;             return        /*ͺ*exhausted this particular scan.      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Last-letter-first-letter\last-letter-first-letter-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
