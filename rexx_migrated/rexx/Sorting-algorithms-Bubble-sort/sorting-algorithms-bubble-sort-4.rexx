/*ͺ*REXX program sorts an array (of any kind of numbers)  using the bubbleβsort algorithm.*/
parse arg N seed .                               /*ͺ*obtain optional size of array from CL*/
if N=='' | N==","       then N=30                /*ͺ*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*An integer?  Use the seed for RANDOM.*/
call gen    N                                    /*ͺ*generate the array elements (items). */
call show        'before sort:'                  /*ͺ*show the   before   array elements.  */
newV1= newV5                              /*ͺ*keep "before" copy for after the sort*/
call bSort  N                                    /*ͺ*invoke the bubble sort  with N items.*/
say newV1
call show        ' after sort:'                  /*ͺ*show the   after    array elements.  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bSort: procedure expose newV2.;  parse arg newV4         /*ͺ*N: is the number of @ array elements.*/
call disp                                 /*ͺ*show a snapshot of the unsorted array*/
do m=newV4-1  by -1  until ok;    ok=1        /*ͺ*keep sorting the  @ array until done.*/
do j=1  for m;   k=j+1
if newV2.j>newV2.k  then do;     parse value    newV2.j  newV2.k  0      with      newV2.k  newV2.j  ok
end
end   /*ͺ*j*/                           /*ͺ* [β]  swap 2 elements, flag as Β¬done.*/
call disp                                 /*ͺ*show snapshot of partially sorted @. */
end       /*ͺ*m*/;      return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen:   do j=1  for N;  newV2.j= j;  end
do k=1  for N;  g= random(1,N);  parse value newV2.k newV2.g  with  newV2.g newV2.k;  end;   return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show:  parse arg newV5;  do k=1  for N;  newV5=newV5  right(newV2.k, length(N));  end;     say newV5;   return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
disp:  'CLS';    newV3.=                             /*ͺ*"CLS" is the command to clear screen.*/
do e=1  for newV4;         newV3.e= 'β'overlay("βΌ", newV3.e, newV2.e);     end  /*ͺ*e*/
do s=newV4  for newV4  by -1;  say newV3.s;                            end  /*ͺ*s*/
say "β"copies('β', newV4)                     /*ͺ*display the horizontal axis at bottom*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bubble-sort\sorting-algorithms-bubble-sort-4.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
