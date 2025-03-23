/*�*REXX program sorts an array using the gnome sort algorithm (elements contain blanks). */
call gen                                         /*�*generate the  @   stemmed array.     */
call show     'before sort'                      /*�*display the   before  array elements.*/
say copies('▒', 60) /*�*show a separator line between sorts. */
call gnomeSort  newV2                                /*�*invoke the well─known  gnome  sort.  */
call show     ' after sort'                      /*�*display the    after  array elements.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=;  newV1.1= '---the seven virtues---';    newV1.4= "Hope"           ;    newV1.7= 'Justice'
newV1.2= '=======================';    newV1.5= "Charity  [Love]";    newV1.8= 'Prudence'
newV1.3= 'Faith'                  ;    newV1.6= "Fortitude"      ;    newV1.9= 'Temperance'
do newV2=1  while newV1.newV2\==''; end;   newV2= newV2-1;   w= length(newV2);  return /*�*get #items*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gnomeSort: procedure expose newV1.;  parse arg n;     k= 2            /*�*N: is number items. */
do j=3  while k<=n;                  p= k - 1        /*�*P: is previous item.*/
if newV1.p<<=newV1.k  then do;      k= j;    iterate;   end  /*�*order is OK so far. */
newV3= newV1.p;       newV1.p= newV1.k;     newV1.k= newV3                   /*�*swap two @ entries. */
k= k - 1;     if k==1  then k= j;    else j= j-1     /*�*test for 1st index. */
end    /*�*j*/;                                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  do j=1  for newV2;   say '       element'  right(j, w)  arg(1)":"  newV1.j;   end;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Gnome-sort\sorting-algorithms-gnome-sort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
