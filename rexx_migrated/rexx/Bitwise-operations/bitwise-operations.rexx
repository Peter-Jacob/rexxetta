/*�*REXX program performs  bit─wise operations  on integers:   &   |   &&   ¬   «L   »R   */
numeric digits 1000                              /*�*be able to handle ginormous integers.*/
say  center('decimal', 9)      center("value", 9)        center('bits', 50)
say  copies('─'      , 9)      copies("─"    , 9)        copies('─',    50)
a = 21 ;   call show           a          ,      'A'                   /*�* display   A   */
b =  3 ;   call show              b       ,      'B'                   /*�* display   B   */
call show      bAnd(a, b)      ,      'A & B'               /*�*  and          */
call show       bOr(a, b)      ,      'A | B'               /*�*   or          */
call show      bXor(a, b)      ,      'A && B'              /*�*  xor          */
call show      bNot(a)         ,      '¬ A'                 /*�*  not          */
call show   bShiftL(a, b)      ,      'A [«B]'              /*�* shift  left   */
call show   bShiftR(a, b)      ,      'A [»B]'              /*�* shirt right   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:    say  right( arg(1), 9)  center( arg(2), 9)  right( d2b( arg(1) ), 50);     return
d2b:     return x2b( d2x( arg(1) ) ) + 0         /*�*some REXXes have the   D2B   BIF.    */
b2d:     return x2d( b2x( arg(1) ) )             /*�*  "     "     "   "    B2D    "      */
bNot:    return b2d( translate( d2b( arg(1) ), 10, 01) )     +0   /*�*+0 ≡ normalizes a #.*/
bShiftL: return b2d( d2b( arg(1) ) || copies(0, arg(2) ) )   +0   /*�* " "      "     " " */
bAnd:    return c2d( bitand( d2c( arg(1) ), d2c( arg(2) ) ) )
bOr:     return c2d(  bitor( d2c( arg(1) ), d2c( arg(2) ) ) )
bXor:    return c2d( bitxor( d2c( arg(1) ), d2c( arg(2) ) ) )
bShiftR: newV1=substr(reverse(d2b(arg(1))),arg(2)+1); if newV1='' then newV1=0; return b2d(reverse(newV1))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitwise-operations\bitwise-operations.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
