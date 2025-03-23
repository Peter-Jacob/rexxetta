/*ª*REXX program displays a spiral in a  square array  (of any size)  starting at  START. */
parse arg size start .                           /*ª*obtain optional arguments from the CL*/
if size =='' | size ==","  then size =5          /*ª*Not specified?  Then use the default.*/
if start=='' | start==","  then start=0          /*ª*Not specified?  Then use the default.*/
tot=size**2;           L=length(tot + start)     /*ª*total number of elements in spiral.  */
k=size                                           /*ª*K:   is the counter for the spiral.  */
row=1;       col=0                               /*ª*start spiral at    row 1,  column 0. */
/*ª* [â†“]  construct the numbered spiral. */
do n=0  for k;    col=col + 1;   newV1.col.row=n + start;   end;       if k==0  then exit
/*ª* [â†‘]  build the first row of spiral. */
do until  n>=tot                                                   /*ª*spiral matrix.*/
do one=1  to -1  by -2  until n>=tot;   k=k-1                   /*ª*perform twice.*/
do n=n  for k;   row=row + one;    newV1.col.row=n + start;   end /*ª*for the rowÂ·Â·Â·*/
do n=n  for k;   col=col - one;    newV1.col.row=n + start;   end /*ª* "   "  colÂ·Â·Â·*/
end   /*ª*one*/                                                   /*ª* â†‘â†“ direction.*/
end      /*ª*until nâ‰¥tot*/                    /*ª* [â†‘]   done with the matrix spiral.  */
/*ª* [â†“]   display spiral to the screen. */
do      r=1  for size;    newV2=   right(newV1.1.r, L) /*ª*construct display   row   by    row. */
do c=2  for size -1; newV2=newV2  right(newV1.c.r, L) /*ª*construct a line  for the display.   */
end   /*ª*col*/                             /*ª* [â†‘]  line has an extra leading blank*/
say newV2                                          /*ª*display a line (row) of the spiral.  */
end      /*ª*row*/                               /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Spiral-matrix\spiral-matrix-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
