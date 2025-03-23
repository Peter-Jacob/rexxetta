/*ª*REXX program writes a  PPM  formatted image file, also known as a  P6  (binary) file. */
green  = 00ff00                                  /*ª*define a pixel with the color green. */
parse arg oFN width height color .               /*ª*obtain optional arguments from the CL*/
if    oFN=='' |    oFN==","  then    oFN='IMAGE' /*ª*Not specified?  Then use the default.*/
if  width=='' |  width==","  then  width=   20   /*ª* "      "         "   "   "     "    */
if height=='' | height==","  then height=   20   /*ª* "      "         "   "   "     "    */
if  color=='' |  color==","  then  color= green  /*ª* "      "         "   "   "     "    */
oFID= oFN'.PPM'                                  /*ª*define  oFID  by adding an extension.*/
newV1. = x2c(color)                                 /*ª*set all pixels of image a hex color. */
newV2  = '9'x                                       /*ª*define the separator (in the header).*/
newV3  = 255                                        /*ª*  "     "  max value for all colors. */
call charout oFID, ,  1                          /*ª*set the position of the file's output*/
call charout oFID,'P6'width || newV2 || height || newV2 || newV3 || newV2     /*ª*write file header info. */
newV4=
do j     =1  for width
do k=1  for height;  newV4= newV4 || newV1.j.k   /*ª*write the PPM file, 1 pixel at a time*/
end   /*ª*k*/                          /*ª* â†‘    a pixel contains three bytes,  */
end        /*ª*j*/                          /*ª* â””â”€â”€â”€â”€which defines the pixel's color*/
call charout oFID, newV4                             /*ª*write the image's raster to the file.*/
call charout oFID                                /*ª*close the output file just to be safe*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Write-a-PPM-file\bitmap-write-a-ppm-file.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
