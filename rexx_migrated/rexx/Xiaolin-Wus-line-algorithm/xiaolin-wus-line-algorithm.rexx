/*ͺ*REXX program  plots/draws (ASCII)  a   line   using the   Xiaolin Wu  line algorithm. */
background= 'Β·'                                  /*ͺ*background character:  a middle-dot. */
image.= background                           /*ͺ*fill the array with middle-dots.     */
plotC= 'ββββ'                               /*ͺ*characters used for plotting points. */
EoE= 3000                                 /*ͺ*EOE = End Of Earth,  er, Β·Β·Β· graph.  */
do j=-EoE  to +EoE          /*ͺ*define the graph: lowest βββΊ highest.*/
image.j.0= 'β'              /*ͺ*define the graph's horizontal axis.  */
image.0.j= 'β'              /*ͺ*   "    "     "    verical      "    */
end   /*ͺ*j*/
image.0.0= 'βΌ'                                  /*ͺ*define the graph's axis origin (char)*/
parse arg xi yi xf yf .                          /*ͺ*allow specifying the line-end points.*/
if xi=='' | xi==","  then xi= 1                  /*ͺ*Not specified?  Then use the default.*/
if yi=='' | yi==","  then yi= 2                  /*ͺ* "      "         "   "   "     "    */
if xf=='' | xf==","  then xf=11                  /*ͺ* "      "         "   "   "     "    */
if yf=='' | yf==","  then yf=12                  /*ͺ* "      "         "   "   "     "    */
minX=0;    minY=0                                /*ͺ*use these as the limits for plotting.*/
maxX=0;    maxY=0                                /*ͺ* "    "    "  "    "     "      "    */
call drawLine  xi, yi, xf, yf                    /*ͺ*invoke subroutine and graph the line.*/
border=2                                         /*ͺ*allow additional space (plot border).*/
minX=minX - border * 2;  maxX=maxX + border * 2  /*ͺ*preserve screen's aspect ratio  {*2}.*/
minY=minY - border    ;  maxY=maxY + border
do     y=maxY  to minY  by -1;  newV2=      /*ͺ*construct a row.*/
do x=minX  to maxX;       newV2=newV2 || image.x.y;   end  /*ͺ*x*/
say newV2              /*ͺ*display the constructed row to term. */
end   /*ͺ*y*/        /*ͺ*graph is cropped by the MINs and MAXs*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drawLine: parse arg x1,y1,x2,y2;      switchXY=0;        dx=x2-x1
dy=y2-y1
if abs(dx)<abs(dy)  then parse value  x1 y1 x2 y2 dx dy  with  y1 x2 y2 x2 dy dx
if x2<x1       then parse value  x1 x2 y1 y2   1   with   x2 x1 y2 y1   switchXY
gradient=dy/dx
xend=round(x1)             /*ͺ*ββββββββββββββββββ1st endpoint.ββββββββββββββ*/
yend=y1 + gradient * (xend-x1);      xgap=1 - fpart(x1 + .5)
xpx11=xend;       ypx11=floor(yend)
intery=yend+gradient
call plotXY  xpx11,  ypx11,    brite(1 - fpart(yend*xgap)), switchXY
call plotXY  xpx11,  ypx11+1,  brite(    fpart(yend*xgap)), switchXY
xend=round(x2)             /*ͺ*ββββββββββββββββββ2nd endpoint.ββββββββββββββ*/
yend=y2 + gradient * (xend-x2);      xgap=    fpart(x2 + .5)
xpx12=xend;       ypx12=floor(yend)
call plotXY  xpx12,  ypx12  ,  brite(1 - fpart(yend*xgap)), switchXY
call plotXY  xpx12,  ypx12+1,  brite(    fpart(yend*xgap)), switchXY

do x=xpx11+1  to xpx12-1 /*ͺ*ββββββββββββββββββdraw the line.βββββββββββββ*/
newV1=floor(intery)
call plotXY  x,  newV1  ,  brite(1 - fpart(intery)), switchXY
call plotXY  x,  newV1+1,  brite(    fpart(intery)), switchXY
intery=intery + gradient
end   /*ͺ*x*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
brite:    return substr(background || plotC, 1 + round( abs( arg(1) ) * length(plotC)), 1)
floor:    parse arg newV3; newV4=trunc(newV3);  return newV4   -   (newV3<0) * (newV3\=newV4)
fpart:    parse arg newV3;              return abs(newV3 - trunc(newV3) )
round:    return   format(arg(1), , word(arg(2) 0, 1) )
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
plotXY:   parse arg xx,yy,bc,switchYX;             if switchYX  then parse arg yy,xx
image.xx.yy=bc;    minX=min(minX, xx);   maxX=max(maxX,xx)
minY=min(minY, yy);   maxY=max(maxY,yy);               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Xiaolin-Wus-line-algorithm\xiaolin-wus-line-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
