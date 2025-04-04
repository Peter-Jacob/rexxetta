/*ͺ*REXX program to compute and display   Stirling numbers   of the second kind.          */
parse arg lim .                                  /*ͺ*obtain optional argument from the CL.*/
if lim=='' | lim==","  then lim= 12              /*ͺ*Not specified?  Then use the default.*/
olim= lim                                        /*ͺ*save     the original value of  LIM. */
lim= abs(lim)                                    /*ͺ*only use the absolute value of  LIM. */
numeric digits max(9, 2*lim)                     /*ͺ*(over) specify maximum number in grid*/
newV1.=
do j=0  for lim+1
newV1.j.j = 1;  if j==0  then iterate   /*ͺ*define the right descending diagonal.*/
newV1.0.j = 0;  newV1.j.0 = 0               /*ͺ*   "    "  zero  values.             */
end   /*ͺ*j*/
max#.= 0                                         /*ͺ* [β]  calculate values for the grid. */
do   n=0  for lim+1;         np= n + 1
do k=1  for lim;           km= k - 1
newV1.np.k = k * newV1.n.k  +  newV1.n.km        /*ͺ*calculate a number in the grid.      */
max#.k= max(max#.k, newV1.n.k)           /*ͺ*find the maximum value for a column. */
max#.b= max(max#.b, newV1.n.k)           /*ͺ*find the maximum value for all rows. */
end   /*ͺ*k*/
end     /*ͺ*n*/
/*ͺ* [β]  only show the maximum value ?  */
do k=0  for lim+1                        /*ͺ*find max column width for each column*/
max#.a= max#.a + length(max#.k)
end   /*ͺ*k*/

w= length(max#.b)                                /*ͺ*calculate max width of all numbers.  */
if olim<0  then do;  say 'The maximum value  (which has '       w      " decimal digits):"
say max#.b                  /*ͺ*display maximum number in the grid.  */
exit                        /*ͺ*stick a fork in it,  we're all done. */
end
wgi= max(5, length(lim+1) )                      /*ͺ*the maximum width of the grid's index*/
say 'βrowβ'  center("columns", max(9, max#.a + lim), 'β')  /*ͺ*display header of the grid.*/

do   r=0  for lim+1;        newV2=               /*ͺ* [β]  display the grid to the term.  */
do c=0  for lim+1  until c>=r              /*ͺ*build a row of grid, 1 col at a time.*/
newV2= newV2  right(newV1.r.c, length(max#.c) )        /*ͺ*append a column to a row of the grid.*/
end   /*ͺ*c*/
say center(r, wgi)  strip( substr(newV2,2), 'T') /*ͺ*display a single row of the grid.    */
end     /*ͺ*r*/                                /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stirling-numbers-of-the-second-kind\stirling-numbers-of-the-second-kind.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
