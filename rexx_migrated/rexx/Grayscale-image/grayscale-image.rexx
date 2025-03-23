/*ª*REXX program converts a  RGB (redâ”€greenâ”€blue) image into a  grayscale/greyscale image.*/
blue= '00 00 ff'x                              /*ª*define the blue color  (hexadecimal).*/
newV1.= blue                                     /*ª*set the entire  image  to blue color.*/
width=  60                                      /*ª* width of the   image  (in pixels).  */
height= 100                                      /*ª*height  "  "      "      "   "       */

do    col=1  for width
do row=1  for height                        /*ª* [â†“]  C2D  convert  char â”€â”€â”€â–º decimal*/
r= left(newV1.col.row, 1)      ;     r= c2d(r)  /*ª*extract the component red  & convert.*/
g= substr(newV1.col.row, 2, 1) ;     g= c2d(g)  /*ª*   "     "      "    green "    "    */
b=  right(newV1.col.row, 1)    ;     b= c2d(b)  /*ª*   "     "      "    blue  "    "    */
newV2= d2c( (.2126*r + .7152*g + .0722*b) % 1)  /*ª*convert RGB number  â”€â”€â”€â–º  grayscale. */
newV1.col.row= copies(newV2, 3)                     /*ª*redefine old RGB    â”€â”€â”€â–º  grayscale. */
end   /*ª*row*/                               /*ª* [â†‘]  D2C  convert  decimal â”€â”€â”€â–º char*/
end      /*ª*col*/                               /*ª* [â†‘]  x%1   is the same as  TRUNC(x) */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Grayscale-image\grayscale-image.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
