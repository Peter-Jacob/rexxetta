/*�*REXX pgm solves the continuous burglar's knapsack problem; items with weight and value*/
newV1.=               /*�*═══════  name    weight  value  ══════*/
newV1.1 = 'flitch     4       30  '
newV1.2 = 'beef       3.8     36  '
newV1.3 = 'pork       5.4     43  '
newV1.4 = 'greaves    2.4     45  '
newV1.5 = 'brawn      2.5     56  '
newV1.6 = 'welt       3.7     67  '
newV1.7 = 'ham        3.6     90  '
newV1.8 = 'salami     3       95  '
newV1.9 = 'sausage    5.9     98  '
parse arg maxW d .                               /*�*get possible arguments from the C.L. */
if maxW=='' | maxW==","  then maxW=15            /*�*the burglar's knapsack maximum weight*/
if    d=='' |    d==","  then    d= 3            /*�*# decimal digits shown with  FORMAT. */
wL=d+length('weight');   nL=d+length("total weight");    vL=d+length('value')  /*�*lengths*/
totW=0;  totV=0                                  /*�* [↓]  assign item to separate lists. */
do newV2=1  while newV1.newV2\=='';    parse var newV1.newV2 n.newV2 w.newV2 v.newV2 .;   end;      newV2=newV2-1
call show  'unsorted item list'                  /*�*display the header and the   @  list.*/
call sortD                                       /*�*invoke descemdomg sort for:  n. w. v.*/
call hdr "burglar's knapsack contents"
do j=1  for newV2      while totW<maxW;   f=1        /*�*process the items.  */
if totW+w.j>=maxW  then f=(maxW-totW)/w.j        /*�*calculate fraction. */
totW=totW+w.j*f;        totV=totV+v.j*f          /*�*add it ───► totals. */
call syf  left(word('{all}',1+(f\==1)),5)   n.j,  w.j*f,  v.j*f
end   /*�*j*/                     /*�* [↑]  display item, maybe with {all} */
call sep;  say                                   /*�* [↓]   $  suppresses trailing zeroes.*/
call sy  left('total weight', nL, "─"),              $(format(totW,,d))
call sy  left('total  value', nL, "─"),      ,       $(format(totV,,d))
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sortD: do s=2  to newV2;  a=n.s; newV3=w.s; u=v.s        /*�* [↓]  this is a descending sort.     */
do k=s-1  by -1  to 1  while v.k/w.k<u/newV3;  newV4=k+1; n.newV4=n.k; w.newV4=w.k; v.newV4=v.k;  end
newV4=k+1;   n.newV4=a;   w.newV4=newV3;   v.newV4=u
end   /*�*s*/;               return         /*�* ↑↑↑ algorithm is OK for small arrays*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hdr:   say;  say;  say center(arg(1),50,'─');   say;  call title;  call sep;      return
sep:   call sy  copies('═', nL),  copies("═", wL),  copies('═', vL);              return
show:  call hdr arg(1);           do j=1  for newV2;   call syf n.j, w.j, v.j;   end; return
sy:    say left('',9)   left(arg(1),nL)   right(arg(2),wL)   right(arg(3),vL);    return
syf:   call sy arg(1),    $(format(arg(2), , d)),    $(format(arg(3), , d));      return
title: call sy center('item',nL),  center("weight", wL),  center('value', vL);    return
$:     parse arg x;if pos(.,x)>1 then x=left(strip(strip(x,'T',0),,.),length(x)); return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knapsack-problem-Continuous\knapsack-problem-continuous-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
