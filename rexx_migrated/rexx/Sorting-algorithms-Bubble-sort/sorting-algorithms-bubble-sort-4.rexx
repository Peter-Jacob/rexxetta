/*�*REXX program sorts an array (of any kind of numbers)  using the bubble─sort algorithm.*/
parse arg N seed .                               /*�*obtain optional size of array from CL*/
if N=='' | N==","       then N=30                /*�*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*�*An integer?  Use the seed for RANDOM.*/
call gen    N                                    /*�*generate the array elements (items). */
call show        'before sort:'                  /*�*show the   before   array elements.  */
newV1= newV5                              /*�*keep "before" copy for after the sort*/
call bSort  N                                    /*�*invoke the bubble sort  with N items.*/
say newV1
call show        ' after sort:'                  /*�*show the   after    array elements.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bSort: procedure expose newV2.;  parse arg newV4         /*�*N: is the number of @ array elements.*/
call disp                                 /*�*show a snapshot of the unsorted array*/
do m=newV4-1  by -1  until ok;    ok=1        /*�*keep sorting the  @ array until done.*/
do j=1  for m;   k=j+1
if newV2.j>newV2.k  then do;     parse value    newV2.j  newV2.k  0      with      newV2.k  newV2.j  ok
end
end   /*�*j*/                           /*�* [↑]  swap 2 elements, flag as ¬done.*/
call disp                                 /*�*show snapshot of partially sorted @. */
end       /*�*m*/;      return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen:   do j=1  for N;  newV2.j= j;  end
do k=1  for N;  g= random(1,N);  parse value newV2.k newV2.g  with  newV2.g newV2.k;  end;   return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  parse arg newV5;  do k=1  for N;  newV5=newV5  right(newV2.k, length(N));  end;     say newV5;   return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
disp:  'CLS';    newV3.=                             /*�*"CLS" is the command to clear screen.*/
do e=1  for newV4;         newV3.e= '│'overlay("☼", newV3.e, newV2.e);     end  /*�*e*/
do s=newV4  for newV4  by -1;  say newV3.s;                            end  /*�*s*/
say "└"copies('─', newV4)                     /*�*display the horizontal axis at bottom*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bubble-sort\sorting-algorithms-bubble-sort-4.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
