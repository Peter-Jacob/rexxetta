/*ª*REXX program  generates  100  random points  in an  annulus:   10  â‰îå÷Ö²  âˆš(xÂ²â‰îå÷Ö²yÂ²)  â‰îå÷Ö²  15 */
parse arg pts LO HI .                            /*ª*obtain optional args from the C.L.   */
if pts==''  then pts= 100                        /*ª*Not specified?  Then use the default.*/
if  LO==''  then  LO= 10;            LO2= LO**2  /*ª*define a shortcut for squaring   LO. */
if  HI==''  then  HI= 15;            HI2= HI**2  /*ª*   "   "    "      "      "      HI. */
newV2=
do x=-HI;                      xx= x*x    /*ª*generate all possible annulus points.*/
if x>0  &  xx>HI2  then leave             /*ª*end of annulus points generation ?   */
do y=-HI;          s= xx + y*y
if (y<0 & s>HI2) | s<LO2  then iterate
if  y>0 & s>HI2           then leave
newV2= newV2  x','y                           /*ª*add a pointâ”€set to the  $  list.     */
end   /*ª*y*/
end       /*ª*x*/
newV3= words(newV2);   newV1.=  /*ª*def: plotchr; #pts; lines*/
do pts;  parse value word(newV2, random(1,newV3))  with  x ',' y  /*ª*get rand point in annulus*/
newV1.y= overlay('â˜¼',  newV1.y,  x+x + HI+HI + 1)                 /*ª*put a plot char on a line*/
end   /*ª*pts*/                                 /*ª* [â†‘]  maintain aspect ratio on X axis*/
/*ª*stick a fork in it,  we're all done. */
do y=-HI  to HI;      say newV1.y;   end          /*ª*display the annulus to the terminal. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Constrained-random-points-on-a-circle\constrained-random-points-on-a-circle-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
