/*�*REXX program implements a  priority queue   with  insert/display/delete  the top task.*/
newV2=0;   newV1.=                                       /*�*0 tasks;  nullify the priority queue.*/
say '══════ inserting tasks.';     call .ins  3  "Clear drains"
call .ins  4  "Feed cat"
call .ins  5  "Make tea"
call .ins  1  "Solve RC tasks"
call .ins  2  "Tax return"
call .ins  6  "Relax"
call .ins  6  "Enjoy"
say '══════ showing tasks.';       call .show
say '══════ deletes top task.';    say .del()    /*�*delete the top task.                 */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.del:  procedure expose newV1. newV2; arg p;  if p=''  then p=.top();    y=newV1.p;   newV1.p=;   return y
.ins:  procedure expose newV1. newV2; newV2=newV2+1;  newV1.newV2=arg(1);    return newV2          /*�*entry, P, task.*/
.show: procedure expose newV1. newV2; do j=1  for newV2;  newV3=newV1.j;  if newV3\==''  then say newV3;  end;  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.top:  procedure expose newV1. newV2;      top=;              topnewV2=
do j=1  for newV2;  newV3=word(newV1.j, 1);    if newV3==''  then iterate
if top=='' | newV3>top  then do;    top=newV3;    topnewV2=j;    end
end   /*�*j*/
return topnewV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Priority-queue\priority-queue-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
