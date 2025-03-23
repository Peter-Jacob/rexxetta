/*ª*REXX program displays a spiral in a  square array  (of any size)  starting at  START. */
parse arg size start .                           /*ª*obtain optional arguments from the CL*/
if size =='' | size ==","  then size =5          /*ª*Not specified?  Then use the default.*/
if start=='' | start==","  then start=0          /*ª*Not specified?  Then use the default.*/
tot=size**2;           L=length(tot + start)     /*ª*total number of elements in spiral.  */
k=size                                           /*ª*K:   is the counter for the spiral.  */
row=1;       col=0                               /*ª*start spiral at    row 1,  column 0. */
/*ª* [â†“]  construct the numbered spiral. */
do n=0  for k;   col=col + 1;    newV1.col.row=n + start;   end;   if k==0  then exit
/*ª* [â†‘]  build the first row of spiral. */
do until  n>=tot                                                   /*ª*spiral matrix.*/
do one=1  to -1  by -2  until n>=tot;     k=k - 1               /*ª*perform twice.*/
do n=n  for k;   row=row + one;   newV1.col.row=n + start;   end  /*ª*for the rowÂ·Â·Â·*/
do n=n  for k;   col=col - one;   newV1.col.row=n + start;   end  /*ª* "   "  colÂ·Â·Â·*/
end   /*ª*one*/                                                   /*ª* â†‘â†“ direction.*/
end      /*ª*until nâ‰¥tot*/                    /*ª* [â†‘]   done with the matrix spiral.  */
newV2.=0                                             /*ª* [â†“]   display spiral to the screen. */
do two=0  for 2                             /*ª*1st time?  Find max column and width.*/
do   r=1  for size;  newV3=                   /*ª*construct display   row  by   row.   */
do c=1  for size;  x=newV1.c.r              /*ª*construct a line  column by column.  */
if two  then newV3=newV3 right(x, newV2.c)          /*ª*construct a line  for the display.   */
else newV2.c=max(newV2.c, length(x))    /*ª*find the maximum width of the column.*/
end   /*ª*c*/                             /*ª* [â†“]  line has an extra leading blank*/
if two  then say substr(newV3, 2)             /*ª*this SUBSTR ignores the first blank. */
end     /*ª*r*/
end       /*ª*two*/                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Spiral-matrix\spiral-matrix-2.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
