/*ͺ*REXX program sorts  (using Eβsort)  and displays a list of some interesting integers. */
Bell=  1 1 2 5 15 52 203 877 4140 21147 115975           /*ͺ*a few  Bell          "     */
Bern= '1 -1 1 0 -1 0 1 0 -1 0 5 0 -691 0 7 0 -3617'      /*ͺ*"  "   Bernoulli     "     */
Perrin=  3 0 2 3 2 5 5 7 10 12 17 22 29 39 51 68 90        /*ͺ*"  "   Perrin        "     */
list= Bell  Bern  Perrin                                 /*ͺ*throw them all ββββΊ a pot. */
say 'unsorted =' list                                      /*ͺ*display what's being shown.*/
newV2= words(list)                                             /*ͺ*nice to have # of elements.*/
do j=1  for newV2                /*ͺ*build an array, a single   */
newV1.j=word(list, j)            /*ͺ*     Β·Β·Β· element at a time.*/
end    /*ͺ*j*/
call eSort newV2                                               /*ͺ*sort the collection of #s. */
newV3=;                           do k=1  for newV2;   newV3= newV3 newV1.k    /*ͺ*build a list from the array*/
end    /*ͺ*k*/
say '  sorted =' space(newV3)                                  /*ͺ*display the sorted list.   */
exit                                              /*ͺ*stick a fork in it,  we're all done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eSort: procedure expose newV1.;   parse arg N;       h= N                /*ͺ*an eXchange sort.*/
do  while h>1;                     h= h % 2            /*ͺ*define a segment.*/
do i=1  for N-h;                 j= i;      k= h + i /*ͺ*sort top segment.*/
do  while  newV1.k<newV1.j                                 /*ͺ*see if need swap.*/
parse value  newV1.j  newV1.k   with   newV1.k  newV1.j            /*ͺ*swap two elements*/
if h>=j  then leave;           j= j - h;  k= k - h /*ͺ*this part sorted?*/
end   /*ͺ*while @.k<@.j*/
end     /*ͺ*i*/
end       /*ͺ*while h>1*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-an-integer-array\sort-an-integer-array-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
