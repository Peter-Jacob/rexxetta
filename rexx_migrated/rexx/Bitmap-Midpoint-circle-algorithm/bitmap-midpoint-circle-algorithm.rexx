/*ͺ*REXX program  plots  three circles  using  midpoint/Bresenham's circle algorithm.     */
newV1.= 'Β·'                                          /*ͺ*fill the array with middleβdots char.*/
minX= 0;    maxX= 0;     minY= 0;     maxY= 0    /*ͺ*initialize the minimums and maximums.*/
call drawCircle   0,   0,   8,   '#'             /*ͺ*plot 1st circle with pound character.*/
call drawCircle   0,   0,  11,   '$'             /*ͺ*  "  2nd    "     "  dollar    "     */
call drawCircle   0,   0,  19,   '@'             /*ͺ*  "  3rd    "     "  commercial at.  */
border= 2                                        /*ͺ*BORDER:  shows  N  extra grid points.*/
minX= minX - border*2;    maxX= maxX + border*2  /*ͺ*adjust min and max  X  to show border*/
minY= minY - border  ;    maxY= maxY + border    /*ͺ*   "    "   "   "   Y   "   "     "  */
if newV1.0.0==newV1.  then newV1.0.0= 'βΌ'                    /*ͺ*maybe define the plot's axis origin. */
/*ͺ*define the plot's horizontal gridβββ */
do h=minX  to maxX;  if newV1.h.0==newV1.  then newV1.h.0= 'β';  end             /*ͺ* βββββββββββββ */
do v=minY  to maxY;  if newV1.0.v==newV1.  then newV1.0.v= 'β';  end             /*ͺ* ββββββββββββ  */
/*ͺ*define the plot's vertical gridββββ  */
do y=maxY  by -1  to minY;   newV2=             /*ͺ* [β]  draw grid from  top βββΊ bottom.*/
do x=minX  to maxX;  newV2= newV2 || newV1.x.y  /*ͺ* ββββ   "    "    "  left βββΊ right. */
end   /*ͺ*x*/                         /*ͺ* [β]  a grid row should be finished. */
say newV2                                       /*ͺ*display a single row of the grid.    */
end           /*ͺ*y*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drawCircle: procedure expose newV1. minX maxX minY maxY
parse arg xx,yy,r 1 y,plotChar;     fx= 1;    fy= -2*r /*ͺ*get X,Y coΓΆrdinates*/
f= 1 - r
do x=0  while  x<y  /*ͺ*βββββββββββββββββββββββββββββββββββββββββββββ*/
if f>=0  then  do;  y= y - 1;   fy= fy + 2;   f= f + fy;   end  /*ͺ*β*/
fx= fx + 2;   f= f + fx         /*ͺ*β*/
call plotPoint  xx+x,  yy+y                                     /*ͺ*β*/
call plotPoint  xx+y,  yy+x                                     /*ͺ*β*/
call plotPoint  xx+y,  yy-x                                     /*ͺ*β*/
call plotPoint  xx+x,  yy-y                                     /*ͺ*β*/
call plotPoint  xx-y,  yy+x                                     /*ͺ*β*/
call plotPoint  xx-x,  yy+y                                     /*ͺ*β*/
call plotPoint  xx-x,  yy-y                                     /*ͺ*β*/
call plotPoint  xx-y,  yy-x                                     /*ͺ*β*/
end   /*ͺ*x*/         /*ͺ* [β]  place plot points βββΊ plot.ββββββββββββ*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
plotPoint: parse arg c,r;      newV1.c.r= plotChar   /*ͺ*assign a character to be plotted.    */
minX= min(minX,c);  maxX= max(maxX,c) /*ͺ*determine the minimum and maximum  X.*/
minY= min(minY,r);  maxY= max(maxY,r) /*ͺ*    "      "     "     "     "     Y.*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Midpoint-circle-algorithm\bitmap-midpoint-circle-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
