/*�*REXX program displays a sphere with another sphere subtracted where it's superimposed.*/
call deathStar   2,   .5,   v3('-50  30  50')
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dot:   newV5=0;  do j=1  for words(x);  newV5=newV5 + word(x,j)*word(y,j);  end; return newV5
dot.:  procedure; parse arg x,y; d=dot(x,y); if d<0  then return -d; return 0
ceil:  procedure; parse arg x;   newV6=trunc(x);                         return newV6+(x>0)*(x\=newV6)
floor: procedure; parse arg x;   newV6=trunc(x);                         return newV6-(x<0)*(x\=newV6)
v3:    procedure; parse arg a b c;      newV5=sqrt(a**2 + b**2 + c**2);  return a/newV5  b/newV5  c/newV5
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt:  procedure; parse arg x; if x=0  then return 0;  d=digits();  h= d+6; numeric digits
m.=9; numeric form; parse value format(x,2,1,,0) 'E0' with g 'E' newV6 .; g=g*.5'e'newV6%2
do j=0  while h>9;      m.j= h;              h= h % 2 + 1;    end /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k;  g= (g +x/g)* .5; end /*�*k*/; return g
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hitSphere: procedure expose newV4.; parse arg xx yy zz r,x0,y0;  z= r*r -(x0-xx)**2-(y0-yy)**2
if z<0  then return 0;  newV6= sqrt(z);  newV4.z1= zz - newV6;    newV4.z2= zz + newV6;    return 1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
deathStar: procedure; parse arg k,ambient,sun    /*�* [↓]  display the deathstar to screen*/
parse var  sun   s1 s2 s3                        /*�*identify the light source coördinates*/
if 5=="f5"x  then shading= '.:!*oe&#%@'          /*�*dithering chars for an EBCDIC machine*/
else shading= '·:!ºoe@░▒▓'          /*�*    "       "    "   "  ASCII    "   */
shadingL= length(shading)                        /*�*the number of dithering characters.  */
shades.= ' ';            do i=1  for shadingL;    shades.i= substr(shading, i, 1)
end   /*�*i*/
ship=  20   20  0 20  ;           parse var  ship    shipX  shipY  shipZ  shipR
hole= ' 1    1 -6 20' ;           parse var  hole    holeX  holeY  holeZ  .

do   i=floor(shipY-shipR  )  to ceil(shipY+shipR  )+1;    y= i +.5;   newV7= /*�*@   is a single line of the deathstar to be displayed.*/
do j=floor(shipX-shipR*2)  to ceil(shipX+shipR*2)+1;    newV4.= 0
x=.5 * (j-shipX+1) + shipX;       newV3= 0;    newV1= 0;    newV2= 0       /*�*$BG,  $POS,  and  $NEG  are boolean values.           */
newV8= hitSphere(ship, x, y);                    b1= newV4.z1;   b2= newV4.z2      /*�*?  is boolean,  "true"  indicates ray hits the sphere.*/
/*�*$BG:  if 1, its background;  if zero, it's foreground.*/
if \newV8 then newV3= 1                                                      /*�*ray lands in blank space, so draw the background.     */
else do; newV8= hitSphere(hole, x, y);     s1= newV4.z1;   s2= newV4.z2
if \newV8 then newV1= 1                                          /*�*ray hits ship but not the hole, so draw ship surface. */
else if s1>b1 then newV1=1                             /*�*ray hits both, but ship front surface is closer.      */
else if s2>b2 then newV3= 1               /*�*ship surface is inside hole,  so show the background. */
else if s2>b1 then newV2=1 /*�*hole back surface is inside ship;  the only place ··· */
else newV1=1 /*�*························ a hole surface will be shown.*/
end
select
when newV3   then do;   newV7= newV7' ';    iterate j;     end               /*�*append a blank character to the line to be displayed. */
when newV1  then vecnewV6= v3(x-shipX  y-shipY  b1-shipZ)
when newV2  then vecnewV6= v3(holeX-x  holeY-y  holeZ-s2)
end    /*�*select*/

b=1 +min(shadingL, max(0, trunc((1 - (dot.(sun, v3(vecnewV6))**k + ambient)) * shadingL)))
newV7=newV7 || shades.b                                 /*�*B:  the ray's intensity│brightness*/
end      /*�*j*/                                  /*�* [↑]  build a line for the sphere.*/

if newV7\=''  then say strip(newV7, 'T')                  /*�*strip trailing blanks from line.  */
end        /*�*i*/                                  /*�* [↑]  show all lines for sphere.  */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Death-Star\death-star.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
