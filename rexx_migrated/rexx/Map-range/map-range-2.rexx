/*�*REXX program maps and displays a  range of numbers from  one range  to  another range.*/
rangeA =  10   0                                       /*�*or:   rangeA =   '  0  10 '    */
rangeB =  -1   0                                       /*�*or:   rangeB =   " -1   0 "    */
parse  var   rangeA  L  H
inc= 1/2
do j=L  to H  by inc * (1 - 2 * sign(H<L) )  /*�*BY:   either   +inc  or  -inc  */
say right(j, 9)      ' maps to '      mapR(rangeA, rangeB, j)
end   /*�*j*/
exit                                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mapR: procedure; parse arg a1 a2,b1 b2,s;newV1=b1+(s-a1)*(b2-b1)/(a2-a1);return left('',newV1>=0)newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Map-range\map-range-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
