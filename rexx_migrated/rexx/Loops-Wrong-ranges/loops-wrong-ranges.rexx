/*�*REXX program demonstrates several versions of  DO  loops with  "unusual"  iterations. */
newV1.=;      newV1.1=  '  -2      2       1  '      /*�*"normal".                                */
newV1.2=  '  -2      2       0  '      /*�*"normal",                zero  increment.*/
newV1.3=  '  -2      2      -1  '      /*�*increases away from stop, neg  increment.*/
newV1.4=  '  -2      2      10  '      /*�*1st increment > stop, positive increment.*/
newV1.5=  '   2     -2       1  '      /*�*start > stop,         positive increment.*/
newV1.6=  '   2      2       1  '      /*�*start equals stop,    positive increment.*/
newV1.7=  '   2      2      -1  '      /*�*start equals stop,    negative increment.*/
newV1.8=  '   2      2       0  '      /*�*start equals stop,       zero  increment.*/
newV1.9=  '   0      0       0  '      /*�*start equals stop,       zero  increment.*/
zLim= 10                                     /*�*a limit to check for runaway (race) loop.*/
/*�*a zero increment is not an error in REXX.*/
do k=1  while  newV1.k\==''                    /*�*perform a  DO  loop with several ranges. */
parse var   newV1.k    x  y  z  .              /*�*obtain the three values for a DO loop.   */
say
say center('start of performing DO loop number '   k   " with range: "  x y z,  79, '═')
zz= 0
do  j=x   to y   by z   until zz>=zLim           /*�* ◄───  perform the  DO  loop.*/
say '   j ───►'  right(j, max(3, length(j) ) )   /*�*right justify J for alignment*/
if z==0  then zz= zz + 1                         /*�*if zero inc, count happenings*/
end   /*�*j*/

if zz>=zLim  then say 'the DO loop for the '    k    " entry was terminated (runaway)."
say center(' end  of performing DO loop number '   k   " with range: "  x y z,  79, '─')
say
end         /*�*k*/                              /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Wrong-ranges\loops-wrong-ranges.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
