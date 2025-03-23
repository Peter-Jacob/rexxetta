/*�*REXX program  generates  100  random points  in an  annulus:   10  ����ֲ  √(x²����ֲy²)  ����ֲ  15 */
parse arg pts LO HI .                            /*�*obtain optional args from the C.L.   */
if pts==''  then pts= 100                        /*�*Not specified?  Then use the default.*/
if  LO==''  then  LO= 10;            LO2= LO**2  /*�*define a shortcut for squaring   LO. */
if  HI==''  then  HI= 15;            HI2= HI**2  /*�*   "   "    "      "      "      HI. */
newV2=
do x=-HI;                      xx= x*x    /*�*generate all possible annulus points.*/
if x>0  &  xx>HI2  then leave             /*�*end of annulus points generation ?   */
do y=-HI;          s= xx + y*y
if (y<0 & s>HI2) | s<LO2  then iterate
if  y>0 & s>HI2           then leave
newV2= newV2  x','y                           /*�*add a point─set to the  $  list.     */
end   /*�*y*/
end       /*�*x*/
newV3= words(newV2);   newV1.=  /*�*def: plotchr; #pts; lines*/
do pts;  parse value word(newV2, random(1,newV3))  with  x ',' y  /*�*get rand point in annulus*/
newV1.y= overlay('☼',  newV1.y,  x+x + HI+HI + 1)                 /*�*put a plot char on a line*/
end   /*�*pts*/                                 /*�* [↑]  maintain aspect ratio on X axis*/
/*�*stick a fork in it,  we're all done. */
do y=-HI  to HI;      say newV1.y;   end          /*�*display the annulus to the terminal. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Constrained-random-points-on-a-circle\constrained-random-points-on-a-circle-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
