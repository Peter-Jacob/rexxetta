/*�*REXX program  calculates  the  distance between  Nashville  and  Los Angles  airports.*/
call pi;    numeric digits length(pi) % 2        /*�*use half of PI dec. digits for output*/
say "       Nashville:  north 36º  7.2', west  86º 40.2'   =   36.12º,  -86.67º"
say "      Los Angles:  north 33º 56.4', west 118º 24.0'   =   33.94º, -118.40º"
newV1= 'using the mean radius of the earth as '            /*�*a literal for  SAY.*/
radii.=.;    radii.1=6372.8;     radii.2=6371    /*�*mean radii of the earth in kilometers*/
say;                         m=1/0.621371192237  /*�*M:   one statute mile  in      "     */
do radius=1  while radii.radius\==.          /*�*calc. distance using specific radii. */
d= surfaceDist( 36.12,    -86.67,    33.94,   -118.4,    radii.radius);         say
say center(newV1     radii.radius         ' kilometers', 75, '─')
say ' Distance between:  '   format(d/1            ,,2)    " kilometers,"
say '               or   '   format(d/m            ,,2)    " statute miles,"
say '               or   '   format(d/m*5280/6076.1,,2)    " nautical (or air miles)."
end   /*�*radius*/                             /*�*show──┘   2 dec. digs past dec. point*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
surfaceDist: parse arg th1,ph1,th2,ph2,r         /*�*use  haversine  formula for distance.*/
numeric digits digits() * 2                /*�*double number of decimal digits used.*/
ph1 = d2r(ph1 - ph2)               /*�*convert degrees ──► radians & reduce.*/
th1 = d2r(th1)                     /*�*   "       "           "    "    "   */
th2 = d2r(th2)                     /*�*   "       "           "    "    "   */
cosTH1= cos(th1)                           /*�*compute a shortcut (it's used twice).*/
x = cos(ph1) * cosTH1 - cos(th2) /*�*   "    X   coordinate.              */
y = sin(ph1) * cosTH1            /*�*   "    Y       "                    */
z = sin(th1)          - sin(th2) /*�*   "    Z       "                    */
return Asin(sqrt(x*x + y*y + z*z)*.5) *r*2 /*�*compute the arcsin and return value. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Acos: return pi() * .5   -   aSin( arg(1) )      /*�*calculate the ArcCos of an argument. */
d2d:  return arg(1)               //  360        /*�*normalize degrees to a  unit circle. */
d2r:  return r2r(  arg(1) * pi()  /   180)       /*�*normalize and convert deg ──► radians*/
r2d:  return d2d( (arg(1) * 180   /   pi()))     /*�*normalize and convert rad ──► degrees*/
r2r:  return arg(1)               // (pi() * 2)  /*�*normalize radians to a  unit circle. */
pi:   pi= 3.141592653589793238462643383279502884197169399375105820975;           return pi
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Asin: procedure; parse arg x 1 z 1 o 1 p;     a= abs(x);               aa= a * a
if a >= sqrt(2) * .5  then return sign(x) * Acos( sqrt(1 - aa) )
do j=2  by 2  until p=z;    p= z;     o= o * aa * (j-1) / j;   z= z  +  o / (j+1)
end   /*�*j*/;                return z      /*�* [↑]  compute until no more noise.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cos:  procedure; parse arg x;       x= r2r(x);       a= abs(x);              Hpi= pi * .5
numeric fuzz min(6, digits() - 3)  ;     if a=pi    then return -1
if a=Hpi | a=Hpi*3  then return 0  ;     if a=pi/3  then return .5
if a=pi* 2/3        then return -.5;     q= x*x;    p= 1;     z= 1;     newV2= 1
do k=2  by 2;  newV2= -newV2*q / (k*(k-1)); z= z+newV2; if z=p  then leave; p=z; end; return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sin:  procedure; parse arg x;  x= r2r(x);                numeric fuzz min(5, digits() - 3)
if abs(x)=pi  then  return 0;            q= x*x;    p= x;     z= x;      newV2= x
do k=2  by 2; newV2= -newV2*q / (k*(k+1));  z= z+newV2; if z=p  then leave; p=z; end; return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x; if x=0  then return 0; d=digits(); m.=9; numeric form; h=d+6
numeric digits;  parse value format(x,2,1,,0) 'E0' with g "E" newV2 .;  g=g * .5'e'newV2 % 2
do j=0  while h>9;      m.j= h;              h= h%2 + 1;    end  /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g= (g+x/g)*.5; end  /*�*k*/;   return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Haversine-formula\haversine-formula.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
