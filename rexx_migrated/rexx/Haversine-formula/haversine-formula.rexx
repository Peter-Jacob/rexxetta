/*ͺ*REXX program  calculates  the  distance between  Nashville  and  Los Angles  airports.*/
call pi;    numeric digits length(pi) % 2        /*ͺ*use half of PI dec. digits for output*/
say "       Nashville:  north 36ΒΊ  7.2', west  86ΒΊ 40.2'   =   36.12ΒΊ,  -86.67ΒΊ"
say "      Los Angles:  north 33ΒΊ 56.4', west 118ΒΊ 24.0'   =   33.94ΒΊ, -118.40ΒΊ"
newV1= 'using the mean radius of the earth as '            /*ͺ*a literal for  SAY.*/
radii.=.;    radii.1=6372.8;     radii.2=6371    /*ͺ*mean radii of the earth in kilometers*/
say;                         m=1/0.621371192237  /*ͺ*M:   one statute mile  in      "     */
do radius=1  while radii.radius\==.          /*ͺ*calc. distance using specific radii. */
d= surfaceDist( 36.12,    -86.67,    33.94,   -118.4,    radii.radius);         say
say center(newV1     radii.radius         ' kilometers', 75, 'β')
say ' Distance between:  '   format(d/1            ,,2)    " kilometers,"
say '               or   '   format(d/m            ,,2)    " statute miles,"
say '               or   '   format(d/m*5280/6076.1,,2)    " nautical (or air miles)."
end   /*ͺ*radius*/                             /*ͺ*showβββ   2 dec. digs past dec. point*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
surfaceDist: parse arg th1,ph1,th2,ph2,r         /*ͺ*use  haversine  formula for distance.*/
numeric digits digits() * 2                /*ͺ*double number of decimal digits used.*/
ph1 = d2r(ph1 - ph2)               /*ͺ*convert degrees βββΊ radians & reduce.*/
th1 = d2r(th1)                     /*ͺ*   "       "           "    "    "   */
th2 = d2r(th2)                     /*ͺ*   "       "           "    "    "   */
cosTH1= cos(th1)                           /*ͺ*compute a shortcut (it's used twice).*/
x = cos(ph1) * cosTH1 - cos(th2) /*ͺ*   "    X   coordinate.              */
y = sin(ph1) * cosTH1            /*ͺ*   "    Y       "                    */
z = sin(th1)          - sin(th2) /*ͺ*   "    Z       "                    */
return Asin(sqrt(x*x + y*y + z*z)*.5) *r*2 /*ͺ*compute the arcsin and return value. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Acos: return pi() * .5   -   aSin( arg(1) )      /*ͺ*calculate the ArcCos of an argument. */
d2d:  return arg(1)               //  360        /*ͺ*normalize degrees to a  unit circle. */
d2r:  return r2r(  arg(1) * pi()  /   180)       /*ͺ*normalize and convert deg βββΊ radians*/
r2d:  return d2d( (arg(1) * 180   /   pi()))     /*ͺ*normalize and convert rad βββΊ degrees*/
r2r:  return arg(1)               // (pi() * 2)  /*ͺ*normalize radians to a  unit circle. */
pi:   pi= 3.141592653589793238462643383279502884197169399375105820975;           return pi
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Asin: procedure; parse arg x 1 z 1 o 1 p;     a= abs(x);               aa= a * a
if a >= sqrt(2) * .5  then return sign(x) * Acos( sqrt(1 - aa) )
do j=2  by 2  until p=z;    p= z;     o= o * aa * (j-1) / j;   z= z  +  o / (j+1)
end   /*ͺ*j*/;                return z      /*ͺ* [β]  compute until no more noise.  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos:  procedure; parse arg x;       x= r2r(x);       a= abs(x);              Hpi= pi * .5
numeric fuzz min(6, digits() - 3)  ;     if a=pi    then return -1
if a=Hpi | a=Hpi*3  then return 0  ;     if a=pi/3  then return .5
if a=pi* 2/3        then return -.5;     q= x*x;    p= 1;     z= 1;     newV2= 1
do k=2  by 2;  newV2= -newV2*q / (k*(k-1)); z= z+newV2; if z=p  then leave; p=z; end; return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sin:  procedure; parse arg x;  x= r2r(x);                numeric fuzz min(5, digits() - 3)
if abs(x)=pi  then  return 0;            q= x*x;    p= x;     z= x;      newV2= x
do k=2  by 2; newV2= -newV2*q / (k*(k+1));  z= z+newV2; if z=p  then leave; p=z; end; return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits;  parse value format(x,2,1,,0) 'E0' with g "E" newV2 .;  g=g * .5'e'newV2 % 2
do j=0  while h>9;      m.j= h;              h= h%2 + 1;    end  /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g= (g+x/g)*.5; end  /*ͺ*k*/;   return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Haversine-formula\haversine-formula.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
