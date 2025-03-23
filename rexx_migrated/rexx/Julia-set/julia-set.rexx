/*ª*REXX program  displays  an  ASCII plot   (character plot)   of a  Julia set.          */
parse arg real imag fine .                       /*ª*obtain optional arguments from the CL*/
if real=='' | real==","  then real= -0.8         /*ª*Not specified?  Then use the default.*/
if imag=='' | imag==","  then imag=  0.156       /*ª* "      "         "   "   "     "    */
if fine=='' | fine==","  then fine= 50           /*ª* "      "         "   "   "     "    */
newV1=scrsize(); parse var newV1 sd sw; sd=sd-4; sw=sw-1 /*ª*obtain useable area for the terminal.*/
/*ª*$:  the plot line that is constructed*/
do   v= -sd%2  to sd%2;     newV2=          /*ª*step through  vertical   axis values.*/
do h= -sw%2  to sw%2                  /*ª*  "     "    horizontal    "     "   */
x=h/sw*2                              /*ª*calculate the initial   X   value.   */
y=v/sd*2                              /*ª*    "      "     "      Y     "      */
newV3='â– ';    do fine                     /*ª*FINE: is the "fineness" for the plot.*/
zr=x*x - y*y + real         /*ª*calculate a new   real   Julia point.*/
zi=x*y*2     + imag         /*ª*    "     "  "  imaginal   "     "   */
if zr**2>10000  then do; newV3=' '; leave; end    /*ª*is  ZR  too large? */
x=zr;    y=zi                                 /*ª*use this new point.*/
end   /*ª*50*/
newV2=newV2 || newV3                              /*ª*append the plot char to the plot line*/
end            /*ª*h*/
if newV2\=''  then say strip(newV2, 'T')        /*ª*only display a plot line if non-blank*/
end   /*ª*v*/                             /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Julia-set\julia-set.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
