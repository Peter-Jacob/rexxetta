/*�*REXX pgm shows N ints>0 that are squares and not cubes, & which are squares and cubes.*/
numeric digits 20                                /*�*ensure handling of larger numbers.   */
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 30                    /*�*Not specified?  Then use the default.*/
sqcb= N<0                                        /*�*N negative? Then show squares & cubes*/
N = abs(N)                                       /*�*define  N  to be the absolute value. */
w= (length(N) + 3)  *  3                         /*�*W:  used for aligning output columns.*/
say '   count   '                                /*�*display the  1st  line of the title. */
say '  ───────  '                                /*�*   "     "   2nd    "   "  "    "    */
newV1.= 0                                            /*�*@:  stemmed array for computed cubes.*/
newV3= 0;  newV2= 0                  /*�*count (integer): squares & not cubes.*/
do j=1  until newV3==N | newV2==N                  /*�*loop 'til enough    "    "  "    "   */
sq= j*j;          cube= sq*j;    newV1.cube= 1  /*�*compute the square of J and the cube.*/
if newV1.sq  then do
newV2= newV2 + 1                    /*�*bump the counter of squares & cubes. */
if \sqcb  then counter=   left('', 12)     /*�*don't show this counter.*/
else counter= center(newV2, 12)     /*�*  do    "    "     "    */
say counter        right(commas(sq), w)  'is a square and       a cube'
end
else do
if sqcb  then  iterate
newV3= newV3 + 1                      /*�*bump the counter of squares & ¬ cubes*/
say center(newV3, 12)  right(commas(sq), w)  'is a square and  not  a cube'
end
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Square-but-not-cube\square-but-not-cube.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
