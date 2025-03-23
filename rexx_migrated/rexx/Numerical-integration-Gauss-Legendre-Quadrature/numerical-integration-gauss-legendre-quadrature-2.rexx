/*�*REXX program does numerical integration using an N─point Gauss─Legendre quadrature rule.   */
pi= pi();     digs= length(pi) - length(.);          numeric digits digs;       reps= digs % 2

newV1.= .;        b= 3;        a= -b;       bma= b - a;          bmaH= bma / 2;     tiny= '1e-'digs
trueV= exp(b)-exp(a);                   bpa= b + a;          bpaH= bpa / 2
hdr= 'iterate value       (with '   digs   " decimal digits being used)"
say ' step '  center(hdr, digs+3)    '  difference'                  /*�*show hdr*/
sep='──────'  copies("─", digs+3)    '─────────────';      say sep   /*�*  "  sep*/

do newV3=1  until dif>0;  p0z= 1;  p0.1= 1;  p1z= 2;  p1.1= 1;  p1.2= 0;  newV2= newV3 + .5;  r.= 0
/*�*█*/   do k=2  to newV3;  km= k - 1
/*�*█*/                     do y=1  for p1z;   T.y= p1.y;                           end  /*�*y*/
/*�*█*/   T.y= 0;  TT.= 0;          do L=1  for p0z;   newV4= L + 2;   TT.newV4= p0.L;      end  /*�*L*/
/*�*█*/   kkm= k + km;      do j=1  for p1z  +1;       T.j= (kkm*T.j - km*TT.j)/k;  end  /*�*j*/
/*�*█*/   p0z= p1z;         do n=1  for p0z;           p0.n= p1.n                ;  end  /*�*n*/
/*�*█*/   p1z= p1z + 1;     do p=1  for p1z;           p1.p= T.p                 ;  end  /*�*p*/
/*�*█*/   end   /*�*k*/
/*�*▓*/       do newV5=1  for newV3;             x= cos( pi * (newV5 - .25)  /  newV2 )
/*�*▓*/           /*�*░*/   do reps  until abs(dx) <= tiny
/*�*▓*/           /*�*░*/   f= p1.1;  df= 0;   do u=2  to p1z; df= f +  x*df
/*�*▓*/           /*�*░*/                                       f= p1.u +x*f
/*�*▓*/           /*�*░*/                      end   /*�*u*/
/*�*▓*/           /*�*░*/   dx= f / df;   x= x - dx
/*�*▓*/           /*�*░*/   end             /*�*reps ···*/
/*�*▓*/       r.1.newV5= x
/*�*▓*/       r.2.newV5= 2 / ( (1 - x*x) * df*df)
/*�*▓*/       end   /*�*!*/
newV6= 0
/*�*▒*/ do m=1  for newV3;   newV6=newV6 + r.2.m * exp(bpaH + r.1.m*bmaH);    end  /*�*m*/
z= bmaH * newV6                                                    /*�*calculate target value (Z)*/
dif= z - trueV;            z= format(z, 3, digs - 2)           /*�*    "     difference.     */
Ndif= translate( format(dif, 3, 4, 2, 0),  'e',  "E")
if newV3\==1  then  say center(newV3, 6)      z' '      Ndif           /*�*no display if not computed*/
end   /*�*#*/

say sep;  xdif= compare( strip(z), trueV);                       say right("↑", 6 + 1 + xdif)
say  left('', 6 + 1)      trueV         " {exact value}";        say
say 'Using '      digs      " digit precision, the" ,
'N-point Gauss─Legendre quadrature (GLQ) had an accuracy of '      xdif-2       " digits."
exit 0                                                /*�*stick a fork in it,  we're all done. */
/*�*───────────────────────────────────────────────────────────────────────────────────────────*/
e:   return 2.718281828459045235360287471352662497757247093699959574966967627724076630353547595
pi:  return 3.141592653589793238462643383279502884197169399375105820974944592307816406286286209
/*�*───────────────────────────────────────────────────────────────────────────────────────────*/
cos: procedure  expose newV1.; parse arg x;   if newV1.x\==.  then return newV1.x;   newV4= 1;   z=1;  y= x*x
do k=2  by 2  until p==z; p=z; newV4= -newV4*y/(k*(k-1)); z=z+newV4; end;  newV1.x=z;  return z
/*�*───────────────────────────────────────────────────────────────────────────────────────────*/
exp: procedure; parse arg x; ix= x % 1;  if abs(x-ix)>.5  then ix= ix + sign(x); x= x-ix;  z= 1
newV4=1;  do j=1  until p==z; p=z;  newV4= newV4*x/j;  z= z+newV4;   end;    return z * e()**ix
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Numerical-integration-Gauss-Legendre-Quadrature\numerical-integration-gauss-legendre-quadrature-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
