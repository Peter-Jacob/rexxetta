/*ª*REXX program uses  a  Shoelace  formula to calculate the area of an  Nâ”€sided  polygon.*/
parse arg newV1;  if newV1=''  then newV1= "(3,4),(5,11),(12,8),(9,5),(5,6)"      /*ª*Use the default?*/
A= 0;                  newV2= space(newV1, 0)                   /*ª*init A; elide blanks from pts.*/
do newV3=1  until newV2=='';      parse var  newV2    '('   x.newV3   ","   y.newV3   ')'   ","   newV2
end   /*ª*#*/                                    /*ª* [â†¨]  get X and Y coÃ¶rdinates.*/
z= newV3+1;                 y.0= y.newV3;  y.z= y.1             /*ª*define low & high Y end points*/
do j=1  for newV3;  jm= j-1;  jp= j+1;   A= A + x.j*(y.jm - y.jp) /*ª*portion of area*/
end   /*ª*j*/                                    /*ª*stick a fork in it, we're done*/
say 'polygon area of '      newV3      " points: "       newV1       '  is â”€â”€â”€â–º '        abs(A/2)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Shoelace-formula-for-polygonal-area\shoelace-formula-for-polygonal-area-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
