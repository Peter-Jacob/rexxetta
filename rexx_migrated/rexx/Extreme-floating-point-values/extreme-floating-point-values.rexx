/*�*REXX pgm shows smallest & largest positive numbers that can be expressed, compares 0's*/
parse version v;    say 'version=' v;    say
zero=  '0.0'                                          /*�*a (positive) value for zero. */
negZero= '-0.0'                                          /*�*"  negative     "   "    "   */
say 'value of zero         equals negZero: '     word('no yes',   1 + (zero  = negZero) )
say 'value of zero exactly equals negZero: '     word('no yes',   1 + (zero == negZero) )
say
do digs=20  by 20  to 100;   numeric digits digs          /*�*use a range of digits. */
say center(' number of decimal digits being used:'  digs" ", 79, '═')
say 'tiny=' tiny()
say 'huge=' huge()
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tiny:  return newV1xnum('1e-')
huge:  return newV1xnum('.'copies(9, digits() )"e+")
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV1xnum: procedure;  parse arg newV1                           /*�*use the given mantissa value.*/
newV2=10                                              /*�*use starting  exponent value.*/
do forever;  newV3=newV1 || newV2            /*�*construct a REXX decimal num.*/
if \datatype(newV3, 'N')  then leave /*�*Not numeric?   Then leave.   */
p=newV2;         newV2=newV2 * 10            /*�*save number; magnify mantissa*/
end   /*�*forever*/
j=newV2 % 2                                           /*�*halve the exponent (power).  */
do forever;  newV3=newV1 || newV2            /*�* [+]  Not numeric?  Halve it.*/
if \datatype(newV3, 'N')  then do; newV2=p;     j=j % 2
if j==0  then leave
end
p=newV2;         newV2=newV2 + j             /*�*save number;  bump mantissa. */
end   /*�*forever*/
return newV1 || newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Extreme-floating-point-values\extreme-floating-point-values.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
