/*ͺ*REXX program calculates the  AGM  (arithmeticβgeometric mean)  of two (real) numbers. */
parse arg a b digs .                             /*ͺ*obtain optional numbers from the C.L.*/
if digs=='' | digs==","  then digs= 100          /*ͺ*No DIGS specified?  Then use default.*/
numeric digits digs                              /*ͺ*REXX will use lots of decimal digits.*/
if a==''    | a==","     then a=1                /*ͺ*No  A  specified?   Then use default.*/
if b==''    | b==","     then b=1 / sqrt(2)      /*ͺ*No  B  specified?     "   "     "    */
call AGM a,b                                     /*ͺ*invoke AGM  &  don't show A,B,result.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
agm:  procedure: parse arg x,y;   if x=y  then return x       /*ͺ*is it an equality case? */
if y=0  then return 0       /*ͺ*is value of   Y   zero? */
if x=0  then return y / 2   /*ͺ* "   "    "   X     "   */
d= digits();   numeric digits d+5          /*ͺ*add 5 more digs to ensure convergence*/
tiny= '1e-'  ||  (digits() - 1)            /*ͺ*construct a pretty tiny REXX number. */
ox= x + 1
do newV1=1  while ox\=x & abs(ox)>tiny; ox= x;          oy= y
x= (ox+oy)/2;   y= sqrt(ox*oy)
end   /*ͺ*#*/
numeric digits d                           /*ͺ*restore  numeric digits  to original.*/
/*ͺ*this is the only output displayed βΊββ*/
say 'digits='right(d, 7)",  iterations=" right(newV1, 3)          /*ͺ* βββββββββββββββββ*/
return x/1                                 /*ͺ*normalize    X    to the new digits. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV2 .;  g=g *.5'e'newV2 % 2
do j=0  while h>9;      m.j=h;               h=h % 2  + 1;  end /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end /*ͺ*k*/;    return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-geometric-mean-Calculate-Pi\arithmetic-geometric-mean-calculate-pi-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
