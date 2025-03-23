/*�*REXX program renders a  graphical pattern  by  coloring  each pixel   with   x XOR y  */
/*�*─────────────────────────────────────────  from an arbitrary constructed color table. */
rows= 2                                          /*�*the number of rows in the color table*/
cols= 5                                          /*�* "     "    " cols  "  "    "     "  */
do row  =0  for rows*3                   /*�*construct a color table, size  25x50.*/
do col=0  for cols*3
newV2= (row+col) // 255
newV1.row.col= x2b( d2x(newV2+0, 2) )  ||,     /*�*ensure $ is converted──►2 hex nibbles*/
x2b( d2x(newV2+1, 2) )  ||,
x2b( d2x(newV2+2, 2) )
end   /*�*col*/                          /*�* [↑]  construct a three-byte pixel.  */
end     /*�*row*/

do   x=0  for cols                       /*�*create a graphical pattern with XORs.*/
do y=0  for rows
newV1.x.y= bitxor(newV1.x, newV1.y)                /*�*renders 3 bytes (a pixel) at a time. */
end   /*�*y*/
end     /*�*x*/                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Munching-squares\munching-squares.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
