/*ª*REXX program uses a  Shoelace  formula to calculate the area of an  N-sided  polygon. */
parse arg pts;           newV1 = 'polygon area of '  /*ª*get optional args from the CL.*/
if pts=''  then pts= '(3,4),(5,11),(12,8),(9,5),(5,6)'  /*ª*Not specified?   Use default. */
newV2= pts                         /*ª*elide extra blanks;  save pts.*/
do newV3=1  until newV2=''                           /*ª*perform destructive parse on @*/
parse var newV2  '('  x.newV3  ","  y.newV3  ')'  ","  newV2 /*ª*obtain  X  and  Y  coÃ¶rdinates*/
end   /*ª*#*/
A= 0                                                    /*ª*initialize the  area  to zero.*/
do j=1  for newV3;  jp=j+1;  if jp>newV3   then jp=1 /*ª*adjust for  J  for overflow.  */
jm=j-1;  if jm==0  then jm=newV3 /*ª*   "    "   "   "  underflow. */
A=A + x.j * (y.jp - y.jm)                    /*ª*compute a part of the area.   */
end   /*ª*j*/
say newV1  newV3  " points: " pts '  is â”€â”€â”€â–º '  abs(A/2) /*ª*stick a fork in it, we're done*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Shoelace-formula-for-polygonal-area\shoelace-formula-for-polygonal-area-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
