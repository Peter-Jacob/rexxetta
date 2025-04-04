/*ͺ*REXX program converts a  RGB (redβgreenβblue) image into a  grayscale/greyscale image.*/
blue= '00 00 ff'x                              /*ͺ*define the blue color  (hexadecimal).*/
newV1.= blue                                     /*ͺ*set the entire  image  to blue color.*/
width=  60                                      /*ͺ* width of the   image  (in pixels).  */
height= 100                                      /*ͺ*height  "  "      "      "   "       */

do    col=1  for width
do row=1  for height                        /*ͺ* [β]  C2D  convert  char ββββΊ decimal*/
r= left(newV1.col.row, 1)      ;     r= c2d(r)  /*ͺ*extract the component red  & convert.*/
g= substr(newV1.col.row, 2, 1) ;     g= c2d(g)  /*ͺ*   "     "      "    green "    "    */
b=  right(newV1.col.row, 1)    ;     b= c2d(b)  /*ͺ*   "     "      "    blue  "    "    */
newV2= d2c( (.2126*r + .7152*g + .0722*b) % 1)  /*ͺ*convert RGB number  ββββΊ  grayscale. */
newV1.col.row= copies(newV2, 3)                     /*ͺ*redefine old RGB    ββββΊ  grayscale. */
end   /*ͺ*row*/                               /*ͺ* [β]  D2C  convert  decimal ββββΊ char*/
end      /*ͺ*col*/                               /*ͺ* [β]  x%1   is the same as  TRUNC(x) */
/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Grayscale-image\grayscale-image.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
