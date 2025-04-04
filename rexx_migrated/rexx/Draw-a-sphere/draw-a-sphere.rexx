/*ͺ*REXX program expresses a  lighted sphere  with  simple characters  used for shading.  */
call drawSphere  19,  4,   2/10,  '30 30 -50'    /*ͺ*draw a sphere with a radius of  19.  */
call drawSphere  10,  2,   4/10,  '30 30 -50'    /*ͺ*  "  "    "     "  "    "    "  ten. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ceil:  procedure;   parse arg x;  newV4= trunc(x);                    return newV4 +(x>0) * (x\=newV4)
floor: procedure;   parse arg x;  newV4= trunc(x);                    return newV4 -(x<0) * (x\=newV4)
norm:  parse arg newV1 newV2 newV3;        newV4= sqrt(newV1**2 + newV2**2 + newV3**2); return  newV1/newV4  newV2/newV4  newV3/newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drawSphere: procedure;  parse arg r, k, ambient, lightSource /*ͺ*obtain the four arguments*/
if 8=='f8'x  then shading= ".:!*oe&#%@"               /*ͺ* EBCDIC dithering chars. */
else shading= "Β·:!Β°oe@βββ"               /*ͺ* ASCII      "       "    */
parse value  norm(lightSource)    with    s1  s2  s3  /*ͺ*normalize light source.  */
shadeLen= length(shading) - 1;    rr= r**2;   r2= r+r /*ͺ*handyβdandy variables.   */

do   i=floor(-r )  to ceil(r );   x= i       + .5;       xx= x**2;       newV5=
do j=floor(-r2)  to ceil(r2);   y= j * .5  + .5;       yy= y**2;       z= xx+yy
if z<=rr  then do                                 /*ͺ*is point within sphere ? */
parse value  norm(x  y  sqrt(rr - xx - yy) )   with   v1  v2  v3
dot= min(0, s1*v1 + s2*v2 + s3*v3) /*ͺ*the dot product of above.*/
b= -dot**k  +  ambient             /*ͺ*calculate the brightness.*/
if b<=0  then brite= shadeLen
else brite= max(0,  (1-b) * shadeLen)  % 1
newV5= newV5 || substr(shading, brite + 1,  1)
end                                /*ͺ* [β]  build display line.*/
else newV5= newV5' '                            /*ͺ*append a blank to line.  */
end   /*ͺ*j*/                                       /*ͺ*[β] strip trailing blanks*/
say strip(newV5, 'T')                                   /*ͺ*show a line of the sphere*/
end     /*ͺ*i*/                                       /*ͺ* [β]  display the sphere.*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sqrt:  procedure; parse arg x;  if x=0  then return 0; d= digits(); numeric digits; h= d+6
numeric form; m.=9; parse value format(x,2,1,,0) 'E0' with g "E" newV4 .; g= g*.5'e'newV4%2
do j=0  while h>9;      m.j=h;              h=h%2+1;        end  /*ͺ*j*/
do k=j+5  to 0  by -1;  numeric digits m.k; g=(g+x/g)*.5;   end  /*ͺ*k*/;  return g
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Draw-a-sphere\draw-a-sphere.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
