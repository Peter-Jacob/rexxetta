/*�*REXX program displays a spiral in a  square array  (of any size)  starting at  START. */
parse arg size start .                           /*�*obtain optional arguments from the CL*/
if size =='' | size ==","  then size =5          /*�*Not specified?  Then use the default.*/
if start=='' | start==","  then start=0          /*�*Not specified?  Then use the default.*/
tot=size**2;           L=length(tot + start)     /*�*total number of elements in spiral.  */
k=size                                           /*�*K:   is the counter for the spiral.  */
row=1;       col=0                               /*�*start spiral at    row 1,  column 0. */
/*�* [↓]  construct the numbered spiral. */
do n=0  for k;   col=col + 1;    newV1.col.row=n + start;   end;   if k==0  then exit
/*�* [↑]  build the first row of spiral. */
do until  n>=tot                                                   /*�*spiral matrix.*/
do one=1  to -1  by -2  until n>=tot;     k=k - 1               /*�*perform twice.*/
do n=n  for k;   row=row + one;   newV1.col.row=n + start;   end  /*�*for the row···*/
do n=n  for k;   col=col - one;   newV1.col.row=n + start;   end  /*�* "   "  col···*/
end   /*�*one*/                                                   /*�* ↑↓ direction.*/
end      /*�*until n≥tot*/                    /*�* [↑]   done with the matrix spiral.  */
newV2.=0                                             /*�* [↓]   display spiral to the screen. */
do two=0  for 2                             /*�*1st time?  Find max column and width.*/
do   r=1  for size;  newV3=                   /*�*construct display   row  by   row.   */
do c=1  for size;  x=newV1.c.r              /*�*construct a line  column by column.  */
if two  then newV3=newV3 right(x, newV2.c)          /*�*construct a line  for the display.   */
else newV2.c=max(newV2.c, length(x))    /*�*find the maximum width of the column.*/
end   /*�*c*/                             /*�* [↓]  line has an extra leading blank*/
if two  then say substr(newV3, 2)             /*�*this SUBSTR ignores the first blank. */
end     /*�*r*/
end       /*�*two*/                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Spiral-matrix\spiral-matrix-2.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
