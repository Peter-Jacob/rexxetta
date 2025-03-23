/*ª*REXX program reads a PPM formatted image file,  and creates a grayâ”€scale image of it. */
parse arg iFN oFN                                /*ª*obtain optional argument from the CL.*/
if iFN=='' | iFN==","  then  iFN= 'Lenna50'      /*ª*Not specified?  Then use the default.*/
if oFN=='' | oFN==","  then  oFN= 'greyscale'    /*ª* "      "         "   "   "     "    */
iFID= iFN'.ppm';             oFID= oFN'.ppm'     /*ª*complete the  input and output  FIDs.*/
call charin iFID, 1, 0                           /*ª*set the position of the input file.  */
y=charin(iFID, , copies(9, digits() ) )          /*ª*read the entire input file  â”€â”€â”€â–º  X  */
parse var  y   id  3 c 4 3 width height newV6 pixels /*ª*extract header info from the PPM hdr.*/
LF= 'a'x                                   /*ª*define a comment separator  (in hdr).*/      /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
if c==LF  then do;  commentEND=pos(LF, y, 4)     /*ª*point to the last char in the comment*/      /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
parse var  y   newV1  +1  width  height          newV6  pixels          /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
end                                                                              /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
/*ª* [â†“]  has an alternative delimiter?  */      /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
z=pos(LF, height);  if z\==0  then parse var  height height    newV2   +1     newV6  pixels          /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
z=pos(LF, newV6     );  if z\==0  then parse var  newV6      newV6         newV2   +1        pixels          /*ª* â—„â”€â”€â”€ LF delimiters & comments*/
chunk=4000                                       /*ª*chunk size to be written at one time.*/
LenPixels= length(pixels)

do j=0  for 256;  newV7=d2c(j);   newV5.newV7=j;   newV4.j=newV7  /*ª*build two tables for fast conversions*/
end   /*ª*j*/

call charout oFID, ,  1                          /*ª*set the position of the output file. */
call charout oFID, id || width height newV6' '       /*ª*write the header followed by a blank.*/
newV8=1
do until newV8>=LenPixels;            newV9=         /*ª*$:      partial output string so far.*/
do newV8=newV8  by 3  for chunk                    /*ª*chunk:  # pixels converted at 1 time.*/
parse var pixels  newV3  r +1   g +1   b +1 /*ª*obtain the next  RGB  of a PPM pixel.*/
if r==''  then leave                       /*ª*has the endâ”€ofâ”€string been reached?  */
newV7=(.2126*newV5.r  + .7152*newV5.g  + .0722*newV5.b )%1 /*ª*an integer RGB greyscale of a pixel. */
newV9=newV9  ||  newV4.newV7  ||  newV4.newV7  ||  newV4.newV7          /*ª*lump (grey)  R G B  pixels together. */
end   /*ª*!*/                                /*ª* [â†‘]  D2C  converts decimal â”€â”€â”€â–º char*/
call charout oFID, newV9                         /*ª*write the next bunch of pixels.      */
end     /*ª*until*/

call charout oFID                                /*ª*close the output file just to be safe*/
say 'File '       oFID       " was created."     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitmap-Read-a-PPM-file\bitmap-read-a-ppm-file.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
