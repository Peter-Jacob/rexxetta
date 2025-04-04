/*ͺ*REXX program  plots/draws line segments  using the  Bresenham's line  (2D) algorithm. */
parse arg data                                   /*ͺ*obtain optional arguments from the CL*/
if data=''  then data= "(1,8)  (8,16)  (16,8)  (8,1)  (1,8)"         /*ͺ* βββββ a rhombus.*/
data= translate(data, , '()[]{}/,:;')            /*ͺ*elide chaff from the data points.    */
newV1.= 'Β·'                                          /*ͺ*use midβdots chars (plot background).*/
do points=1  while data\=''           /*ͺ*put the data points into an array (!)*/
parse var data x y data; newV2.points=x y /*ͺ*extract the line segments.           */
if points==1  then do;  minX= x;  maxX= x;  minY= y;  maxY= y     /*ͺ*1st case.*/
end
minX= min(minX,x);   maxX= max(maxX,x);   minY= min(minY,y);  maxY= max(maxY,y)
end   /*ͺ*points*/                      /*ͺ* [β]  data points pairs in array  !. */
border= 2                                        /*ͺ*border:  is extra space around plot. */
minX= minX - border*2;    maxX= maxX + border*2  /*ͺ*min and max  X  for the plot display.*/
minY= minY - border  ;    maxY= maxY + border    /*ͺ* "   "   "   Y   "   "    "     "    */

do x=minX  to maxX;  newV1.x.0= 'β';  end /*ͺ*draw a dash from    left ββββΊ  right.*/
do y=minY  to maxY;  newV1.0.y= 'β';  end /*ͺ*draw a pipe from  lowest ββββΊ highest*/
newV1.0.0= 'βΌ'                                       /*ͺ*define the plot's origin axis point. */
do seg=2  to points-1;     newV3= seg - 1 /*ͺ*obtain the  X and Y  line coΓΆrdinates*/
call drawLine  newV2.newV3, newV2.seg             /*ͺ*draw (plot) a line segment.          */
end      /*ͺ*seg*/                      /*ͺ* [β]  drawing the line segments.     */
/*ͺ* [β]  display the plot to terminal.  */
do    y=maxY  to minY  by -1;   newV3=    /*ͺ*display the plot one line at a time. */
do x=minX  to maxX;  newV3= newV3 || newV1.x.y /*ͺ*construct/build a line of the plot.  */
end   /*ͺ*x*/                        /*ͺ*      (a line is a "row" of points.) */
say newV3                                 /*ͺ*display a line of the plotβββΊterminal*/
end      /*ͺ*y*/                        /*ͺ* [β]  all done plotting the points.  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drawLine: procedure expose newV1.; parse arg  x y,xf yf;    parse value  '-1 -1'   with  sx sy
dx= abs(xf-x);    if x<xf  then sx= 1  /*ͺ*obtain  X  range, determine the slope*/
dy= abs(yf-y);    if y<yf  then sy= 1  /*ͺ*   "    Y    "        "      "    "  */
err= dx - dy                           /*ͺ*calculate error between adjustments. */
/*ͺ*Ξ  is the plot character for points. */
do  forever;           newV1.x.y= 'Ξ'  /*ͺ*plot the points until it's complete. */
if x=xf  &  y=yf  then return      /*ͺ*are the plot points at the finish?   */
err2= err + err                    /*ͺ*calculate  double  the error value.  */
if err2 > -dy  then  do;    err= err - dy;    x= x + sx;     end
if err2 <  dx  then  do;    err= err + dx;    y= y + sy;     end
end   /*ͺ*forever*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Bresenhams-line-algorithm\bitmap-bresenhams-line-algorithm-1.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
