/*�*REXX program  displays  an  ASCII plot   (character plot)   of a  Julia set.          */
parse arg real imag fine .                       /*�*obtain optional arguments from the CL*/
if real=='' | real==","  then real= -0.8         /*�*Not specified?  Then use the default.*/
if imag=='' | imag==","  then imag=  0.156       /*�* "      "         "   "   "     "    */
if fine=='' | fine==","  then fine= 50           /*�* "      "         "   "   "     "    */
newV1=scrsize(); parse var newV1 sd sw; sd=sd-4; sw=sw-1 /*�*obtain useable area for the terminal.*/
/*�*$:  the plot line that is constructed*/
do   v= -sd%2  to sd%2;     newV2=          /*�*step through  vertical   axis values.*/
do h= -sw%2  to sw%2                  /*�*  "     "    horizontal    "     "   */
x=h/sw*2                              /*�*calculate the initial   X   value.   */
y=v/sd*2                              /*�*    "      "     "      Y     "      */
newV3='■';    do fine                     /*�*FINE: is the "fineness" for the plot.*/
zr=x*x - y*y + real         /*�*calculate a new   real   Julia point.*/
zi=x*y*2     + imag         /*�*    "     "  "  imaginal   "     "   */
if zr**2>10000  then do; newV3=' '; leave; end    /*�*is  ZR  too large? */
x=zr;    y=zi                                 /*�*use this new point.*/
end   /*�*50*/
newV2=newV2 || newV3                              /*�*append the plot char to the plot line*/
end            /*�*h*/
if newV2\=''  then say strip(newV2, 'T')        /*�*only display a plot line if non-blank*/
end   /*�*v*/                             /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Julia-set\julia-set.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
