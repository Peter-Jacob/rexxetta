/*�*REXX program  sorts  a  stemmed array  using the   selection─sort   algorithm.        */
call init                                        /*�*assign some values to an array:   @. */
call show   'before sort'                        /*�*show the   before   array elements.  */
say  copies('▒', 65)                        /*�*show a nice separator line  (fence). */
call selectionSort   newV2                           /*�*invoke selection sort (and # items). */
call show   ' after sort'                        /*�*show the    after   array elements.  */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
init: newV1.=;                  newV1.1 = '---The seven hills of Rome:---'
newV1.2 = '==============================';      newV1.6 = 'Virminal'
newV1.3 = 'Caelian'                       ;      newV1.7 = 'Esquiline'
newV1.4 = 'Palatine'                      ;      newV1.8 = 'Quirinal'
newV1.5 = 'Capitoline'                    ;      newV1.9 = 'Aventine'
do newV2=1  until newV1.newV2=='';   end       /*�*find the number of items in the array*/
newV2= newV2-1;         return                     /*�*adjust  #  (because of  DO  index).  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
selectionSort: procedure expose newV1.;  parse arg n
do j=1  for n-1;                 newV3= newV1.j;             p= j
do k=j+1  to n;      if newV1.k>=newV3  then iterate
newV3= newV1.k;      p= k      /*�*this item is out─of─order, swap later*/
end   /*�*k*/
if p==j  then iterate      /*�*if the same, the order of items is OK*/
newV3= newV1.j;  newV1.j= newV1.p;  newV1.p= newV3 /*�*swap 2 items that're out─of─sequence.*/
end       /*�*j*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  do i=1  for newV2;  say '       element' right(i,length(newV2)) arg(1)":" newV1.i; end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Selection-sort\sorting-algorithms-selection-sort.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
