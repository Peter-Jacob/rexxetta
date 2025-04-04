/*ช*REXX program  demonstrates how to support some  math functions  for  complex numbers. */
x = '(5,3i)'                                     /*ช*define  X    โโโ can use  I i J or j */
y = "( .5,  6j)"                                 /*ช*define  Y         "   "   " " "  " " */

say '      addition:   '        x        " + "         y         ' = '          Cadd(x, y)
say '   subtraction:   '        x        " - "         y         ' = '          Csub(x, y)
say 'multiplication:   '        x        " * "         y         ' = '          Cmul(x, y)
say '      division:   '        x        " รท "         y         ' = '          Cdiv(x, y)
say '       inverse:   '        x        "                         = "          Cinv(x, y)
say '  conjugate of:   '        x        "                         = "          Conj(x, y)
say '   negation of:   '        x        "                         = "          Cneg(x, y)
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
Conj: procedure; parse arg a ',' b,c ',' d;   call C#;    return C$(  a      ,  -b    )
Cadd: procedure; parse arg a ',' b,c ',' d;   call C#;    return C$(  a+c    ,   b+d  )
Csub: procedure; parse arg a ',' b,c ',' d;   call C#;    return C$(  a-c    ,   b-d  )
Cmul: procedure; parse arg a ',' b,c ',' d;   call C#;    return C$( ac-bd   ,   bc+ad)
Cdiv: procedure; parse arg a ',' b,c ',' d;   call C#;    return C$((ac+bd)/s,  (bc-ad)/s)
Cinv: return  Cdiv(1,  arg(1))
Cneg: return  Cmul(arg(1), -1)
CnewV1:   return  word(translate(arg(1), , '{[(JjIi)]}')  0,  1)                /*ช*get # or 0*/
C#:   a=CnewV1(a); b=CnewV1(b); c=CnewV1(c); d=CnewV1(d); ac=a*c; ad=a*d; bc=b*c; bd=b*d;s=c*c+d*d; return
C$:   parse arg r,c;    newV1='['r;   if c\=0  then newV1=newV1","c'j';   return newV1"]"   /*ช*uses  j   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-Complex\arithmetic-complex.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
