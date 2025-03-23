/*�*REXX program demonstrates some  common trig  functions  (30 decimal digits are shown).*/
showdigs= 25                                           /*�*show only 25 digits of number. */
numeric digits showdigs + 10                           /*�*DIGITS default is  9,  but use */
/*�*extra digs to prevent rounding.*/
say 'Using'    showdigs    'decimal digits precision.' /*�*show # decimal digs being used.*/
say
do j=-180  to +180  by 15                         /*�*let's just do a  half─Monty.   */
stuff = right(j, 4)         'degrees, rads='   show(  d2r(j) ) ,
'   sin='   show( sinD(j) ) ,
'   cos='   show( cosD(J) )
/*�*don't let  TANGENT  go postal. */
if abs(j)\==90  then stuff=stuff   '   tan='   show( tanD(j) )
say stuff
end   /*�*j*/
say
do k=-1  to +1  by 1/2                            /*�*keep the  Arc─functions happy. */
say right(k, 4)             'radians, degs='   show(  r2d(k) )        ,
'  Acos='   show( Acos(k) ) ,
'  Asin='   show( Asin(k) ) ,
'  Atan='   show( Atan(k) )
end   /*�*k*/
exit                                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Asin:   procedure;  parse arg x 1 z 1 o 1 p;      a=abs(x);       aa=a*a
if a>1  then call AsinErr x                  /*�*X argument is out of range.    */
if a >= sqrt(2) * .5  then  return sign(x) * acos( sqrt(1 - aa),  '-ASIN')
do j=2  by 2  until p=z;  p=z;   o= o * aa * (j-1) / j;   z= z +o / (j+1);   end
return  z                                    /*�* [↑]  compute until no noise.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Acos:  procedure; parse arg x; if x<-1 | x>1  then call AcosErr;  return pi()*.5 - Asin(x)
AcosD: return r2d( Acos( arg(1)      ) )
AsinD: return r2d( Asin( arg(1)      ) )
cosD:  return cos( d2r(  arg(1)      ) )
sinD:  return sin( d2r(  d2d( arg(1) ) ) )
tan:   procedure; parse arg x;  newV1= cos(x);    if newV1=0  then call tanErr;  return sin(x) / newV1
tanD:  return tan( d2r( arg(1) ) )
d2d:   return arg(1)                  //  360      /*�*normalize degrees ──► a unit circle*/
d2r:   return r2r( d2d( arg(1) )*pi()  /  180)     /*�*convert   degrees ──► radians.     */
r2d:   return d2d( ( arg(1) * 180      /  pi() ) ) /*�*convert   radians ──► degrees.     */
r2r:   return arg(1)                  // (pi() *2) /*�*normalize radians ──► a unit circle*/
show:  return left( left('', arg(1) >= 0)format( arg(1), , showdigs) / 1, showdigs)
tellErr: say; say '*** error! ***';   say;   say arg(1);   say;           exit 13
tanErr:  call tellErr 'tan(' || x") causes division by zero, X=" || x
AsinErr: call tellErr 'Asin(x),  X  must be in the range of  -1 ──► +1,  X=' || x
AcosErr: call tellErr 'Acos(x),  X  must be in the range of  -1 ──► +1,  X=' || x
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Atan: procedure; parse arg x;    if abs(x)=1  then return pi() * .25 * sign(x)
return Asin(x / sqrt(1 + x*x) )
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cos:  procedure; parse arg x; x= r2r(x);     if x=0   then return 1;        a= abs(x)
numeric fuzz min(6, digits() - 3);     if a=pi  then return -1;       pih= pi * .5
if a=pih | a=pih*3  then return 0;     pit= pi/3;    if a=pit  then return .5
if a=pit + pit      then return -.5;                           return .sinCos(1, -1)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sin:  procedure; arg x;x=r2r(x);if x=0 then return 0;numeric fuzz min(5,max(1,digits()-3))
if x=pi*.5    then return 1;                if x==pi * 1.5  then return -1
if abs(x)=pi  then return 0;                                     return .sinCos(x,1)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.sinCos: parse arg z 1 newV1,i;        q= x*x
do k=2  by 2  until p=z;  p= z;     newV1= - newV1 * q / (k * (k+i) );   z= z + newV1;   end
return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x;   if x=0  then return 0;  d=digits();  i=;    m.=9;   h= d+6
numeric digits; numeric form;     if x<0  then  do;   x= -x;   i= 'i';   end
parse value format(x, 2, 1, , 0)  'E0'   with   g  'E'  newV1 .;       g= g *.5'e'newV1 % 2
do j=0  while h>9;        m.j=h;                   h= h % 2  +  1;    end  /*�*j*/
do k=j+5  to 0  by -1;    numeric digits m.k;      g= (g+x/g) * .5;   end  /*�*k*/
numeric digits d;            return (g/1)i               /*�*make complex if  X < 0.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
e:   e = 2.7182818284590452353602874713526624977572470936999595749669676277240766303535
return e              /*�*Note:  the actual E subroutine returns  E's  accuracy that */
/*�*matches the current NUMERIC DIGITS, up to 1 million digits.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
exp: procedure; parse arg x;  ix=x%1;    if abs(x-ix)>.5  then ix= ix + sign(x);  x=x - ix
z=1; newV1=1; w=z;  do j=1;  newV1= newV1*x/j;  z= (z+newV1) / 1;    if z==w  then leave;  w=z;  end
if z\==0  then z= e()**ix * z;                       return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pi:  pi= 3.1415926535897932384626433832795028841971693993751058209749445923078164062862
return pi             /*�*Note:  the actual PI subroutine returns PI's accuracy that */
/*�*matches the current NUMERIC DIGITS, up to 1 million digits.*/
/*�*John Machin's formula is used for calculating more digits. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Trigonometric-functions\trigonometric-functions.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
