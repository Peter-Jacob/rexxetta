/*ͺ*REXX program performs  bitβwise operations  on integers:   &   |   &&   Β¬   Β«L   Β»R   */
numeric digits 1000                              /*ͺ*be able to handle ginormous integers.*/
say  center('decimal', 9)      center("value", 9)        center('bits', 50)
say  copies('β'      , 9)      copies("β"    , 9)        copies('β',    50)
a = 21 ;   call show           a          ,      'A'                   /*ͺ* display   A   */
b =  3 ;   call show              b       ,      'B'                   /*ͺ* display   B   */
call show      bAnd(a, b)      ,      'A & B'               /*ͺ*  and          */
call show       bOr(a, b)      ,      'A | B'               /*ͺ*   or          */
call show      bXor(a, b)      ,      'A && B'              /*ͺ*  xor          */
call show      bNot(a)         ,      'Β¬ A'                 /*ͺ*  not          */
call show   bShiftL(a, b)      ,      'A [Β«B]'              /*ͺ* shift  left   */
call show   bShiftR(a, b)      ,      'A [Β»B]'              /*ͺ* shirt right   */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show:    say  right( arg(1), 9)  center( arg(2), 9)  right( d2b( arg(1) ), 50);     return
d2b:     return x2b( d2x( arg(1) ) ) + 0         /*ͺ*some REXXes have the   D2B   BIF.    */
b2d:     return x2d( b2x( arg(1) ) )             /*ͺ*  "     "     "   "    B2D    "      */
bNot:    return b2d( translate( d2b( arg(1) ), 10, 01) )     +0   /*ͺ*+0 β‘ normalizes a #.*/
bShiftL: return b2d( d2b( arg(1) ) || copies(0, arg(2) ) )   +0   /*ͺ* " "      "     " " */
bAnd:    return c2d( bitand( d2c( arg(1) ), d2c( arg(2) ) ) )
bOr:     return c2d(  bitor( d2c( arg(1) ), d2c( arg(2) ) ) )
bXor:    return c2d( bitxor( d2c( arg(1) ), d2c( arg(2) ) ) )
bShiftR: newV1=substr(reverse(d2b(arg(1))),arg(2)+1); if newV1='' then newV1=0; return b2d(reverse(newV1))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitwise-operations\bitwise-operations.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
