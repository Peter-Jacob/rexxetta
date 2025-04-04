/*ͺ*REXX program performs a chiβsquared test to verify a given distribution is uniform.   */
numeric digits length( pi() )  - length(.)       /*ͺ*enough decimal digs for calculations.*/
newV1.=;                                        newV1.1= 199809 200665 199607 200270 199649
newV1.2= 522573 244456 139979  71531  21461
do s=1  while newV1.s\=='';  call uTest newV1.s  /*ͺ*invoke  uTest with a data set of #'s.*/
end   /*ͺ*s*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
!:      procedure; parse arg x;  p=1;    do j=2  to x;   p= p*j;   end  /*ͺ*j*/;    return p
chi2p:  procedure;  parse arg dof, distance;       return gammaI( dof/2,  distance/2 )
f:      parse arg t;   if t=0  then return 0;      return t ** (a-1)    *    exp(-t)
e:      e =2.718281828459045235360287471352662497757247093699959574966967627724; return e
pi:     pi=3.141592653589793238462643383279502884197169399375105820974944592308; return pi
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
!!:     procedure; parse arg x;                   if x<2  then return 1;    p= x
do k=2+x//2  to x-1  by 2;   p= p*k;   end  /*ͺ*k*/;          return p
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
chi2ud: procedure: parse arg ds; sum=0;                       expect= 0
do j=1  for words(ds); expect= expect + word(ds, j)
end   /*ͺ*j*/
expect = expect / words(ds)
do k=1  for words(ds)
sum= sum   +   (word(ds, k) - expect) **2
end   /*ͺ*k*/
return sum / expect
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
exp:    procedure; parse arg x; ix= x%1;  if abs(x-ix)>.5  then ix= ix + sign(x);  x= x-ix
z=1; newV2=1; w=z;    do j=1;  newV2= newV2*x/j;  z= (z + newV2)/1;  if z==w  then leave;      w=z
end  /*ͺ*j*/;         if z\==0  then z= z * e()**ix;      return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gamma:  procedure; parse arg x; if datatype(x, 'W')  then return !(x-1) /*ͺ*Int?  Use fact*/
n= trunc(x)                     /*ͺ*at this point, X is pos and a multiple of 1/2.*/
d= !!(n+n - 1)                  /*ͺ*compute the double factorial of:    2*n - 1.  */
if n//2  then p= -1             /*ͺ*if  N  is  odd,   then use a negative unity.  */
else p=  1             /*ͺ*if  N  is even,   then use a positive unity.  */
if x>0   then return p * d * sqrt(pi()) / (2**n)
return p * (2**n) * sqrt(pi()) / d
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gammaI: procedure; parse arg a,x;  y= a-1;   do  while f(y)*(x-y) > 2e-8 & y<x;  y= y + .4
end  /*ͺ*while*/
y= min(x, y)
return 1   -   simp38(0, y,   y / 0.015 / gamma(a-1) % 1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
simp38: procedure; parse arg a, b, n;                h= (b-a) / n;        h1= h / 3
sum= f(a) + f(b)
do j=3*n-1   by -1   while j>0
if j//3 == 0  then sum= sum   +   2 * f(a + h1*j)
else sum= sum   +   3 * f(a + h1*j)
end   /*ͺ*j*/
return h * sum / 8
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt:   procedure; parse arg x;  if x=0  then return 0; d=digits(); numeric digits; h= d+6
numeric form; m.=9; parse value format(x,2,1,,0) 'E0' with g "E" newV2 .;g=g *.5'e'newV2%2
do j=0  while h>9;      m.j=h;               h=h%2+1;       end  /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end  /*ͺ*k*/; return g
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
uTest:  procedure; parse arg dset;  sum= 0;   pad= left('', 11);      sigLev= 1/20  /*ͺ*5%*/
say;   say '     '   center(" Uniform distribution test ", 75, 'β')
newV3= words(dset);                                              sigPC= sigLev*100/1
do j=1  for newV3;      sum= sum  +  word(dset, j)
end   /*ͺ*j*/
say pad "                  dataset: "  dset
say pad "                  samples: "  sum
say pad "               categories: "  newV3
say pad "       degrees of freedom: "  newV3 - 1
dist= chi2ud(dset)
P= chi2p(newV3 - 1,  dist)
sig = (abs(P) < dist * sigLev)
say pad "significant at " sigPC'%  level? '  word('no yes',    sig  + 1)
say pad "   is the dataset uniform? "        word('no yes', (\(sig))+ 1)
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Verify-distribution-uniformity-Chi-squared-test\verify-distribution-uniformity-chi-squared-test.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
