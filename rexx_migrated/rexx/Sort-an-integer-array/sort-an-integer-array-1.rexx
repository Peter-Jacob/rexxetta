/*ͺ*REXX program sorts an array (using Eβsort), in this case, the array contains integers.*/
numeric digits 30                                /*ͺ*enables handling larger Euler numbers*/
newV1.  =              0;            newV1.1 =               1
newV1.3 =             -1;            newV1.5 =               5
newV1.7 =            -61;            newV1.9 =            1385
newV1.11=         -50521;            newV1.13=         2702765
newV1.15=     -199360981;            newV1.17=     19391512145
newV1.19= -2404879675441;            newV1.21= 370371188237525
newV2= 21                                            /*ͺ*indicate there're  21 Euler  numbers.*/
call tell  'unsorted'                            /*ͺ*display the array before the  eSort. */
call eSort     newV2                                 /*ͺ*sort the array of some Euler numbers.*/
call tell  '  sorted'                            /*ͺ*display the array  after  the eSort. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eSort: procedure expose newV1.;   parse arg N;     h=N                   /*ͺ*an eXchange sort.*/
do  while h>1;                   h= h%2                /*ͺ*define a segment.*/
do i=1  for N-h;              j=i;     k= h+i       /*ͺ*sort top segment.*/
do  while  newV1.k<newV1.j                               /*ͺ*see if need swap.*/
parse value  newV1.j newV1.k   with   newV1.k newV1.j        /*ͺ*swap two elements*/
if h>=j  then leave;   j= j-h;   k= k-h      /*ͺ*this part sorted?*/
end   /*ͺ*while @.k<@.j*/
end       /*ͺ*i*/
end             /*ͺ*while h>1*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell:  say copies('β', 65);       newV3= left('',9);                       w= length(newV2)
do j=1  for newV2;  say newV3 arg(1)  'array element'   right(j, w)"="right(newV1.j, 20)
end   /*ͺ*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-an-integer-array\sort-an-integer-array-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
