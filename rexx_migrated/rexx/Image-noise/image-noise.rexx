/*�*REXX program times (elapsed) the generation of 100 frames of random black&white image.*/
parse arg sw sd im .                             /*�*obtain optional args from the C.L.   */
if sw=='' | sw==","  then sw=320                 /*�*SW  specified?  No, then use default.*/
if sd=='' | sd==","  then sd=240                 /*�*SD      "        "    "   "      "   */
if im=='' | im==","  then im=100                 /*�*IM      "        "    "   "      "   */
call time 'R'                                    /*�*reset the REXX elapsed (clock) timer.*/
do   im                            /*�*generate    IM     number of images. */
call genFrame  sw, sd              /*�*generate single image of size SW x SD*/
/*�*■■■ display frame here ■■■*/     /*�*do (or don't) display the frame num. */
end   /*�*im*/                       /*�*generate, but don't display the image*/
/*�*measures  ↓  elapsed time in seconds.*/
say 'The average frames/second: '    format(im/time("E"), , 2)     /*�*show frames/second.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genFrame:  parse arg x,y;   newV1.0= 'ff000000'x                   /*�*hex: the color  black. */
newV1.1= 'ffFFffFF'x                   /*�* "    "    "    white. */
newV2=                                                  /*�*nullify image string.  */
do y;  newV3=                                    /*�*nullify an output row. */
do x;  newV4=random(0,1);  newV3=newV3 || newV1.newV4  /*�*color is black │ white.*/
end   /*�*x*/                        /*�* [↑]  build a whole row*/
newV2=newV2 || newV3                                     /*�*append row to $ string.*/
end             /*�*y*/                        /*�* [↑]  build the image. */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Image-noise\image-noise.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
