/*�*REXX program  displays  eight colored vertical bars  on a full screen.                */
parse  value  scrsize()  with sd sw .                 /*�*the screen depth and width.     */
barWidth=sw%8                                         /*�*calculate the bar width.        */
newV1.=copies('db'x, barWidth)                            /*�*the bar, full width.            */
newV1.8=left(newV1.,barWidth-1)                               /*�*the last bar width,  less one.  */
newV2 = x2c('1b5b73')  ||  x2c("1b5b313b33376d")      /*�* the preamble,  and the header. */
hdr.1 = x2c('1b5b303b33306d')                         /*�*  "  color black.               */
hdr.2 = x2c('1b5b313b33316d')                         /*�*  "  color red.                 */
hdr.3 = x2c('1b5b313b33326d')                         /*�*  "  color green.               */
hdr.4 = x2c('1b5b313b33346d')                         /*�*  "  color blue.                */
hdr.5 = x2c('1b5b313b33356d')                         /*�*  "  color magenta.             */
hdr.6 = x2c('1b5b313b33366d')                         /*�*  "  color cyan.                */
hdr.7 = x2c('1b5b313b33336d')                         /*�*  "  color yellow.              */
hdr.8 = x2c('1b5b313b33376d')                         /*�*  "  color white.               */
tail = x2c('1b5b751b5b303b313b33363b34303b306d')     /*�*  "  epilogue,  and the trailer.*/
/*�* [↓]  last bar width is shrunk. */
do j=1  for 8                                  /*�*build the line, color by color. */
newV2=newV2 || hdr.j || newV1.j                            /*�*append the color header + bar.  */
end   /*�*j*/                                    /*�* [↑]  color order is the list.  */
/*�* [↓]  the tail is overkill.     */
newV2=newV2 || tail                                           /*�*append the epilogue (trailer).  */
/*�* [↓]  show full screen of bars. */
do k=1  for sd                                 /*�*SD = screen depth (from above). */
say newV2                                          /*�*have REXX display line of bars. */
end   /*�*k*/                                    /*�* [↑]  Note:  SD  could be zero. */
/*�*stick a fork in it, we're done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Colour-bars-Display\colour-bars-display.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
