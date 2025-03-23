/*�*REXX program sorts a stemmed array (has characters) using the insertion sort algorithm*/
call gen                                         /*�*generate the array's (data) elements.*/
call show           'before sort'                /*�*display the  before  array elements. */
say copies('▒', 85)                         /*�*display a separator line  (a fence). */
call insertionSort  newV2                            /*�*invoke the  insertion  sort.         */
call show           ' after sort'                /*�*display the   after  array elements. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen: newV1.=;                 newV1.1  = "---Monday's Child Is Fair of Face  (by Mother Goose)---"
newV1.2  = "======================================================="
newV1.3  = "Monday's child is fair of face;"
newV1.4  = "Tuesday's child is full of grace;"
newV1.5  = "Wednesday's child is full of woe;"
newV1.6  = "Thursday's child has far to go;"
newV1.7  = "Friday's child is loving and giving;"
newV1.8  = "Saturday's child works hard for a living;"
newV1.9  = "But the child that is born on the Sabbath day"
newV1.10 = "Is blithe and bonny, good and gay."
do newV2=1  while newV1.newV2\==''; end;  newV2= newV2-1 /*�*determine how many entries in @ array*/
return                                      /*�* [↑]  adjust # for the DO loop index.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
insertionSort:  procedure expose newV1.;      parse arg newV2
do i=2  to newV2;   newV3= newV1.i;       do j=i-1  by -1  to 1  while newV1.j>newV3
newV4= j + 1;        newV1.newV4= newV1.j
end   /*�*j*/
newV4= j + 1;       newV1.newV4= newV3
end   /*�*i*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  do j=1  for newV2;  say '   element'  right(j,length(newV2))  arg(1)": "  newV1.j; end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Insertion-sort\sorting-algorithms-insertion-sort.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
