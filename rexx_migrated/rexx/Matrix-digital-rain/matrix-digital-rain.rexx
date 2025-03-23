/*�*REXX program creates/displays Matrix (the movie) digital rain; favors non-Latin chars.*/
signal on halt                                   /*�*allow the user to halt/stop this pgm.*/
parse arg pc seed .                              /*�*obtain optional arguments from the CL*/
if pc=='' | pc==","     then pc= 20              /*�*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*�*Numeric?  Use seed for repeatability.*/
parse value  scrsize()  with  sd  sw  .          /*�*obtain the dimensions of the screen. */
if sd==0  then sd= 54;  sd= sd - 2 + 1           /*�*Not defined? Then use default; adjust*/
if sw==0  then sw= 80;  sw= sw - 1               /*�* "      "      "   "     "        "  */
lowC= c2d(' ')  +  1                             /*�*don't use any characters  ≤  a blank.*/
newV1.= ' '                                          /*�*PC  is the % new Matric rain streams.*/
cloud= copies(newV1., sw)                            /*�*the cloud, where matrix rain is born.*/
cls= 'CLS'                                       /*�*DOS command used to clear the screen.*/
do  forever;   call nimbus     /*�*define bottom of cloud  (the drops). */
call rain       /*�*generate rain, display the raindrops.*/
end   /*�*j*/
halt:  exit                                      /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rain:   do a=sd  by -1  for sd-1;   newV2= a-1;   newV1.a= newV1.newV2;   end;      call fogger;    return
show:   cls;  newV1.1= cloud;    do r=1  for sd;  say strip(newV1.r, 'T');  end  /*�*r*/;     return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nimbus: if random(, 100)<pc  then call mist      /*�*should this be a new rain stream ?   */
else call unmist    /*�*should any of the rain streams cease?*/
return                                   /*�*note: this subroutine may pass──►MIST*/
if random(, 100)<pc         then return  /*�*should this be a new rain stream ?   */
newV3= random(1, sw)                         /*�*pick a random rain cloud position.   */
if substr(cloud,newV3,1)\==' '  then return  /*�*Is cloud position not a blank? Return*/
/*�*───── ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ────────────────────────────────────────────────────*/
mist:   newV3= random(1, sw)                         /*�*obtain a random column in cloud.     */
if substr(cloud,newV3,1)\==' '  then return  /*�*if this stream is active, return.    */
if random(, 100)<pc         then return  /*�*should this be a new rain stream ?   */
cloud= overlay(drop(), cloud, newV3)         /*�*seed cloud with new matrix rain drop.*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
unmist: newV3= random(1, sw)                         /*�*obtain a random column in cloud.     */
if substr(cloud,newV3,1) ==' '  then return  /*�*if this stream is dry,  return.      */
if random(, 100)>pc         then return  /*�*should this be a new dry stream ?    */
cloud= overlay(' ', cloud, newV3);   return  /*�*seed cloud with new matrix rain drop.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
drop:   Lat= random(1, 4)                        /*�*Now, chose a matrix rain stream char.*/
tChr= 254;    if Lat==1  then tChr= 127  /*�*choose the  type of rain stream char.*/
return d2c( random(lowC, tChr) )         /*�*Lat = 1?   This favors Latin letters.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fogger: do f=1  for sw                           /*�*display a screen full of rain streams*/
if substr(cloud, f, 1) \== ' '   then cloud= overlay( drop(), cloud, f)
end   /*�*f*/;        call show;   return  /*�* [↑]  if raindrop, then change drop. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Matrix-digital-rain\matrix-digital-rain.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
