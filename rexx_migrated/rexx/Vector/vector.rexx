/*ͺ*REXX program shows how to support mathematical functions for vectors using functions. */
s1 =     11                               /*ͺ*define the  s1 scalar: eleven        */
s2 =      2                               /*ͺ*define the  s2 scalar: two           */
x  = '(5, 7)'                             /*ͺ*define the  X  vector: five and seven*/
y  = '(2, 3)'                             /*ͺ*define the  Y  vector: two  and three*/
z  = '(2, 45)'                            /*ͺ*define vector of length   2  at  45ΒΊ */
call show  'define a vector (length,ΒΊangle):',     z                ,      Vdef(z)
call show         'addition (vector+vector):',     x      " + "   y ,      Vadd(x, y)
call show      'subtraction (vector-vector):',     x      " - "   y ,      vsub(x, y)
call show   'multiplication (Vector*scalar):',     x      " * "   s1,      Vmul(x, s1)
call show         'division (vector/scalar):',     x      " Γ· "   s2,      Vdiv(x, s2)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
$fuzz: return min( arg(1), max(1, digits() - arg(2) ) )
cosD:  return cos( d2r( arg(1) ) )
d2d:   return arg(1) // 360                      /*ͺ*normalize degrees βββΊ a unit circle. */
d2r:   return r2r( d2d(arg(1)) * pi() / 180)     /*ͺ*convert degrees   βββΊ   radians.     */
pi:    pi=3.14159265358979323846264338327950288419716939937510582;         return pi
r2d:   return d2d( (arg(1)*180 / pi()))          /*ͺ*convert radians   βββΊ   degrees.     */
r2r:   return arg(1) // (pi() * 2)               /*ͺ*normalize radians βββΊ a unit circle. */
show:  say  right( arg(1), 33)   right( arg(2), 20)      ' βββΊ '      arg(3);       return
sinD:  return  sin( d2r( d2d( arg(1) ) ) )
V:     return  word( translate( arg(1), , '{[(JI)]}')  0,  1)   /*ͺ*get the number or zero*/
V$:    parse arg r,c;     newV1='['r;       if c\=0  then newV1=newV1"," c;               return newV1']'
V#:    a=V(a); b=V(b); c=V(c); d=V(d);  ac=a*c; ad=a*d; bc=b*c; bd=b*d; s=c*c+d*d;  return
Vadd:  procedure; arg a ',' b,c "," d;      call V#;       return V$(a+c,             b+d)
Vsub:  procedure; arg a ',' b,c "," d;      call V#;       return V$(a-c,             b-d)
Vmul:  procedure; arg a ',' b,c "," d;      call V#;       return V$(ac-bd,         bc+ad)
Vdiv:  procedure; arg a ',' b,c "," d;      call V#;       return V$((ac+bd)/s, (bc-ad)/s)
Vdef:  procedure; arg a ',' b,c "," d;      call V#;       return V$(a*sinD(b), a*cosD(b))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos: procedure; parse arg x;        x=r2r(x);       a=abs(x);    numeric fuzz $fuzz(9, 9)
if a=pi             then return -1;
if a=pi*.5 | a=pi*2 then return  0;                   return .sinCos(1,-1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sin: procedure; parse arg x;        x=r2r(x);                    numeric fuzz $fuzz(5, 3)
if x=pi*.5          then return 1;  if x=pi*1.5  then return -1
if abs(x)=pi | x=0  then return 0;                    return .sinCos(x,+1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.sinCos: parse arg z 1 newV1,i;          q=x*x
do k=2  by 2  until p=z;  p=z;  newV1= -newV1*q / (k*(k+i));  z=z+newV1;  end;     return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Vector\vector.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
