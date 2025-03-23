/*ª*REXX program creates & draws an ASCII  Dragon Curve (or Harter-Heighway dragon curve).*/
d.= 1;   d.L= -d.;    newV1.= ' ';    x= 0;    x2= x;   y= 0;   y2= y;    z= d.;    newV1.x.y= "âˆ™"
plotnewV4pts = '123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZÎ˜' /*ª*plot chars*/
loX= 0;     hiX= 0;     loY= 0;   hiY= 0         /*ª*assign various constants & variables.*/
parse arg newV2 p c .                                /*ª*#:  number of iterations; P=init dir.*/
if newV2=='' | newV2==","  then newV2= 11                    /*ª*Not specified?  Then use the default.*/
if p=='' | p==","  then p= 'north';     upper p  /*ª* "      "         "   "   "     "    */
if c==''           then c= plotnewV4pts              /*ª* "      "         "   "   "     "    */
if length(c)==2    then c= x2c(c)                /*ª*was a  hexadecimal  code specified?  */
if length(c)==3    then c= d2c(c)                /*ª* "  "    decimal      "      "       */
p= translate( left(p, 1), 0123, 'NESW')          /*ª*get the orientation for dragon curve.*/
newV3=                                               /*ª*initialize the dragon curve to a null*/
do newV2                                         /*ª*create the start of a dragon curve.  */
newV3= newV3'R'reverse( translate(newV3, "RL", 'LR') )   /*ª*append the rest of dragon curve.     */
end   /*ª*#*/                                  /*ª* [â†‘]  append char, flip, and reverse.*/

do j=1  for length(newV3);     newV4= substr(newV3, j, 1)  /*ª*get next cardinal direction for curve*/
p= (p + d.newV4) // 4                              /*ª*move dragon curve in a new direction.*/
if p< 0  then p= p + 4                         /*ª*Negative?  Then use a new direction. */
if p==0  then do;  y= y + 1;  y2= y + 1;  end  /*ª*curve is going  east  cartologically.*/
if p==1  then do;  x= x + 1;  x2= x + 1;  end  /*ª*  "    "       south         "       */
if p==2  then do;  y= y - 1;  y2= y - 1;  end  /*ª*  "    "        west         "       */
if p==3  then do;  x= x - 1;  x2= x - 1;  end  /*ª*  "    "       north         "       */
if j>2**z  then z= z + 1                       /*ª*identify a part of curve being built.*/
newV5= substr(c, z, 1)                             /*ª*choose plot point character (glyph). */
if newV5==' '  then newV5= right(c, 1)                 /*ª*Plot point a blank?  Then use a glyph*/
newV1.x.y= newV5;            newV1.x2.y2= newV5                /*ª*draw part of the  dragon curve.      */
loX= min(loX,x,x2);  hiX= max(hiX,x,x2); x= x2 /*ª*define the min & max  X  graph limits*/
loY= min(loY,y,y2);  hiY= max(hiY,y,y2); y= y2 /*ª*   "    "   "  "  "   Y    "     "   */
end   /*ª*j*/                                    /*ª* [â†‘]  process all of  $  char string.*/
do r=loX  to hiX;     a=           /*ª*nullify the line that will be drawn. */
do c=loY  to hiY;  a= a || newV1.r.c /*ª*create a line (row) of curve points. */
end   /*ª*c*/                      /*ª* [â†‘] append a single column of a row.*/
if a\==''  then say strip(a, "T")  /*ª*display a line (row) of curve points.*/
end      /*ª*r*/                     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dragon-curve\dragon-curve.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
