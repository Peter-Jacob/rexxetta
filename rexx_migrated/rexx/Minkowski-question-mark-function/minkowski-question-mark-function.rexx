/*�*REXX program uses the Minkowski question─mark function to convert a continued fraction*/
numeric digits 40                                /*�*use enough dec. digits for precision.*/
say fmt( mink(  0.5 * (1+sqrt(5) ) ) )     fmt( 5/3 )
say fmt( minkI(-5/9) )                     fmt( (sqrt(13) - 7)  /  6)
say fmt( mink( minkI(0.718281828) ) )      fmt( mink( minkI(.1213141516171819) ) )
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
floor: procedure; parse arg x;    t= trunc(x);     return t   -   (x<0)  *  (x\=t)
fmt:   procedure: parse arg a;    d= digits();     return right( format(a, , d-2, 0), d+5)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mink:  procedure:  parse arg x;   p= x % 1;        if x>1 | x<0  then return p + mink(x-p)
q= 1;    s= 1;    m= 0;    n= 0;    d= 1;   y= p
r= p + 1
do forever;   d= d * 0.5;      if y+d=y | d=0  then leave   /*�*d= d÷2*/
m= p + r;                      if m<0   | p<0  then leave
n= q + s;                      if n<0          then leave
if x<m/n      then do;   r= m;       s= n;           end
else do;   y= y + d;   p= m;   q= n;   end
end   /*�*forever*/
return y + d
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
minkI: procedure;  parse arg x;  p= floor(x);   if x>1 | x<0  then return p + minkI(x-p)
if x=1 | x=0  then return x
cur= 0;                limit= 200;       newV1=               /*�*limit: max iterations*/
newV2= 1                                                      /*�*#:  is the count.    */
do  until newV2==limit | words(newV1)==limit;                        x= x * 2
if cur==0  then if x<1  then      newV2= newV2 + 1
else do;  newV1= newV1 newV2;  newV2= 1;   cur= 1;  x= x-1;  end
else if x>1  then do;           newV2= newV2 + 1;        x= x-1;  end
else do;  newV1= newV1 newV2;  newV2= 1;   cur= 0;           end
if x==floor(x)          then do;           newV1= newV1 newV2;  leave;           end
end   /*�*until*/
z= words(newV1)
ret= 1 / word(newV1, z)
do j=z  for z  by -1;    ret= word(newV1, j)    +    1 / ret
end   /*�*j*/
return 1 / ret
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();  numeric digits;  h=d+6
numeric form; m.=9; parse value format(x,2,1,,0) 'E0' with g "E" newV3 .; g=g *.5'e'newV3 %2
do j=0  while h>9;     m.j= h;             h= h % 2 + 1;      end  /*�*j*/
do k=j+5  to 0  by -1; numeric digits m.k; g= (g + x/g) * .5; end  /*�*k*/; return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Minkowski-question-mark-function\minkowski-question-mark-function.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
