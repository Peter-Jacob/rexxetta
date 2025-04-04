/*ª*REXX program generates  10,000  normally distributed numbers  (Gaussian distribution).*/
numeric digits 20                                /*ª*use twenty decimal digs for accuracy.*/
parse arg n seed .                               /*ª*obtain optional arguments from the CL*/
if n==''  |  n==","     then n= 10000            /*ª*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*ª*seed is for repeatable RANDOM numbers*/
call pi                                          /*ª*call subroutine to define pi constant*/
do g=1  for n;   newV3.g= sqrt( -2 * ln( rand() ) )      *      cos( 2 * pi * rand() )
end   /*ª*g*/                              /*ª* [â]  uniform random number ââââº #.g */
s= 0
mn= newV3.1;        mx= mn;        noise= n * .0005  /*ª*calculate the noise:  1/20th %  of N.*/
ss= 0
do j=1  for n;         newV5= newV3.j            /*ª*the sum,  and  the sum of squares.   */
s= s + newV5;              ss= ss  +  newV5 * newV5  /*ª*the sum,  and  the sum of squares.   */
mn= min(mn, newV5);        mx= max(mx, newV5)    /*ª*find the minimum  and the maximum.   */
end   /*ª*j*/
newV4.= 0
say 'number of data points = '   fmt(n  )
say '              minimum = '   fmt(mn )
say '              maximum = '   fmt(mx )
say '      arithmetic mean = '   fmt(s/n)
say '   standard deviation = '   fmt(sqrt( ss/n - (s/n) **2) )
newV1= newV4.1;    newV2= newV1                            /*ª*define minimum & maximum value so far*/
parse value  scrSize()  with  sd sw .            /*ª*obtain the (true) screen size of term*/  /*ª*ââânot all REXXes have this BIF*/
sdE= sd - 4                                      /*ª*the effective (usable) screen depth. */
swE= sw - 1                                      /*ª* "      "         "        "   width.*/
newV6= 1 / max(1, mx-mn) * sdE                       /*ª*$  is used for scaling depth of histo*/
do i=1  for n; newV7= trunc((newV3.i-mn) *newV6) /*ª*calculate the relative line.         */
newV4.newV7= newV4.newV7 + 1                         /*ª*bump the counter.                    */
newV1= min(newV1, newV4.newV7)                   /*ª*find the minimum.                    */
newV2= max(newV2, newV4.newV7)                   /*ª*  "   "  maximum.                    */
end   /*ª*i*/
f= swE/newV2                                                /*ª*limit graph to 1 full screen*/
do h=0  for sdE;     newV5= newV4.h                   /*ª*obtain a data point.        */
if newV5>noise  then say copies('â', trunc(newV5*f) ) /*ª*display a bar of histogram. */
end   /*ª*h*/                                   /*ª*[â]  use a hyphen for histo.*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
fmt:  parse arg newV8; return left('', (newV8>=0) + 2 * datatype(newV8, 'W'))newV8  /*ª*prepend a blank if #>=0, add 2 blanks if whole.*/
e:    e = 2.7182818284590452353602874713526624977572470936999595749669676277240766303535;                     return e
pi:   pi= 3.1415926535897932384626433832795028841971693993751058209749445923078164062862;                     return pi
r2r:  return arg(1)  //  (pi() * 2)                                 /*ª*normalize the given angle (in radians) to Â±2pi.*/
rand: return random(1, 1e5)  /  1e5                                 /*ª*REXX generates uniform random postive integers.*/
/*ª*âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
ln:   procedure; parse arg x,f; call e; ig= x>1.5; is= 1 -2*(ig\==1); ii= 0; xx= x;  do while ig & xx>1.5 | \ig & xx<.5
newV5= e;  do k=-1; iz= xx*newV5 **-is;  if k>=0 & (ig & iz<1 | \ig & iz>.5)  then leave;  newV5= newV5*newV5; izz= iz; end;  xx= izz
ii= ii +is*2**k; end; x= x*e**-ii-1; z=0; newV5=-1; p=z; do k=1;newV5=-newV5*x;z=z+newV5/k;if z=p then leave;p=z;end; return z+ii
/*ª*âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
cos:  procedure; parse arg x; x=r2r(x); a=abs(x); hpi= pi*.5;  numeric fuzz min(6, digits()-3); if a=pi  then return -1
if a=hpi | a=hpi*3  then return 0;   if a=pi/3  then return .5;   if a=pi*2/3 then return -.5;   z= 1;   newV5= 1
x= x*x;  p= z;      do k=2  by 2; newV5= -newV5 * x / (k*(k-1));   z= z + newV5;  if z=p  then leave;  p= z; end;    return z
/*ª*âââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d= digits();   m.= 9;   numeric digits;   numeric form;   h= d+6
parse value format(x,2,1,,0) 'E0'  with  g 'E' newV5 .; g=g*.5'e'newV5%2;    do j=0  while h>9; m.j=h; h=h%2+1; end /*ª*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g=(g+x/g)*.5;  end  /*ª*k*/;          numeric digits d;   return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Statistics-Normal-distribution\statistics-normal-distribution.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
