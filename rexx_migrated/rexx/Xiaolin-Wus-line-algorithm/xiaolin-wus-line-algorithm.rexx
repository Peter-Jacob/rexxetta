/*�*REXX program  plots/draws (ASCII)  a   line   using the   Xiaolin Wu  line algorithm. */
background= '·'                                  /*�*background character:  a middle-dot. */
image.= background                           /*�*fill the array with middle-dots.     */
plotC= '░▒▓█'                               /*�*characters used for plotting points. */
EoE= 3000                                 /*�*EOE = End Of Earth,  er, ··· graph.  */
do j=-EoE  to +EoE          /*�*define the graph: lowest ──► highest.*/
image.j.0= '─'              /*�*define the graph's horizontal axis.  */
image.0.j= '│'              /*�*   "    "     "    verical      "    */
end   /*�*j*/
image.0.0= '┼'                                  /*�*define the graph's axis origin (char)*/
parse arg xi yi xf yf .                          /*�*allow specifying the line-end points.*/
if xi=='' | xi==","  then xi= 1                  /*�*Not specified?  Then use the default.*/
if yi=='' | yi==","  then yi= 2                  /*�* "      "         "   "   "     "    */
if xf=='' | xf==","  then xf=11                  /*�* "      "         "   "   "     "    */
if yf=='' | yf==","  then yf=12                  /*�* "      "         "   "   "     "    */
minX=0;    minY=0                                /*�*use these as the limits for plotting.*/
maxX=0;    maxY=0                                /*�* "    "    "  "    "     "      "    */
call drawLine  xi, yi, xf, yf                    /*�*invoke subroutine and graph the line.*/
border=2                                         /*�*allow additional space (plot border).*/
minX=minX - border * 2;  maxX=maxX + border * 2  /*�*preserve screen's aspect ratio  {*2}.*/
minY=minY - border    ;  maxY=maxY + border
do     y=maxY  to minY  by -1;  newV2=      /*�*construct a row.*/
do x=minX  to maxX;       newV2=newV2 || image.x.y;   end  /*�*x*/
say newV2              /*�*display the constructed row to term. */
end   /*�*y*/        /*�*graph is cropped by the MINs and MAXs*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
drawLine: parse arg x1,y1,x2,y2;      switchXY=0;        dx=x2-x1
dy=y2-y1
if abs(dx)<abs(dy)  then parse value  x1 y1 x2 y2 dx dy  with  y1 x2 y2 x2 dy dx
if x2<x1       then parse value  x1 x2 y1 y2   1   with   x2 x1 y2 y1   switchXY
gradient=dy/dx
xend=round(x1)             /*�*◄─────────────────1st endpoint.══════════════*/
yend=y1 + gradient * (xend-x1);      xgap=1 - fpart(x1 + .5)
xpx11=xend;       ypx11=floor(yend)
intery=yend+gradient
call plotXY  xpx11,  ypx11,    brite(1 - fpart(yend*xgap)), switchXY
call plotXY  xpx11,  ypx11+1,  brite(    fpart(yend*xgap)), switchXY
xend=round(x2)             /*�*◄─────────────────2nd endpoint.══════════════*/
yend=y2 + gradient * (xend-x2);      xgap=    fpart(x2 + .5)
xpx12=xend;       ypx12=floor(yend)
call plotXY  xpx12,  ypx12  ,  brite(1 - fpart(yend*xgap)), switchXY
call plotXY  xpx12,  ypx12+1,  brite(    fpart(yend*xgap)), switchXY

do x=xpx11+1  to xpx12-1 /*�*◄═════════════════draw the line.═════════════*/
newV1=floor(intery)
call plotXY  x,  newV1  ,  brite(1 - fpart(intery)), switchXY
call plotXY  x,  newV1+1,  brite(    fpart(intery)), switchXY
intery=intery + gradient
end   /*�*x*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
brite:    return substr(background || plotC, 1 + round( abs( arg(1) ) * length(plotC)), 1)
floor:    parse arg newV3; newV4=trunc(newV3);  return newV4   -   (newV3<0) * (newV3\=newV4)
fpart:    parse arg newV3;              return abs(newV3 - trunc(newV3) )
round:    return   format(arg(1), , word(arg(2) 0, 1) )
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
plotXY:   parse arg xx,yy,bc,switchYX;             if switchYX  then parse arg yy,xx
image.xx.yy=bc;    minX=min(minX, xx);   maxX=max(maxX,xx)
minY=min(minY, yy);   maxY=max(maxY,yy);               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Xiaolin-Wus-line-algorithm\xiaolin-wus-line-algorithm.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
