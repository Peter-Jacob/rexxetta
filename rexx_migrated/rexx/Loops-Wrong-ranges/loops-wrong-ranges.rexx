/*ª*REXX program demonstrates several versions of  DO  loops with  "unusual"  iterations. */
newV1.=;      newV1.1=  '  -2      2       1  '      /*ª*"normal".                                */
newV1.2=  '  -2      2       0  '      /*ª*"normal",                zero  increment.*/
newV1.3=  '  -2      2      -1  '      /*ª*increases away from stop, neg  increment.*/
newV1.4=  '  -2      2      10  '      /*ª*1st increment > stop, positive increment.*/
newV1.5=  '   2     -2       1  '      /*ª*start > stop,         positive increment.*/
newV1.6=  '   2      2       1  '      /*ª*start equals stop,    positive increment.*/
newV1.7=  '   2      2      -1  '      /*ª*start equals stop,    negative increment.*/
newV1.8=  '   2      2       0  '      /*ª*start equals stop,       zero  increment.*/
newV1.9=  '   0      0       0  '      /*ª*start equals stop,       zero  increment.*/
zLim= 10                                     /*ª*a limit to check for runaway (race) loop.*/
/*ª*a zero increment is not an error in REXX.*/
do k=1  while  newV1.k\==''                    /*ª*perform a  DO  loop with several ranges. */
parse var   newV1.k    x  y  z  .              /*ª*obtain the three values for a DO loop.   */
say
say center('start of performing DO loop number '   k   " with range: "  x y z,  79, 'â•')
zz= 0
do  j=x   to y   by z   until zz>=zLim           /*ª* â—„â”€â”€â”€  perform the  DO  loop.*/
say '   j â”€â”€â”€â–º'  right(j, max(3, length(j) ) )   /*ª*right justify J for alignment*/
if z==0  then zz= zz + 1                         /*ª*if zero inc, count happenings*/
end   /*ª*j*/

if zz>=zLim  then say 'the DO loop for the '    k    " entry was terminated (runaway)."
say center(' end  of performing DO loop number '   k   " with range: "  x y z,  79, 'â”€')
say
end         /*ª*k*/                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Wrong-ranges\loops-wrong-ranges.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
