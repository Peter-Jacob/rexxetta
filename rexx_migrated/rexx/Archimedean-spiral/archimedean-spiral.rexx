/*ͺ*REXX pgm plots several cycles (half a spiral) of the  Archimedean spiral (ASCII plot).*/
parse arg cy a b inc chr .                       /*ͺ*obtain optional arguments from the CL*/
if  cy=='' |  cy==","   then  cy= 3              /*ͺ*Not specified?  Then use the default.*/
if   a=='' |   a==","   then   a= 1              /*ͺ* "      "         "   "   "     "    */
if   b=='' |   b==","   then   b= 9              /*ͺ* "      "         "   "   "     "    */
if inc=='' | inc==","   then inc= 0.02           /*ͺ* "      "         "   "   "     "    */
if chr=='' | chr==","   then chr= 'β'            /*ͺ* "      "         "   "   "     "    */
if length(chr)==3  then chr= d2c(chr)            /*ͺ*plot character coded in     decimal? */
if length(chr)==2  then chr= x2c(chr)            /*ͺ*  "      "       "    " hexadecimal? */
cy= max(2, cy);         LOx= .                   /*ͺ*set the  LOx  variable (a semaphore).*/
parse value scrsize()   with   sd  sw  .         /*ͺ*get the size of the terminal screen. */
w= sw - 1        ;      mw= w * (cy-1) * 4       /*ͺ*set useable width; max width for calc*/
h= sd - 1 + cy*10;      mh= h * (cy-1)           /*ͺ* "     "    depth;  "  depth  "   "  */
newV1.=                                              /*ͺ*initialize the line based plot field.*/
do t=1  to pi()*cy  by inc              /*ͺ*calc all the coΓΆrdinates for spiral. */
r= a +  b*    t                         /*ͺ*  "   "   "       R       "    "     */
x= w +  r*cos(t);     xx= x % 2         /*ͺ*  "   "   "       X       "    "     */
y= h +  r*sin(t);     yy= y % 2         /*ͺ*  "   "   "       Y       "    "     */
if x<0 | y<0 | x>mw | y>mh then iterate /*ͺ*Is X or Y  out of bounds?  Then skip.*/
if LOx==.  then do;   LOx= xx;      HIx= xx;      LOy= yy;       HIy= yy
end                     /*ͺ* [β]  find the minimums and maximums.*/
LOx= min(LOx, xx);    HIx= max(HIx, xx) /*ͺ*determine the   X   MIN  and  MAX.   */
LOy= min(LOy, yy);    HIy= max(HIy, yy) /*ͺ*    "      "    Y    "    "    "     */
newV1.yy= overlay(chr, newV1.yy, xx+1)          /*ͺ*assign the plot character (glyph).   */
end   /*ͺ*t*/
call plot                                        /*ͺ*invoke plotting subroutine (to term).*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pi:   pi=3.1415926535897932384626433832795028841971693993751058209749445923078; return pi
plot:      do row=HIy  to LOy  by -1;   say substr(newV1.row, LOx+1);   end;        return
r2r:  return arg(1)  //  (pi() * 2)             /*ͺ*normalize radians ββββΊ a unit circle.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos:  procedure; parse arg x;  x= r2r(x);  newV2= 1;  a= abs(x);    hpi= pi * .5
numeric fuzz  min(6, digits() - 3);         if a=pi       then return -1
if a=hpi | a=hpi*3  then return  0          if a=pi / 3   then return .5
if a=pi * 2 / 3     then return -.5;        q= x*x;       z= 1
do k=2  by 2  until p=z;   p= z;   newV2= -newV2 *q/(k*k-k);    z= z+newV2;   end;    return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sin:  procedure; parse arg x;  x= r2r(x);  newV2= x;  numeric fuzz min(5, max(1, digits() -3))
if x=pi * .5         then return 1;         if x==pi*1.5  then return -1
if abs(x)=pi | x=0   then return 0;         q= x*x;       z= x
do k=2  by 2  until p=z;   p= z;   newV2= -newV2 *q/(k*k+k);    z= z+newV2;   end;    return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Archimedean-spiral\archimedean-spiral.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
