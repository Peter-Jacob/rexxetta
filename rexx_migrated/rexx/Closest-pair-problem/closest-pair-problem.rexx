/*�*REXX program  solves the   closest pair   of  points  problem  (in two dimensions).   */
parse arg N LO HI seed .                         /*�*obtain optional arguments from the CL*/
if  N=='' |  N==","  then  N=   100              /*�*Not specified?  Then use the default.*/
if LO=='' | LO==","  then LO=     0              /*�* "      "         "   "   "     "    */
if HI=='' | HI==","  then HI= 20000              /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')   then call random ,,seed /*�*seed for RANDOM (BIF)  repeatability.*/
w= length(HI);     w= w + (w//2==0)              /*�*W:   for aligning the output columns.*/

/*�*╔══════════════════════╗*/      do j=1  for N            /*�*generate N random points*/
/*�*║ generate  N  points. ║*/      newV1.j= random(LO, HI)     /*�*    "    a    "     X   */
/*�*╚══════════════════════╝*/      newV2.j= random(LO, HI)     /*�*    "    a    "     Y   */
end   /*�*j*/              /*�*X  &  Y  make the point.*/
A= 1;  B= 2                            /*�* [↓]  MIND  is actually the squared  */
minD= (newV1.A - newV1.B)**2   +   (newV2.A - newV2.B)**2    /*�* distance between the 1st two points.*/
/*�* [↓]  use of XJ & YJ speed things up.*/
do   j=1    for N-1;  xj= newV1.j;   yj= newV2.j   /*�*find min distance between a point ···*/
do k=j+1  for N-j-1                        /*�*  ··· and all other (higher) points. */
sd= (xj - newV1.k)**2   +   (yj - newV2.k)**2    /*�*compute squared distance from points.*/
if sd<minD  then parse  value     sd  j  k      with      minD  A  B
end   /*�*k*/                                /*�* [↑]  needn't take SQRT of SD  (yet).*/
end     /*�*j*/                                /*�* [↑]  when done, A & B are the points*/
newV3= 'For '   N   " points, the minimum distance between the two points:  "
say newV3 center("x", w, '═')" "     center('y', w, "═")     '  is: '     sqrt( abs(minD)) / 1
say left('', length(newV3) - 1)      "["right(newV1.A, w)','           right(newV2.A, w)"]"
say left('', length(newV3) - 1)      "["right(newV1.B, w)','           right(newV2.B, w)"]"
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits;  parse value format(x,2,1,,0) 'E0' with g 'E' newV4 .;  g= g *.5'e'newV4 % 2
do j=0  while h>9;      m.j= h;              h= h % 2  +  1;  end  /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g= (g+x/g)*.5;   end  /*�*k*/; return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Closest-pair-problem\closest-pair-problem.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
