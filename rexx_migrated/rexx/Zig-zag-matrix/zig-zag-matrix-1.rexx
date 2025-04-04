/*ͺ*REXX program  produces and displays a    zigβzag  matrix   (a square array).          */
parse arg n start inc .                          /*ͺ*obtain optional arguments from the CL*/
if     n=='' |     n==","  then     n= 5         /*ͺ*Not specified?  Then use the default.*/
if start=='' | start==","  then start= 0         /*ͺ* "      "         "   "   "     "    */
if   inc=='' |   inc==","  then   inc= 1         /*ͺ* "      "         "   "   "     "    */
row= 1;           col= 1;        size= n**2      /*ͺ*start: 1st row & column;  array size.*/
do j=start  by inc  for size;    newV1.row.col= j
if (row+col)//2==0  then do;  if col<n    then col= col+1;     else row= row+2
if row\==1  then row= row-1
end
else do;  if row<n    then row= row+1;     else col= col+2
if col\==1  then col= col-1
end
end   /*ͺ*j*/                              /*ͺ* [β]     //    is REXX  Γ·  remainder.*/
call show                                        /*ͺ*display a (square) matrixβββΊterminal.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: w= max(length(start), length(start+size*inc))  /*ͺ*max width of any matrix elements,*/
do   r=1  for n  ;  newV2=   right(newV1.r.1, w)     /*ͺ*show the rows of the matrix.     */
do c=2  for n-1;  newV2= newV2 right(newV1.r.c, w)     /*ͺ*build a line for output of a row.*/
end   /*ͺ*c*/;  say newV2                        /*ͺ* [β]  align the matrix elements. */
end     /*ͺ*r*/;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zig-zag-matrix\zig-zag-matrix-1.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
