/*ͺ*REXX pgm solves example of Newton's cooling law via Euler's method (diff. step sizes).*/
e=2.71828182845904523536028747135266249775724709369995957496696762772407663035354759457138
numeric digits length(e)   -  length(.)          /*ͺ*use the number of decimal digits in E*/
parse arg Ti Tr cc tt ss                         /*ͺ*obtain optional arguments from the CL*/
if Ti='' | Ti=","  then Ti= 100                  /*ͺ*given?  Default:  initial temp in ΒΊC.*/
if Tr='' | Tr=","  then Tr=  20                  /*ͺ*  "         "       room    "   "  " */
if cc='' | cc=","  then cc=   0.07               /*ͺ*  "         "     cooling constant.  */
if tt='' | tt=","  then tt= 100                  /*ͺ*  "         "    total time seconds. */
if ss='' | ss=","  then ss=   2  5  10           /*ͺ*  "         "      the step sizes.   */
newV1= 'β'                                           /*ͺ*the character used in title separator*/
do sSize=1  for words(ss);    say;    say;    say center('time in'     , 11)
say center('seconds' , 11, newV1)                     center('Euler method', 16, newV1) ,
center('analytic', 18, newV1)                     center('difference'  , 14, newV1)
newV2=Ti;                  inc= word(ss, sSize) /*ͺ*the 1st value;  obtain the increment.*/
do t=0  to Ti  by inc                  /*ͺ*step through calculations by the inc.*/
a= format(Tr + (Ti-Tr)/exp(cc*t),6,10) /*ͺ*calculate the analytic (exact) value.*/
say center(t,11)  format(newV2,6,3)  'ΒΊC '  a  "ΒΊC"  format(abs(a-newV2)/a*100,6,2)  '%'
newV2= newV2   +   inc * cc * (Tr-newV2)           /*ͺ*calc. next value via Euler's method. */
end   /*ͺ*t*/
end        /*ͺ*sSize*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
exp: procedure expose e; arg x; ix= x%1; if abs(x-ix)>.5  then ix=ix+sign(x); x= x-ix; z=1
newV3=1;  w=1;    do j=1;  newV3= newV3*x/j;    z= (z+newV3)/1;      if z==w  then leave;         w=z
end  /*ͺ*j*/;           if z\==0  then z= e**ix * z;             return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Euler-method\euler-method-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
