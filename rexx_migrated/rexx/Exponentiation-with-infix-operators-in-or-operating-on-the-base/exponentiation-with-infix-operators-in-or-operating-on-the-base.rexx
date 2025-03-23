/*�*REXX program shows exponentition with an  infix operator  (implied and/or specified).*/
newV1= '─';   newV2 = '║';   mJunct= '─╫─';   bJunct= '─╨─'       /*�*define some special glyphs. */

say @('  x  ', 5)  @("  p  ", 5)        newV2
say @('value', 5)  @("value", 5) copies(newV2        @('expression',10)  @("result",6)" ",  4)
say @(''  , 5, newV1)  @("",   5, newV1)copies(mJunct || @('',       10, newV1)  @("",   6, newV1)   ,  4)

do    x=-5  to 5  by 10                       /*�*assign   -5    and    5    to    X.  */
do p= 2  to 3                              /*�*assign    2    and    3    to    P.  */

a =  -x**p ;   b =  -(x)**p ;   c =  (-x)**p ;   d =  -(x**p)
ae= '-x**p';   be= "-(x)**p";   ce= '(-x)**p';   de= "-(x**p)"
say @(x,5)  @(p,5) newV2 @(ae, 10)    right(a, 5)" " ,
newV2 @(be, 10)    right(b, 5)" " ,
newV2 @(ce, 10)    right(c, 5)" " ,
newV2 @(de, 10)    right(d, 5)
end   /*�*p*/
end      /*�*x*/

say @(''  , 5, newV1)  @('',   5, newV1)copies(bJunct || @('',       10, newV1)  @('',   6, newV1)   ,  4)
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:    parse arg txt, w, fill;  if fill==''  then fill= ' ';   return center( txt, w, fill)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Exponentiation-with-infix-operators-in-or-operating-on-the-base\exponentiation-with-infix-operators-in-or-operating-on-the-base.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
