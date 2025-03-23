/*�*REXX program finds the  longest path of word's   last─letter ───► first─letter.       */
newV4='audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan',
'deino emboar emolga exeggcute gabite girafarig gulpin haxorus heatmor heatran ivysaur jellicent',
'jumpluff kangaskhan kricketune landorus ledyba loudred lumineon lunatone machamp magnezone mamoswine',
'nosepass petilil pidgeotto pikachu pinsir poliwrath poochyena porygon2 porygonz registeel relicanth',
'remoraid rufflet sableye scolipede scrafty seaking sealeo silcoon simisear snivy snorlax spoink',
'starly tirtouga trapinch treecko tyrogue vigoroth vulpix wailord wartortle whismur wingull yamask'
newV5= words(newV4);        ig= 0;   newV2.= 0;    newV3.=       /*�*nullify array and the longest path.  */
parse arg limit .;  if limit\==''  then newV5=limit  /*�*allow user to specify a scan limit.  */
call buildnewV4                                      /*�*build a stemmed array from the @ list*/
do v=newV5  by -1  for newV5             /*�*scrub the @ list for unusable words. */
parse var newV3.v  F  2  ''  -1  L   /*�*obtain first and last letter of word.*/
if newV2.1.F>1  |  newV2.9.L>1  then iterate              /*�*is this a dead word?*/
say 'ignoring dead word:'   newV3.v;      ig= ig + 1;      newV4= delword(newV4, v, 1)
end   /*�*v*/                      /*�*delete dead word from  @ ──┘         */
newV1=                                             /*�*nullify the possible longest path.   */
if ig\==0  then do;   call buildnewV4;   say;   say 'ignoring'   ig   "dead word"s(ig).;   say
end
MP= 0;  MPL= 0                                   /*�*the initial   Maximum Path Length.   */
do j=1  for newV5                    /*�*              ─       ─    ─         */
parse  value  newV3.1 newV3.j   with   newV3.j newV3.1;          call scan newV1, 2
parse  value  newV3.1 newV3.j   with   newV3.j newV3.1
end   /*�*j*/
g= words(newV1)
say 'Of'    newV5    "words,"    MP    'path's(MP)    "have the maximum path length of"   g'.'
say;     say 'One example path of that length is: '     word(newV1, 1)
do m=2  to g;      say left('', 36)     word(newV1, m)
end   /*�**/
exit 0                                            /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:    if arg(1)==1  then return arg(3);    return word( arg(2) 's', 1)   /*�*a pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
buildnewV4:     do i=1  for newV5;     newV3.i=word(newV4, i)    /*�*build a stemmed array from the list. */
F= left(newV3.i, 1);   newV2.1.F= newV2.1.F + 1  /*�*F:  1st char; !.1.F=count of 1st char*/
L=right(newV3.i, 1);   newV2.9.L= newV2.9.L + 1  /*�*L: last   "   !.9.L=  "    " last  " */
end   /*�*i*/;       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
scan: procedure expose newV3. newV5 newV2. newV1 MP MPL;    parse arg newV1,newV6;                  p=newV6 - 1
parse var  newV3.p  ''  -1  LC                 /*�*obtain last character of previous @. */
if newV2.1.LC==0  then return                  /*�*is this a  dead─end  word?           */
/*�* [↓]  PARSE obtains first char of @.i*/
do i=newV6  to newV5;  parse var  newV3.i  p  2     /*�*scan for the longest word path.      */
if p==LC  then do                       /*�*is the  first─character ����ֶ last─char? */
if newV6==MPL  then MP= MP+1 /*�*bump the  Maximum Paths  Counter.    */
else if newV6>MPL  then do; newV1=newV3.1           /*�*rebuild. */
do n=2  for newV6-2;  newV1=newV1 newV3.n
end   /*�*n*/
newV1=newV1   newV3.i     /*�*add last.*/
MP=1;   MPL=newV6     /*�*new path.*/
end
parse value  newV3.newV6 newV3.i   with   newV3.i newV3.newV6;          call scan newV1, newV6+1
parse value  newV3.newV6 newV3.i   with   newV3.i newV3.newV6
end
end    /*�*i*/;             return        /*�*exhausted this particular scan.      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Last-letter-first-letter\last-letter-first-letter-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
