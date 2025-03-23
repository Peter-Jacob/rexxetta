/*�*REXX program finds the  longest path of word's   last─letter ───► first─letter.       */
newV5='audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan',
'deino emboar emolga exeggcute gabite girafarig gulpin haxorus heatmor heatran ivysaur jellicent',
'jumpluff kangaskhan kricketune landorus ledyba loudred lumineon lunatone machamp magnezone mamoswine',
'nosepass petilil pidgeotto pikachu pinsir poliwrath poochyena porygon2 porygonz registeel relicanth',
'remoraid rufflet sableye scolipede scrafty seaking sealeo silcoon simisear snivy snorlax spoink',
'starly tirtouga trapinch treecko tyrogue vigoroth vulpix wailord wartortle whismur wingull yamask'
newV6= words(newV5);  newV2.=;  newV3=newV2.;  ig=0;   og=0;   newV4.=0 /*�*nullify array and the longest path.  */
parse arg limit .;  if limit\==''  then newV6= limit /*�*allow user to specify a scan limit.  */
call buildnewV5                                      /*�*build a stemmed array from the @ list*/
do v=newV6  by -1  for newV6             /*�*scrub the @ list for unusable words. */
parse var newV2.v  F  2  ''  -1  L   /*�*obtain first and last letter of word.*/
if newV4.1.F>1  |  newV4.9.L>1  then iterate             /*�*is this a dead word? */
say 'ignoring dead word:'   newV2.v;      ig= ig + 1;      newV5= delword(newV5, v, 1)
end   /*�*v*/                      /*�*delete dead word from  @ ──┘         */
newV6= words(newV5)                                      /*�*recalculate the number of words in @.*/
do v=newV6  by -1  for newV6             /*�*scrub the @ list for stoppable words.*/
parse var newV2.v  F  2  ''  -1  L   /*�*obtain first and last letter of word.*/
if newV4.1.L>0   then iterate        /*�*is this a stop word?                 */
if newV2.v\==''  then  say 'removing stop word:'   newV2.v
og= og + 1;   newV5= delword(newV5, v, 1);      newV3= newV3 newV2.v
end   /*�*v*/                      /*�*delete dead word from  @ ──┘         */

if og\==0  then do;   call buildnewV5;   say;   say 'ignoring'   og   "stop word"s(og).
say 'stop words: '    newV3;             say
end
newV1=                                             /*�*nullify the possible longest path.   */
MP= 0;  MPL= 0                                   /*�*the initial   Maximum Path Length.   */
do j=1  for newV6                    /*�*              ─       ─    ─         */
parse  value  newV2.1 newV2.j   with   newV2.j newV2.1;          call scan newV1, 2
parse  value  newV2.1 newV2.j   with   newV2.j newV2.1
end   /*�*j*/
g= words(newV1)
say 'Of'    newV6    "words,"    MP    'path's(MP)    "have the maximum path length of"   g'.'
say;   say 'One example path of that length is: '      word(newV1, 1)
do m=2  to g;      say left('', 36)    word(newV1, m)
end   /*�*m*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:    if arg(1)==1  then return arg(3);    return word( arg(2) 's', 1)   /*�*a pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
buildnewV5:    do i=1  for newV6;      newV2.i= word(newV5, i)   /*�*build a stemmed array from the list. */
F=  left(newV2.i, 1);   newV4.1.F= newV4.1.F + 1  /*�*F:  1st char; !.1.F=count of 1st char*/
L= right(newV2.i, 1);   newV4.9.L= newV4.9.L + 1  /*�*L: last   "   !.9.L=  "    " last  " */
end   /*�*i*/;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
scan: procedure expose newV2. newV6 newV4. newV1 MP MPL;   parse arg newV1,newV7;                    p= newV7 - 1
parse var  newV2.p  ''  -1  LC                 /*�*obtain last character of previous @. */
if newV4.1.LC==0  then return                  /*�*is this a  dead─end  word?           */
/*�* [↓]  PARSE obtains first char of @.i*/
do i=newV7  to newV6;  parse var  newV2.i  p  2     /*�*scan for the longest word path.      */
if p==LC  then do                       /*�*is the  first─character ����ַ last─char? */
if newV7==MPL  then MP= MP+1 /*�*bump the  Maximum Paths  Counter.    */
else if newV7>MPL  then do; newV1= newV2.1          /*�*rebuild. */
do n=2  for newV7-2;  newV1=newV1 newV2.n
end   /*�*n*/
newV1= newV1  newV2.i     /*�*add last.*/
MP=1;   MPL=newV7     /*�*new path.*/
end
parse value  newV2.newV7 newV2.i   with   newV2.i newV2.newV7;          call scan newV1, newV7+1
parse value  newV2.newV7 newV2.i   with   newV2.i newV2.newV7
end
end    /*�*i*/;             return        /*�*exhausted this particular scan.      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Last-letter-first-letter\last-letter-first-letter-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
