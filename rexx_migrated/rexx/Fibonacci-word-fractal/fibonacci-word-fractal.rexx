/*ͺ*REXX program generates a Fibonacci word,  then (normally) displays the  fractal curve.*/
parse arg order .                                /*ͺ*obtain optional arguments from the CL*/
if order=='' | order==","  then order= 23        /*ͺ*Not specified?   Then use the default*/
tell=  order>=0                                  /*ͺ*Negative order?  Then don't display. */
s= FibWord( abs(order) )                         /*ͺ*obtain the  order  of Fibonacci word.*/
x= 0;       maxX= 0;    dx= 0;    b= ' ';     newV1.   = b;    xp= 0
y= 0;       maxY= 0;    dy= 1;                newV1.0.0= .;    yp= 0
do n=1  for length(s);  x= x + dx;  y= y + dy  /*ͺ*advance the plot for the next point. */
maxX= max(maxX, x);     maxY= max(maxY, y)     /*ͺ*set the maximums for displaying plot.*/
c= 'β'                         /*ͺ*glyph (character) used for the plot. */
if dx\==0  then c= "β"                         /*ͺ*if  x+dx   isn't zero, use this char.*/
if n==1    then c= 'β'                         /*ͺ*is this the first part to be graphed?*/
newV1.x.y= c                                       /*ͺ*assign a plotting character for curve*/
if @(xp-1, yp)\==b  then if  @(xp, yp-1)\==b  then call @ xp,yp,'β'  /*ͺ*fixβup a corner*/
if @(xp-1, yp)\==b  then if  @(xp, yp+1)\==b  then call @ xp,yp,'β'  /*ͺ*   "   "    "  */
if @(xp+1, yp)\==b  then if  @(xp, yp-1)\==b  then call @ xp,yp,'β'  /*ͺ*   "   "    "  */
if @(xp+1, yp)\==b  then if  @(xp, yp+1)\==b  then call @ xp,yp,'β'  /*ͺ*   "   "    "  */
xp= x;     yp= y                               /*ͺ*save the old   x  &  y   coΓΆrdinates.*/
z= substr(s, n, 1)                             /*ͺ*assign a plot character for the graph*/
if z==1    then iterate                        /*ͺ*Is Z equal to unity?  Then ignore it.*/
ox= dx;    oy= dy                              /*ͺ*save    DX,DY   as the old versions. */
dx= 0;     dy= 0                               /*ͺ*define  DX,DY    "  "  new     "     */
d= -n//2;         if d==0  then d= 1           /*ͺ*determine the sign for the chirality.*/
if oy\==0  then dx= -sign(oy) * d              /*ͺ*Going  northβsouth?   Go  east|west  */
if ox\==0  then dy=  sign(ox) * d              /*ͺ*  "     eastβwest?     " south|north */
end   /*ͺ*n*/

call @  x, y, 'β'                                /*ͺ*set the last point that was plotted. */

do r=maxY   to 0  by -1;  newV3=              /*ͺ*show single row at a time, top first.*/
do c=0  for maxX+1;    newV3= newV3  ||  newV1.c.r /*ͺ*add a plot character (glyph) to line.*/
end   /*ͺ*c*/                            /*ͺ* [β]  construct a line char by char. */
newV3= strip(newV3, 'T')                          /*ͺ*construct a line of the graph.       */
if newV3==''  then iterate                    /*ͺ*Is the line blank?   Then ignore it. */
if tell  then say newV3                       /*ͺ*Display the line to the terminal ?   */
call lineout "FIBFRACT.OUT", newV3            /*ͺ*write graph to disk  (FIBFRACT.OUT). */
end      /*ͺ*r*/                            /*ͺ* [β]  only display the non-blank rows*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@: parse arg xx,yy,p;     if arg(3)==''  then return newV1.xx.yy;     newV1.xx.yy= p;       return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
FibWord: procedure; parse arg x; newV2.= 0;   newV2.1= 1 /*ͺ*obtain the order of  Fibonacci word. */
do k=3  to x                 /*ͺ*generate the   Kth       "       "   */
k1= k-1;    k2= k - 2 /*ͺ*calculate the  K-1  &  K-2  shortcut.*/
newV2.k= newV2.k1    ||  newV2.k2        /*ͺ*construct the next   Fibonacci word. */
end   /*ͺ*k*/                  /*ͺ* [β]  generate a         "       "   */
return newV2.x                              /*ͺ*return the    Xth        "       "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fibonacci-word-fractal\fibonacci-word-fractal.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
