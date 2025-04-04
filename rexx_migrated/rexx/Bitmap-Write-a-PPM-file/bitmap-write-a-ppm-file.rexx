/*ͺ*REXX program writes a  PPM  formatted image file, also known as a  P6  (binary) file. */
green  = 00ff00                                  /*ͺ*define a pixel with the color green. */
parse arg oFN width height color .               /*ͺ*obtain optional arguments from the CL*/
if    oFN=='' |    oFN==","  then    oFN='IMAGE' /*ͺ*Not specified?  Then use the default.*/
if  width=='' |  width==","  then  width=   20   /*ͺ* "      "         "   "   "     "    */
if height=='' | height==","  then height=   20   /*ͺ* "      "         "   "   "     "    */
if  color=='' |  color==","  then  color= green  /*ͺ* "      "         "   "   "     "    */
oFID= oFN'.PPM'                                  /*ͺ*define  oFID  by adding an extension.*/
newV1. = x2c(color)                                 /*ͺ*set all pixels of image a hex color. */
newV2  = '9'x                                       /*ͺ*define the separator (in the header).*/
newV3  = 255                                        /*ͺ*  "     "  max value for all colors. */
call charout oFID, ,  1                          /*ͺ*set the position of the file's output*/
call charout oFID,'P6'width || newV2 || height || newV2 || newV3 || newV2     /*ͺ*write file header info. */
newV4=
do j     =1  for width
do k=1  for height;  newV4= newV4 || newV1.j.k   /*ͺ*write the PPM file, 1 pixel at a time*/
end   /*ͺ*k*/                          /*ͺ* β    a pixel contains three bytes,  */
end        /*ͺ*j*/                          /*ͺ* βββββwhich defines the pixel's color*/
call charout oFID, newV4                             /*ͺ*write the image's raster to the file.*/
call charout oFID                                /*ͺ*close the output file just to be safe*/
/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Write-a-PPM-file\bitmap-write-a-ppm-file.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
