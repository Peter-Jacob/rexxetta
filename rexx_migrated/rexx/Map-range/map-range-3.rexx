/*�*REXX program maps and displays a  range of numbers from  one range  to  another range.*/
rangeA =   0   10
rangeB =  -1    0
inc = 1
call mapR rangeA, rangeB, inc
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mapR: procedure;  parse arg a1 a2, b1 b2, inc    /*�* [↓]  BY  is  either   +inc  or -inc.*/
do s=a1   to a2   by  inc  *  (1  -  2  *  sign(a2 < a1) )
t= b1 + (s-a1) * (b2-b1) / (a2-a1)
say right(s, 9)        ' maps to'          left('', t>=0)      t
end   /*�*s*/
return                                     /*�* [↑]  LEFT··· aligns non─negative #'s*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Map-range\map-range-3.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
