/*�*REXX program sorts a list (which may be numbers)  by using the quick select algorithm.*/
parse arg list;  if list=''  then list= 9 8 7 6 5 0 1 2 3 4   /*�*Not given?  Use default.*/
say right('list: ', 22)           list
newV2= words(list)
do i=1  for newV2;  newV1.i= word(list, i) /*�*assign all the items ──► @. (array). */
end   /*�*i*/                        /*�* [↑]  #: number of items in the list.*/
say
do j=1  for newV2                              /*�*show  1 ──►  # items place and value.*/
say right('item', 20)     right(j, length(newV2))",  value:  "      qSel(1, newV2, j)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
qPart: procedure expose newV1.;  parse arg L 1 newV3,R,X;               xVal= newV1.X
parse value  newV1.X newV1.R   with   newV1.R newV1.X     /*�*swap the two names items  (X and R). */
do k=L  to R-1                      /*�*process the left side of the list.   */
if newV1.k>xVal  then iterate           /*�*when an item > item #X, then skip it.*/
parse value newV1.newV3 newV1.k  with  newV1.k newV1.newV3  /*�*swap the two named items  (? and K). */
newV3= newV3 + 1                            /*�*bump the item number (point to next).*/
end   /*�*k*/
parse       value newV1.R newV1.newV3  with  newV1.newV3 newV1.R  /*�*swap the two named items  (R and ?). */
return newV3                                  /*�*return the item number to invoker.   */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
qSel: procedure expose newV1.;  parse arg L,R,z;  if L==R  then return newV1.L  /*�*only one item?*/
do forever                               /*�*keep searching until we're all done. */
new= qPart(L, R, (L+R) % 2)              /*�*partition the list into roughly  ½.  */
newV4= new - L + 1                           /*�*calculate pivot distance less  L+1.  */
if newV4==z  then return newV1.new               /*�*we're all done with this pivot part. */
else if  z<newV4  then     R= new-1 /*�*decrease the right half of the array.*/
else do; z= z-newV4   /*�*decrease the distance.               */
L= new+1 /*�*increase the  left half *f the array.*/
end
end   /*�*forever*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Quickselect-algorithm\quickselect-algorithm-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
