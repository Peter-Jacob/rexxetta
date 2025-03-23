/*�*REXX program creates & draws an ASCII  Dragon Curve (or Harter-Heighway dragon curve).*/
d.= 1;   d.L= -d.;    newV1.= ' ';    x= 0;    x2= x;   y= 0;   y2= y;    z= d.;    newV1.x.y= "∙"
plotnewV4pts = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZΘ' /*�*plot chars*/
loX= 0;     hiX= 0;     loY= 0;   hiY= 0         /*�*assign various constants & variables.*/
parse arg newV2 p c .                                /*�*#:  number of iterations; P=init dir.*/
if newV2=='' | newV2==","  then newV2= 11                    /*�*Not specified?  Then use the default.*/
if p=='' | p==","  then p= 'north';     upper p  /*�* "      "         "   "   "     "    */
if c==''           then c= plotnewV4pts              /*�* "      "         "   "   "     "    */
if length(c)==2    then c= x2c(c)                /*�*was a  hexadecimal  code specified?  */
if length(c)==3    then c= d2c(c)                /*�* "  "    decimal      "      "       */
p= translate( left(p, 1), 0123, 'NESW')          /*�*get the orientation for dragon curve.*/
newV3=                                               /*�*initialize the dragon curve to a null*/
do newV2                                         /*�*create the start of a dragon curve.  */
newV3= newV3'R'reverse( translate(newV3, "RL", 'LR') )   /*�*append the rest of dragon curve.     */
end   /*�*#*/                                  /*�* [↑]  append char, flip, and reverse.*/

do j=1  for length(newV3);     newV4= substr(newV3, j, 1)  /*�*get next cardinal direction for curve*/
p= (p + d.newV4) // 4                              /*�*move dragon curve in a new direction.*/
if p< 0  then p= p + 4                         /*�*Negative?  Then use a new direction. */
if p==0  then do;  y= y + 1;  y2= y + 1;  end  /*�*curve is going  east  cartologically.*/
if p==1  then do;  x= x + 1;  x2= x + 1;  end  /*�*  "    "       south         "       */
if p==2  then do;  y= y - 1;  y2= y - 1;  end  /*�*  "    "        west         "       */
if p==3  then do;  x= x - 1;  x2= x - 1;  end  /*�*  "    "       north         "       */
if j>2**z  then z= z + 1                       /*�*identify a part of curve being built.*/
newV5= substr(c, z, 1)                             /*�*choose plot point character (glyph). */
if newV5==' '  then newV5= right(c, 1)                 /*�*Plot point a blank?  Then use a glyph*/
newV1.x.y= newV5;            newV1.x2.y2= newV5                /*�*draw part of the  dragon curve.      */
loX= min(loX,x,x2);  hiX= max(hiX,x,x2); x= x2 /*�*define the min & max  X  graph limits*/
loY= min(loY,y,y2);  hiY= max(hiY,y,y2); y= y2 /*�*   "    "   "  "  "   Y    "     "   */
end   /*�*j*/                                    /*�* [↑]  process all of  $  char string.*/
do r=loX  to hiX;     a=           /*�*nullify the line that will be drawn. */
do c=loY  to hiY;  a= a || newV1.r.c /*�*create a line (row) of curve points. */
end   /*�*c*/                      /*�* [↑] append a single column of a row.*/
if a\==''  then say strip(a, "T")  /*�*display a line (row) of curve points.*/
end      /*�*r*/                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dragon-curve\dragon-curve.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
