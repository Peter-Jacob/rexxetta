/*ͺ*REXX program creates/displays Matrix (the movie) digital rain; favors non-Latin chars.*/
signal on halt                                   /*ͺ*allow the user to halt/stop this pgm.*/
parse arg pc seed .                              /*ͺ*obtain optional arguments from the CL*/
if pc=='' | pc==","     then pc= 20              /*ͺ*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*Numeric?  Use seed for repeatability.*/
parse value  scrsize()  with  sd  sw  .          /*ͺ*obtain the dimensions of the screen. */
if sd==0  then sd= 54;  sd= sd - 2 + 1           /*ͺ*Not defined? Then use default; adjust*/
if sw==0  then sw= 80;  sw= sw - 1               /*ͺ* "      "      "   "     "        "  */
lowC= c2d(' ')  +  1                             /*ͺ*don't use any characters  β€  a blank.*/
newV1.= ' '                                          /*ͺ*PC  is the % new Matric rain streams.*/
cloud= copies(newV1., sw)                            /*ͺ*the cloud, where matrix rain is born.*/
cls= 'CLS'                                       /*ͺ*DOS command used to clear the screen.*/
do  forever;   call nimbus     /*ͺ*define bottom of cloud  (the drops). */
call rain       /*ͺ*generate rain, display the raindrops.*/
end   /*ͺ*j*/
halt:  exit                                      /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rain:   do a=sd  by -1  for sd-1;   newV2= a-1;   newV1.a= newV1.newV2;   end;      call fogger;    return
show:   cls;  newV1.1= cloud;    do r=1  for sd;  say strip(newV1.r, 'T');  end  /*ͺ*r*/;     return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nimbus: if random(, 100)<pc  then call mist      /*ͺ*should this be a new rain stream ?   */
else call unmist    /*ͺ*should any of the rain streams cease?*/
return                                   /*ͺ*note: this subroutine may passβββΊMIST*/
if random(, 100)<pc         then return  /*ͺ*should this be a new rain stream ?   */
newV3= random(1, sw)                         /*ͺ*pick a random rain cloud position.   */
if substr(cloud,newV3,1)\==' '  then return  /*ͺ*Is cloud position not a blank? Return*/
/*ͺ*βββββ β β β β β β β β β β β β β β ββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
mist:   newV3= random(1, sw)                         /*ͺ*obtain a random column in cloud.     */
if substr(cloud,newV3,1)\==' '  then return  /*ͺ*if this stream is active, return.    */
if random(, 100)<pc         then return  /*ͺ*should this be a new rain stream ?   */
cloud= overlay(drop(), cloud, newV3)         /*ͺ*seed cloud with new matrix rain drop.*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
unmist: newV3= random(1, sw)                         /*ͺ*obtain a random column in cloud.     */
if substr(cloud,newV3,1) ==' '  then return  /*ͺ*if this stream is dry,  return.      */
if random(, 100)>pc         then return  /*ͺ*should this be a new dry stream ?    */
cloud= overlay(' ', cloud, newV3);   return  /*ͺ*seed cloud with new matrix rain drop.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
drop:   Lat= random(1, 4)                        /*ͺ*Now, chose a matrix rain stream char.*/
tChr= 254;    if Lat==1  then tChr= 127  /*ͺ*choose the  type of rain stream char.*/
return d2c( random(lowC, tChr) )         /*ͺ*Lat = 1?   This favors Latin letters.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fogger: do f=1  for sw                           /*ͺ*display a screen full of rain streams*/
if substr(cloud, f, 1) \== ' '   then cloud= overlay( drop(), cloud, f)
end   /*ͺ*f*/;        call show;   return  /*ͺ* [β]  if raindrop, then change drop. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Matrix-digital-rain\matrix-digital-rain.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
