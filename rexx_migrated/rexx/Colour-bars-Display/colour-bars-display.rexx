/*ª*REXX program  displays  eight colored vertical bars  on a full screen.                */
parse  value  scrsize()  with sd sw .                 /*ª*the screen depth and width.     */
barWidth=sw%8                                         /*ª*calculate the bar width.        */
newV1.=copies('db'x, barWidth)                            /*ª*the bar, full width.            */
newV1.8=left(newV1.,barWidth-1)                               /*ª*the last bar width,  less one.  */
newV2 = x2c('1b5b73')  ||  x2c("1b5b313b33376d")      /*ª* the preamble,  and the header. */
hdr.1 = x2c('1b5b303b33306d')                         /*ª*  "  color black.               */
hdr.2 = x2c('1b5b313b33316d')                         /*ª*  "  color red.                 */
hdr.3 = x2c('1b5b313b33326d')                         /*ª*  "  color green.               */
hdr.4 = x2c('1b5b313b33346d')                         /*ª*  "  color blue.                */
hdr.5 = x2c('1b5b313b33356d')                         /*ª*  "  color magenta.             */
hdr.6 = x2c('1b5b313b33366d')                         /*ª*  "  color cyan.                */
hdr.7 = x2c('1b5b313b33336d')                         /*ª*  "  color yellow.              */
hdr.8 = x2c('1b5b313b33376d')                         /*ª*  "  color white.               */
tail = x2c('1b5b751b5b303b313b33363b34303b306d')     /*ª*  "  epilogue,  and the trailer.*/
/*ª* [â†“]  last bar width is shrunk. */
do j=1  for 8                                  /*ª*build the line, color by color. */
newV2=newV2 || hdr.j || newV1.j                            /*ª*append the color header + bar.  */
end   /*ª*j*/                                    /*ª* [â†‘]  color order is the list.  */
/*ª* [â†“]  the tail is overkill.     */
newV2=newV2 || tail                                           /*ª*append the epilogue (trailer).  */
/*ª* [â†“]  show full screen of bars. */
do k=1  for sd                                 /*ª*SD = screen depth (from above). */
say newV2                                          /*ª*have REXX display line of bars. */
end   /*ª*k*/                                    /*ª* [â†‘]  Note:  SD  could be zero. */
/*ª*stick a fork in it, we're done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Colour-bars-Display\colour-bars-display.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
