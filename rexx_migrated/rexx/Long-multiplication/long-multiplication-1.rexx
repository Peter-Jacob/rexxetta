/*ª*REXX program  performs  long multiplication  on  two numbers  (without the "E").      */
numeric digits 300                               /*ª*be able to handle gihugeic input #s. */
parse arg x y .                                  /*ª*obtain optional arguments from the CL*/
if x=='' | x==","  then x= 2**64                 /*ª*Not specified?  Then use the default.*/
if y=='' | y==","  then y= x                     /*ª* "      "         "   "   "     "    */
if x<0  &&  y<0    then sign= '-'                /*ª*there only a single negative number? */
else sign=                    /*ª*no, then result sign must be positive*/
xx=x;    x=strip(x, 'T', .);      x1= left(x, 1) /*ª*remove any trailing decimal points.  */
yy=y;    y=strip(y, 'T', .);      y1= left(y, 1) /*ª*   "    "     "        "       "     */
if x1=='-' | x1=="+"  then x= substr(x, 2)       /*ª*remove a leading  Â±  sign.           */
if y1=='-' | y1=="+"  then y= substr(y, 2)       /*ª*   "   "    "     "    "             */
parse var x  '.' xf;  parse var y  "." yf        /*ª*obtain the fractional part of X and Y*/
newV1= length(xf || yf)                              /*ª*#: digits past the decimal points (.)*/
x= space( translate( x, , .),  0)                /*ª*remove decimal point if there is any.*/
y= space( translate( y, , .),  0)                /*ª*   "       "     "    "    "   "  "  */
Lx= length(x);  Ly=length(y)                     /*ª*get the lengths of the new  X and Y. */
numeric digits max(digits(), Lx + Ly)            /*ª*use a new  decimal digits  precision.*/
newV2= 0                                             /*ª*$:  is the product  (so far).        */
do j=Ly  by -1  for Ly         /*ª*almost like REXX does it, Â·Â·Â· but no.*/
newV2= newV2  +  ((x*substr(y, j, 1))copies(0, Ly-j) )
end   /*ª*j*/
f= length(newV2) - newV1                                 /*ª*does product has enough decimal digs?*/
if f<0  then newV2=copies(0, abs(f) + 1)newV2            /*ª*Negative?  Add leading 0s for INSERT.*/
say 'long mult:'  xx  "*"  yy  'â”€â”€â–º'   sign || strip( insert(., newV2, length(newV2) - newV1), 'T', .)
say ' builtâ”€in:'  xx  "*"  yy  'â”€â”€â–º'   xx*yy     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-multiplication\long-multiplication-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
