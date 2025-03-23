/*�*REXX program sorts an array (using E─sort), in this case, the array contains integers.*/
numeric digits 30                                /*�*enables handling larger Euler numbers*/
newV1.  =              0;            newV1.1 =               1
newV1.3 =             -1;            newV1.5 =               5
newV1.7 =            -61;            newV1.9 =            1385
newV1.11=         -50521;            newV1.13=         2702765
newV1.15=     -199360981;            newV1.17=     19391512145
newV1.19= -2404879675441;            newV1.21= 370371188237525
newV2= 21                                            /*�*indicate there're  21 Euler  numbers.*/
call tell  'unsorted'                            /*�*display the array before the  eSort. */
call eSort     newV2                                 /*�*sort the array of some Euler numbers.*/
call tell  '  sorted'                            /*�*display the array  after  the eSort. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eSort: procedure expose newV1.;   parse arg N;     h=N                   /*�*an eXchange sort.*/
do  while h>1;                   h= h%2                /*�*define a segment.*/
do i=1  for N-h;              j=i;     k= h+i       /*�*sort top segment.*/
do  while  newV1.k<newV1.j                               /*�*see if need swap.*/
parse value  newV1.j newV1.k   with   newV1.k newV1.j        /*�*swap two elements*/
if h>=j  then leave;   j= j-h;   k= k-h      /*�*this part sorted?*/
end   /*�*while @.k<@.j*/
end       /*�*i*/
end             /*�*while h>1*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell:  say copies('─', 65);       newV3= left('',9);                       w= length(newV2)
do j=1  for newV2;  say newV3 arg(1)  'array element'   right(j, w)"="right(newV1.j, 20)
end   /*�*j*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-an-integer-array\sort-an-integer-array-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
