/*�*REXX program uses a  circle sort algorithm  to sort an array (or list) of numbers.    */
parse arg x                                      /*�*obtain optional arguments from the CL*/
if x='' | x=","  then x= 6 7 8 9 2 5 3 4 1       /*�*Not specified?  Then use the default.*/
call makenewV2array  'before sort:'                  /*�*display the list and make an array.  */
call circleSort       #                          /*�*invoke the circle sort subroutine.   */
call makenewV2list   ' after sort:'                  /*�*make a list and display it to console*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
circleSort:      do while  .circleSrt(1, arg(1), 0)\==0;     end;                   return
makenewV2array: #= words(x);    do i=1 for #;  newV1.i= word(x, i);  end;  say arg(1)  x;   return
makenewV2list:  y= newV1.1;         do j=2 for #-1;  y= y  newV1.j;      end;  say arg(1)  y;   return
.swap:      parse arg a,b;  parse  value  newV1.a newV1.b  with  newV1.b newV1.a;  swaps= swaps+1;  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.circleSrt: procedure expose newV1.;  parse arg LO,HI,swaps    /*�*obtain  LO & HI  arguments.*/
if LO==HI  then return swaps                   /*�*1 element?  Done with sort.*/
high= HI;      low= LO;     mid= (HI-LO) % 2   /*�*assign some indices.       */
/*�* [↓]  sort a section of #'s*/
do  while LO<HI                     /*�*sort within a section.     */
if newV1.LO>newV1.HI  then call .swap LO,HI /*�*are numbers out of order ? */
LO= LO + 1;        HI= HI - 1       /*�*add to LO;  shrink the HI. */
end   /*�*while*/                     /*�*just process one section.  */
newV2= HI + 1                                      /*�*point to  HI  plus one.    */
if LO==HI  &  newV1.LO>newV1.newV2  then call .swap LO, newV2  /*�*numbers still out of order?*/
swaps= .circleSrt(low,        low+mid,  swaps) /*�*sort the   lower  section. */
swaps= .circleSrt(low+mid+1,  high,     swaps) /*�*  "   "   higher     "     */
return swaps                                   /*�*the section sorting is done*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-Algorithms-Circle-Sort\sorting-algorithms-circle-sort.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
