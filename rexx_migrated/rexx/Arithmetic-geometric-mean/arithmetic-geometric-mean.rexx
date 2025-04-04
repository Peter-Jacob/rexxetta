/*ͺ*REXX program calculates the  AGM  (arithmeticβgeometric mean)  of two (real) numbers. */
parse arg a b digs .                             /*ͺ*obtain optional numbers from the C.L.*/
if digs=='' | digs==","  then digs= 120          /*ͺ*No DIGS specified?  Then use default.*/
numeric digits digs                              /*ͺ*REXX will use lots of decimal digits.*/
if    a=='' |    a==","  then a= 1               /*ͺ*No A specified?  Then use the default*/
if    b=='' |    b==","  then b= 1 / sqrt(2)     /*ͺ* " B     "         "   "   "     "   */
call AGM a,b                                     /*ͺ*invoke the  AGM  function.           */
say  '1st # ='      a                            /*ͺ*display the   A   value.             */
say  '2nd # ='      b                            /*ͺ*   "     "    B     "                */
say  '  AGM ='  agm(a, b)                        /*ͺ*   "     "   AGM    "                */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
agm:  procedure: parse arg x,y;  if x=y  then return x       /*ͺ*is this an equality case?*/
if y=0  then return 0       /*ͺ*is   Y   equal to zero ? */
if x=0  then return y/2     /*ͺ* "   X     "    "   "    */
d= digits()                                /*ͺ*obtain the  current  decimal digits. */
numeric digits d + 5                       /*ͺ*add 5 more digs to ensure convergence*/
tiny= '1e-'  ||  (digits() - 1)            /*ͺ*construct a pretty tiny REXX number. */
ox= x + 1                                  /*ͺ*ensure that   the old X  Β¬=  new X.  */
do  while ox\=x  &  abs(ox)>tiny /*ͺ*compute until the old X   β‘  new X.  */
ox= x;    oy= y                  /*ͺ*save    the  old  value of  X and Y. */
x=     (ox + oy)  *  .5          /*ͺ*compute  "   new    "    "  X.       */
y= sqrt(ox * oy)                 /*ͺ*   "     "    "     "    "  Y.       */
end   /*ͺ*while*/

numeric digits d                           /*ͺ*restore the original decimal digits. */
return x / 1                               /*ͺ*normalize  X  to new    "       "    */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV1 .;  g=g *.5'e'newV1 % 2
do j=0  while h>9;      m.j=h;               h=h % 2  + 1;  end /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end /*ͺ*k*/;    return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-geometric-mean\arithmetic-geometric-mean.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
