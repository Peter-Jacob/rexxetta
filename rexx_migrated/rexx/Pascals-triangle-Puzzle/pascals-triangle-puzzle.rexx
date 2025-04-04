/*ͺ*REXX program solves a   (Pascal's)   "Pyramid of Numbers"   puzzle given four values. */
/*ͺ* ββββββββββββββββββββββββββββββββββββββββββββββββββββ
β                             answer               β
β                            /                     β
β              mid          /                      β
β                 \       151                      β
β                  \   Ξ±Ξ±Ξ±   Ξ±Ξ±Ξ±                   β
β                   40    Ξ±Ξ±Ξ±   Ξ±Ξ±Ξ±                β
β               Ξ±Ξ±Ξ±   Ξ±Ξ±Ξ±   Ξ±Ξ±Ξ±   Ξ±Ξ±Ξ±              β
β              x    11     y     4     z           β
β                  /              \                β
β find:           /                \               β
β x y z          b                  d              β
ββββββββββββββββββββββββββββββββββββββββββββββββββββ */
do newV1=2;     newV2= sourceLine(newV1);  n= pos('_', newV2) /*ͺ* [β]  this DO loop shows (above) box.*/
if n\==0  then leave;             say newV2       /*ͺ*only display  up to  the above line. */
end   /*ͺ*#*/;                      say         /*ͺ* [β]  this is a way for inβline doc. */
parse arg  b  d  mid  answer  .                  /*ͺ*obtain optional variables from the CL*/
if     b=='' |      b==","  then      b=  11     /*ͺ*Not specified?  Then use the default.*/
if     d=='' |      d==","  then      d=   4     /*ͺ* "      "         "   "   "     "    */
if    mid='' |    mid==","  then    mid=  40     /*ͺ* "      "         "   "   "     "    */
if answer='' | answer==","  then answer= 151     /*ͺ* "      "         "   "   "     "    */
big= answer - 4*b - 4*d    /*ͺ*calculate  BIG  number less constants*/
do      x=-big  to big
do    y=-big  to big
if x+y\==mid - 2*b  then iterate            /*ͺ*40 = x+2B+Y   ββorββ   40-2*11 = x+y */
do z=-big  to big
if z \== y - x   then iterate            /*ͺ*Z  has to equal   Y-X       (Y= X+Z) */
if x+y*6+z==big  then say right('x =', n)  x  right("y =",n)  y  right('z =',n)  z
end   /*ͺ*z*/
end      /*ͺ*y*/
end        /*ͺ*x*/                              /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pascals-triangle-Puzzle\pascals-triangle-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
