/*ͺ*REXX program sorts an array (of any kind of numbers)  using the bubbleβsort algorithm.*/
parse arg N .;   if N=='' | N==","  then N=30    /*ͺ*obtain optional size of array from CL*/
call gen  N                                      /*ͺ*generate the array elements (items). */
call show        'before sort:'                  /*ͺ*show the   before   array elements.  */
call bSort  N                                    /*ͺ*invoke the bubble sort  with N items.*/
call show        ' after sort:'                  /*ͺ*show the   after    array elements.  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bSort: procedure expose newV1.;  parse arg n         /*ͺ*N: is the number of @ array elements.*/
do m=n-1  by -1  until ok;     ok=1       /*ͺ*keep sorting the  @ array until done.*/
do j=1  for m;   k=j+1;  if newV1.j>newV1.k  then parse value newV1.j newV1.k 0 with newV1.k newV1.j ok
end   /*ͺ*j*/                           /*ͺ* [β]  swap 2 elements, flag as Β¬done.*/
end       /*ͺ*m*/;      return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen:   h=min(N+N,1e5);  w=length(h);      do j=1  for N;  newV1.j=random(h);  end;      return
show:  parse arg newV2;  do k=1  for N;  newV2=newV2  right(newV1.k, w);         end;     say newV2;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Bubble-sort\sorting-algorithms-bubble-sort-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
