/*ช*REXX program demonstrates how to process/display                     */
/*ช*                                a simple  RGB  raster graphics image.*/
red   = 'ff 00 00'x             /*ช*a method to define a   red   value.  */
blue  = '00 00 ff'x             /*ช*'    '    '    '   '   blue    '     */
pixel=''                        /*ช*define entire  pixel. array to nulls.*/
outFN = 'image'                 /*ช*the filename of the output image PPM */
sWidth = 500; sHeight= 500      /*ช*the screen width and height in pixels*/
Call RGBfill red                /*ช*set the entire   image   to red.     */
x=10; y=40                      /*ช*set pixel's coรถrdinates.             */
Call RGBset x,y,blue            /*ช*set a pixel (at  10,40)  to blue.    */
color = RGBget(x,y)             /*ช*get the color of a pixel.            */
hexV  = c2x(color)              /*ช*get hex    value of pixel's color.   */
binV  = x2b(hexV)               /*ช* "  binary   "    "    "      "      */
bin3V = left(binV,8) substr(binV,9,8) right(binV,8)
hex3V = left(hexV,2) substr(hexV,3,2) right(hexV,2)
xy= '('||x','y')'               /*ช*create a handy-dandy literal for SAY.*/
Say xy ' pixel in binary: ' binV   /*ช*show the binary value of  20,50   */
Say xy ' pixel in binary: ' bin3V  /*ช*show again,but with spaces.       */
Say                                /*ช*show a blank between bin & hex.   */
Say xy ' pixel in hex:    ' hexV   /*ช*show again,but in hexadecimal.    */
Say xy ' pixel in hex:    ' hex3V  /*ช*show again,but with spaces.       */
Call PPMwrite outFN,sWidth,sHeight /*ช*create a PPM (output) file        */
/*ช* ?ยฆยฆยฆยฆยฆยฆยฆยฆ not part of this task.*/
Say                                      /*ช*show a blank.               */
Say 'The file ' outFN'.PPM was created.' /*ช*inform user                 */
Exit                             /*ช*stick a fork in it, we're all done. */
/*ช*---------------------------------------------------------------------*/
RGBfill: pixel.=arg(1);   Return             /*ช*fill image with a color.*/
RGBget:  Parse arg px,py; Return pixel.px.py /*ช*get a pixel's color.    */
RGBset:  Parse arg px,py,psep; pixel.px.py=psep; Return /*ช*set a pixel  */
/*ช*---------------------------------------------------------------------*/
PPMwrite: Parse arg oFN,width,height
oFID= oFN'.PPM'               /*ช* fileID                              */
sep='9'x;                     /*ช* separator                           */
maxcol=255                    /*ช* max color value.                    */
Call charout oFID,,1          /*ช*set the position of the file's output*/
Call charout oFID,'P6'width||sep||height||sep||maxcol||sep /*ช* header */
Do i=1 To width
Do j=1 To height;
Call charout oFID,pixel.i.j
End
End
Call charout oFID           /*ช* close the output file just to be safe */
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap\bitmap-1.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
