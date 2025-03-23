/*�*REXX program  verifies  that  an array  is sorted  using  a   jortSort   algorithm.   */
parse arg newV3                                      /*�*obtain the list of numbers from C.L. */
if newV3=''  then newV3=1 2 4 3                          /*�*Not specified?  Then use the default.*/
say 'array items='  space(newV3)                     /*�*display the list to the terminal.    */
if jortSort(newV3)  then say  'The array is sorted.'
else say  "The array isn't sorted."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eSort:    procedure expose newV1.;                    h=newV1.0       /*�*exchange sort.*/
do while h>1;                 h=h%2
do i=1  for newV1.0-h;          j=i;      k=h+i
do  while newV1.k<newV1.j;        t=newV1.j;    newV1.j=newV1.k;    newV1.k=t
if h>=j  then leave;      j=j-h;    k=k-h
end   /*�*while @.k<@.j*/
end     /*�*i*/
end       /*�*while h>1*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
jortSort: parse arg x;   newV1.0=words(x)                         /*�*assign # items in list. */
do j=1  for newV1.0; newV2.j=word(x,j); newV1.j=newV2.j /*�*save a copy of original.*/
end   /*�*j*/
call eSort                                          /*�*sort with exchange sort.*/
do k=1  for newV1.0
if newV2.k\==newV1.k  then return 0             /*�*the array isn't sorted. */
end   /*�*k*/
return 1                                            /*�*the array is    sorted. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\JortSort\jortsort-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
