/*�*REXX program  sorts  a (stemmed)  array  using a  (stable)   bubble─sort   algorithm. */
call gen@                                        /*�*generate the array elements (strings)*/
call show  'before sort'                         /*�*show the  before array  elements.    */
say copies('▒', 50)                         /*�*show a separator line between shows. */
call bubbleSort   newV3                              /*�*invoke the bubble sort.              */
call show  ' after sort'                         /*�*show the   after array  elements.    */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bubbleSort: procedure expose newV1.; parse arg n;    m= n-1 /*�*N:  number of array elements. */
do m=m  for m  by -1  until ok;    ok= 1  /*�*keep sorting array until done.*/
do j=1  for m;  k= j+1;  if newV1.j<=newV1.k  then iterate /*�*Not out─of─order?*/
newV2= newV1.j;  newV1.j= newV1.k;   newV1.k= newV2    ok= 0  /*�*swap 2 elements; flag as ¬done*/
end   /*�*j*/
end       /*�*m*/;       return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen@: newV1.=;                  newV1.1 = 'UK  London'
newV1.2 = 'US  New York'
newV1.3 = 'US  Birmingham'
newV1.4 = 'UK  Birmingham'
do newV3=1  while newV1.newV3\==''              /*�*determine how many entries in list. */
end   /*�*#*/;    newV3= newV3 - 1;   return  /*�*adjust for the DO loop index; return*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: do j=1  for newV3;  say '      element' right(j,length(newV3)) arg(1)":"  newV1.j;  end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-stability\sort-stability.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
