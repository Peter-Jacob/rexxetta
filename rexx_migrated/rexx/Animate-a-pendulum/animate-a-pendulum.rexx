/*ͺ*REXX program displays the   (x, y)  coΓΆrdinates  (at the end of a swinging pendulum). */
parse arg cycles Plength theta .                 /*ͺ*obtain optional argument from the CL.*/
if  cycles=='' |  cycles==","  then  cycles=  60 /*ͺ*Not specified?  Then use the default.*/
if pLength=='' | pLength==","  then pLength=  10 /*ͺ* "      "         "   "   "     "    */
if   theta=='' |   theta==","  then   theta=  30 /*ͺ* "      "         "   "   "     "    */
theta= theta / 180 * pi()                        /*ͺ* 'cause that's the way  Ada  did it. */
was= time('R')                                   /*ͺ*obtain the current elapsed time (was)*/
g= -9.81                                         /*ͺ*gravitation constant  (for earth).   */
speed= 0                                         /*ͺ*velocity of the pendulum, now resting*/
do cycles;            call delay 1/20   /*ͺ*swing the pendulum a number of times.*/
now= time('E')                          /*ͺ*obtain the current time (in seconds).*/
duration= now - was                     /*ͺ*calculate duration since last cycle. */
acceleration= g / pLength * sin(theta)  /*ͺ*compute the pendulum acceleration.   */
x= sin(theta) * pLength                 /*ͺ*calculate  X  coΓΆrdinate of pendulum.*/
y= cos(theta) * pLength                 /*ͺ*    "      Y       "           "     */
speed= speed + acceleration * duration  /*ͺ*calculate "   speed      "     "     */
theta= theta + speed        * duration  /*ͺ*    "     "   angle      "     "     */
was= now                                /*ͺ*save the elapsed time as it was then.*/
say right('X: ',20)   fmt(x)      right("Y: ", 10)        fmt(y)
end   /*ͺ*cycles*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fmt:  procedure; parse arg z;  return left('', z>=0)format(z, , digits() - 1)   /*ͺ*align#*/
pi:   pi= 3.1415926535897932384626433832795028841971693993751058209749445923078; return pi
r2r:  return arg(1)  //  (pi() * 2)              /*ͺ*normalize radians βββΊ a unit circle. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos:  procedure; parse arg x; x=r2r(x); numeric fuzz min(6,digits()-3);  z=1;  newV1=1;  x=x*x
p=z; do k=2  by 2; newV1=-newV1*x/(k*(k-1)); z=z+newV1;  if z=p  then leave; p=z; end;  return z
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sin:  procedure; parse arg x; x=r2r(x); newV1=x; numeric fuzz min(5, max(1,digits()-3)); q=x*x
z=x;   do k=2  by 2  until p=z;  p= z;  newV1= -newV1*q/(k*k+k);   z= z+newV1;   end;   return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Animate-a-pendulum\animate-a-pendulum.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
