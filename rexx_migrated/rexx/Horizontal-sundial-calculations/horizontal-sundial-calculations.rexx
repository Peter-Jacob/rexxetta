/*ͺ*REXX program displays:   hour,  sun hour angle,  dial hour line angle,  6am ββββΊ 6pm. */
numeric digits length( pi() )    -    length(.)  /*ͺ*in case sundial is in polar regions. */
parse arg lat lng .                              /*ͺ*obtain optional arguments from the CL*/
/*ͺ*     βββββββββββββ None specified?  Then use the default*/
/*ͺ*     β             of Jules Verne's Lincoln Island,     */
newV1= left('', 30)               /*ͺ*     β             aka      Ernest Legouve Reef.        */
if lat=='' | lat==","  then lat=   -4.95         /*ͺ*Not specified?  Then use the default.*/
if lng=='' | lng==","  then lng= -150.5          /*ͺ* "      "         "   "   "     "    */
mer= format(lng/15, , 0)  *  15                  /*ͺ*calculate legal meridian longitude.  */
sineLat= sin( d2r(lat) )                         /*ͺ*calculate sine of (radian) latitude. */
w1= max( length('hour'     ), length("midnight"  ))  + 2   /*ͺ*compute the max hour  width*/
w2= max( length('sun hour' ), length("angle"     ))  + 2   /*ͺ*   "     "   " angle    "  */
w3= max( length('dial hour'), length("line angle"))  + 2   /*ͺ*   "     "   " lineΒΊ    "  */
L=  max( length(lat), length(lng), length(mer) ) /*ͺ*find the maximum length of 3 numbers.*/
say '       latitude:'    right(lat, L)     /*ͺ*display the  latitude to the terminal*/
say '      longitude:'    right(lng, L)     /*ͺ*   "     "  longitude  "  "     "    */
say ' legal meridian:'    right(mer, L)     /*ͺ*   "    legal meridian "  "     "    */
say newV1  center('    ', w1)    center("sun hour", w2)      center('dial hour' , w3)
say newV1  center('hour', w1)    center(" angle"  , w2)      center('line angle', w3)
call sep                                         /*ͺ*to help a oneβeyed pirate's eyeball. */
do h=5  to 19  by .25                    /*ͺ*Okey dokey then, now let's show stuff*/
hra= 15 * h   -   lng  +  mer - 180      /*ͺ*calculate sun hour angle (in degrees)*/
hla= r2d( Atan(sineLat * tan(d2r(hra)))) /*ͺ*this is the heavy lifting calculation*/
if abs(hra)>90  then hla= hla + 180 * sign(hra*lat)  /*ͺ*adjust for negative angle*/
call civil                               /*ͺ*convert the timeβofβday to civil time*/
say newV1 center(hc, w1)   right(format(hra,,1), w2-2)newV2   right(format(hla,,1), w3-5)
end        /*ͺ*h*/
call sep                                         /*ͺ*to help a oneβeyed pirate's eyeball. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pi:   pi= 3.1415926535897932384626433832795028841971693993751058209749445923078; return pi
d2d:  return arg(1)              // 360          /*ͺ*normalize degrees βββΊ a unit circle. */
d2r:  return r2r( arg(1) * pi()   / 180)         /*ͺ*convert degrees   βββΊ radians.       */
r2d:  return d2d( (arg(1) * 180   / pi() )  )    /*ͺ*convert radians   βββΊ degrees.       */
r2r:  return arg(1)              //(pi() * 2)    /*ͺ*normalize radians βββΊ a unit circle. */
sep:  say newV1  copies('β', w1)  copies("β", w2)   copies('β', w3);   newV2= left('',3);   return
tan:  procedure; parse arg x;  newV3= cos(x);   if newV3=0  then call tanErr;      return sin(x)/newV3
tellErr: say;    say '*** error ***';       say;        say arg(1);      say;      exit 13
AsinErr: call tellErr 'Asin(x),  X  must be in the range of  -1 βββΊ +1,  X='   x
AcosErr: call tellErr 'Acos(x),  X  must be in the range of  -1 βββΊ +1,  X='   x
tanErr:  call tellErr 'tan(' || x") causes division by zero,  X="              x
Acos: procedure; arg x;  if x<-1 | x>1  then call AcosErr;      return .5 * pi() - Asin(x)
Atan: procedure; parse arg x; if abs(x)=1 then return pi()*x/4; return Asin(x/sqrt(1+x*x))
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Asin: procedure; parse arg x;   if x<-1 | x>1  then call AsinErr;    s= x*x
if abs(x)>=sqrt(2)*.5  then return sign(x) * Acos(sqrt(1-s));  z= x;  o= x;     p= z
do j=2 by 2; o= o*s*(j-1)/j; z=z+o/(j+1); if z=p  then leave; p= z;  end; return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sin:  procedure; parse arg x;        x= r2r(x);          numeric fuzz min(5, digits() - 3)
if abs(x)=pi  then return;              return .sinCos(x, x, 1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos:  procedure; parse arg x;        x= r2r(x);          a= abs(x);          hpi= pi * .5
numeric fuzz min(6, digits() - 3);      if a=pi      then return -1
if a=hpi | a=hpi*3  then return 0;      if a=pi/3    then return .5
if a=pi * 2 / 3     then return '-.5';  return .sinCos(1, 1, '-1')
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.sinCos: parse arg z,newV4,i;                  x= x*x;                     p= z
do newV5=2 by 2; newV4= -newV4*x/(newV5*(newV5+i)); z= z+newV4; if z=p  then leave; p= z; end; return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
civil:      select                               /*ͺ* [β]  Maybe below  Antarctic circle, */
when h== 0  then hc= 'midnight'      /*ͺ*        or  above     Arctic    "    */
when h <12  then hc=    h  'am'      /*ͺ*convert da hour for human beans (sic)*/
when h==12  then hc= 'noon'          /*ͺ*   Β·Β·Β·  easier to understand now.    */
when h >0   then hc=    h  'pm'      /*ͺ*   Β·Β·Β·  even more meaningful.        */
end   /*ͺ*select*/
parse var hc  hh ampm .;    if \datatype(hh, 'N')  then return     /*ͺ*not numeric? */
hh= hh / 1;   if hh>12  then hh= hh - 12                           /*ͺ*civil time ? */
if pos(., hh)==0  then do; hc= right(hh, 2)'   ' ampm; return; end /*ͺ*exact hour ? */
parse var  hh   hr '.' -0 mn;  if hr==0  then hr= 12               /*ͺ*get MN; noon?*/
mn= mn * 60 / 1;  hc= right(hr, 2)":"right(mn, 2, 0) ampm; return  /*ͺ*reformat time*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();  numeric digits;  h=d+6
m.=9; numeric form; parse value format(x,2,1,,0) 'E0' with g 'E' newV3 .; g=g*.5'e'newV3 % 2
do j=0  while h>9;      m.j= h;             h= h % 2 + 1;    end  /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k; g= (g+x/g) *.5;  end  /*ͺ*k*/;  return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horizontal-sundial-calculations\horizontal-sundial-calculations.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
