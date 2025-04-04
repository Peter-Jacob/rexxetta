/*ͺ*REXX program reads a PPM formatted image file,  and creates a grayβscale image of it. */
parse arg iFN oFN                                /*ͺ*obtain optional argument from the CL.*/
if iFN=='' | iFN==","  then  iFN= 'Lenna50'      /*ͺ*Not specified?  Then use the default.*/
if oFN=='' | oFN==","  then  oFN= 'greyscale'    /*ͺ* "      "         "   "   "     "    */
iFID= iFN'.ppm';             oFID= oFN'.ppm'     /*ͺ*complete the  input and output  FIDs.*/
call charin iFID, 1, 0                           /*ͺ*set the position of the input file.  */
y=charin(iFID, , copies(9, digits() ) )          /*ͺ*read the entire input file  ββββΊ  X  */
parse var  y   id  3 c 4 3 width height newV6 pixels /*ͺ*extract header info from the PPM hdr.*/
LF= 'a'x                                   /*ͺ*define a comment separator  (in hdr).*/      /*ͺ* ββββ LF delimiters & comments*/
if c==LF  then do;  commentEND=pos(LF, y, 4)     /*ͺ*point to the last char in the comment*/      /*ͺ* ββββ LF delimiters & comments*/
parse var  y   newV1  +1  width  height          newV6  pixels          /*ͺ* ββββ LF delimiters & comments*/
end                                                                              /*ͺ* ββββ LF delimiters & comments*/
/*ͺ* [β]  has an alternative delimiter?  */      /*ͺ* ββββ LF delimiters & comments*/
z=pos(LF, height);  if z\==0  then parse var  height height    newV2   +1     newV6  pixels          /*ͺ* ββββ LF delimiters & comments*/
z=pos(LF, newV6     );  if z\==0  then parse var  newV6      newV6         newV2   +1        pixels          /*ͺ* ββββ LF delimiters & comments*/
chunk=4000                                       /*ͺ*chunk size to be written at one time.*/
LenPixels= length(pixels)

do j=0  for 256;  newV7=d2c(j);   newV5.newV7=j;   newV4.j=newV7  /*ͺ*build two tables for fast conversions*/
end   /*ͺ*j*/

call charout oFID, ,  1                          /*ͺ*set the position of the output file. */
call charout oFID, id || width height newV6' '       /*ͺ*write the header followed by a blank.*/
newV8=1
do until newV8>=LenPixels;            newV9=         /*ͺ*$:      partial output string so far.*/
do newV8=newV8  by 3  for chunk                    /*ͺ*chunk:  # pixels converted at 1 time.*/
parse var pixels  newV3  r +1   g +1   b +1 /*ͺ*obtain the next  RGB  of a PPM pixel.*/
if r==''  then leave                       /*ͺ*has the endβofβstring been reached?  */
newV7=(.2126*newV5.r  + .7152*newV5.g  + .0722*newV5.b )%1 /*ͺ*an integer RGB greyscale of a pixel. */
newV9=newV9  ||  newV4.newV7  ||  newV4.newV7  ||  newV4.newV7          /*ͺ*lump (grey)  R G B  pixels together. */
end   /*ͺ*!*/                                /*ͺ* [β]  D2C  converts decimal ββββΊ char*/
call charout oFID, newV9                         /*ͺ*write the next bunch of pixels.      */
end     /*ͺ*until*/

call charout oFID                                /*ͺ*close the output file just to be safe*/
say 'File '       oFID       " was created."     /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Read-a-PPM-file\bitmap-read-a-ppm-file.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
