/*ͺ*REXX program maps a number from one range to another range.           */
/*ͺ* 31.10.2013 Walter Pachl   */
/*ͺ*                  'translated' from an older version 1 without using Procedure */
do j=0  to 10
say right(j,3)   ' maps to '   mapRange(0,10,-1,0,j)
end
exit
/*ͺ*ββββββββββββββββββββββββββββββββββMAPRANGE subroutineβββββββββββββββββ*/
mapRange: return arg(3)+(arg(5)-arg(1))*(arg(4)-arg(3))/(arg(2)-arg(1))
/*ͺ* Arguments are arg a1,a2,b1,b2,x */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Map-range\map-range-4.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
