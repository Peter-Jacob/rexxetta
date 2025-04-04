/*ͺ*REXX program renders a  graphical pattern  by  coloring  each pixel   with   x XOR y  */
/*ͺ*βββββββββββββββββββββββββββββββββββββββββ  from an arbitrary constructed color table. */
rows= 2                                          /*ͺ*the number of rows in the color table*/
cols= 5                                          /*ͺ* "     "    " cols  "  "    "     "  */
do row  =0  for rows*3                   /*ͺ*construct a color table, size  25x50.*/
do col=0  for cols*3
newV2= (row+col) // 255
newV1.row.col= x2b( d2x(newV2+0, 2) )  ||,     /*ͺ*ensure $ is convertedβββΊ2 hex nibbles*/
x2b( d2x(newV2+1, 2) )  ||,
x2b( d2x(newV2+2, 2) )
end   /*ͺ*col*/                          /*ͺ* [β]  construct a three-byte pixel.  */
end     /*ͺ*row*/

do   x=0  for cols                       /*ͺ*create a graphical pattern with XORs.*/
do y=0  for rows
newV1.x.y= bitxor(newV1.x, newV1.y)                /*ͺ*renders 3 bytes (a pixel) at a time. */
end   /*ͺ*y*/
end     /*ͺ*x*/                            /*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Munching-squares\munching-squares.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
