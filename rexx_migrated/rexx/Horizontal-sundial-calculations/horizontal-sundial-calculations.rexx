/*�*REXX program displays:   hour,  sun hour angle,  dial hour line angle,  6am ───► 6pm. */
numeric digits length( pi() )    -    length(.)  /*�*in case sundial is in polar regions. */
parse arg lat lng .                              /*�*obtain optional arguments from the CL*/
/*�*     ┌───────────◄ None specified?  Then use the default*/
/*�*     │             of Jules Verne's Lincoln Island,     */
newV1= left('', 30)               /*�*     ↓             aka      Ernest Legouve Reef.        */
if lat=='' | lat==","  then lat=   -4.95         /*�*Not specified?  Then use the default.*/
if lng=='' | lng==","  then lng= -150.5          /*�* "      "         "   "   "     "    */
mer= format(lng/15, , 0)  *  15                  /*�*calculate legal meridian longitude.  */
sineLat= sin( d2r(lat) )                         /*�*calculate sine of (radian) latitude. */
w1= max( length('hour'     ), length("midnight"  ))  + 2   /*�*compute the max hour  width*/
w2= max( length('sun hour' ), length("angle"     ))  + 2   /*�*   "     "   " angle    "  */
w3= max( length('dial hour'), length("line angle"))  + 2   /*�*   "     "   " lineº    "  */
L=  max( length(lat), length(lng), length(mer) ) /*�*find the maximum length of 3 numbers.*/
say '       latitude:'    right(lat, L)     /*�*display the  latitude to the terminal*/
say '      longitude:'    right(lng, L)     /*�*   "     "  longitude  "  "     "    */
say ' legal meridian:'    right(mer, L)     /*�*   "    legal meridian "  "     "    */
say newV1  center('    ', w1)    center("sun hour", w2)      center('dial hour' , w3)
say newV1  center('hour', w1)    center(" angle"  , w2)      center('line angle', w3)
call sep                                         /*�*to help a one─eyed pirate's eyeball. */
do h=5  to 19  by .25                    /*�*Okey dokey then, now let's show stuff*/
hra= 15 * h   -   lng  +  mer - 180      /*�*calculate sun hour angle (in degrees)*/
hla= r2d( Atan(sineLat * tan(d2r(hra)))) /*�*this is the heavy lifting calculation*/
if abs(hra)>90  then hla= hla + 180 * sign(hra*lat)  /*�*adjust for negative angle*/
call civil                               /*�*convert the time─of─day to civil time*/
say newV1 center(hc, w1)   right(format(hra,,1), w2-2)newV2   right(format(hla,,1), w3-5)
end        /*�*h*/
call sep                                         /*�*to help a one─eyed pirate's eyeball. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pi:   pi= 3.1415926535897932384626433832795028841971693993751058209749445923078; return pi
d2d:  return arg(1)              // 360          /*�*normalize degrees ──► a unit circle. */
d2r:  return r2r( arg(1) * pi()   / 180)         /*�*convert degrees   ──► radians.       */
r2d:  return d2d( (arg(1) * 180   / pi() )  )    /*�*convert radians   ──► degrees.       */
r2r:  return arg(1)              //(pi() * 2)    /*�*normalize radians ──► a unit circle. */
sep:  say newV1  copies('═', w1)  copies("═", w2)   copies('═', w3);   newV2= left('',3);   return
tan:  procedure; parse arg x;  newV3= cos(x);   if newV3=0  then call tanErr;      return sin(x)/newV3
tellErr: say;    say '*** error ***';       say;        say arg(1);      say;      exit 13
AsinErr: call tellErr 'Asin(x),  X  must be in the range of  -1 ──► +1,  X='   x
AcosErr: call tellErr 'Acos(x),  X  must be in the range of  -1 ──► +1,  X='   x
tanErr:  call tellErr 'tan(' || x") causes division by zero,  X="              x
Acos: procedure; arg x;  if x<-1 | x>1  then call AcosErr;      return .5 * pi() - Asin(x)
Atan: procedure; parse arg x; if abs(x)=1 then return pi()*x/4; return Asin(x/sqrt(1+x*x))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Asin: procedure; parse arg x;   if x<-1 | x>1  then call AsinErr;    s= x*x
if abs(x)>=sqrt(2)*.5  then return sign(x) * Acos(sqrt(1-s));  z= x;  o= x;     p= z
do j=2 by 2; o= o*s*(j-1)/j; z=z+o/(j+1); if z=p  then leave; p= z;  end; return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sin:  procedure; parse arg x;        x= r2r(x);          numeric fuzz min(5, digits() - 3)
if abs(x)=pi  then return;              return .sinCos(x, x, 1)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cos:  procedure; parse arg x;        x= r2r(x);          a= abs(x);          hpi= pi * .5
numeric fuzz min(6, digits() - 3);      if a=pi      then return -1
if a=hpi | a=hpi*3  then return 0;      if a=pi/3    then return .5
if a=pi * 2 / 3     then return '-.5';  return .sinCos(1, 1, '-1')
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.sinCos: parse arg z,newV4,i;                  x= x*x;                     p= z
do newV5=2 by 2; newV4= -newV4*x/(newV5*(newV5+i)); z= z+newV4; if z=p  then leave; p= z; end; return z
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
civil:      select                               /*�* [↓]  Maybe below  Antarctic circle, */
when h== 0  then hc= 'midnight'      /*�*        or  above     Arctic    "    */
when h <12  then hc=    h  'am'      /*�*convert da hour for human beans (sic)*/
when h==12  then hc= 'noon'          /*�*   ···  easier to understand now.    */
when h >0   then hc=    h  'pm'      /*�*   ···  even more meaningful.        */
end   /*�*select*/
parse var hc  hh ampm .;    if \datatype(hh, 'N')  then return     /*�*not numeric? */
hh= hh / 1;   if hh>12  then hh= hh - 12                           /*�*civil time ? */
if pos(., hh)==0  then do; hc= right(hh, 2)'   ' ampm; return; end /*�*exact hour ? */
parse var  hh   hr '.' -0 mn;  if hr==0  then hr= 12               /*�*get MN; noon?*/
mn= mn * 60 / 1;  hc= right(hr, 2)":"right(mn, 2, 0) ampm; return  /*�*reformat time*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();  numeric digits;  h=d+6
m.=9; numeric form; parse value format(x,2,1,,0) 'E0' with g 'E' newV3 .; g=g*.5'e'newV3 % 2
do j=0  while h>9;      m.j= h;             h= h % 2 + 1;    end  /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k; g= (g+x/g) *.5;  end  /*�*k*/;  return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horizontal-sundial-calculations\horizontal-sundial-calculations.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
