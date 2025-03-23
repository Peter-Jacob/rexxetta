/*�*REXX program calculates the   Kronecker product   of   two arbitrary size   matrices. */
parse arg pGlyph .                               /*�*obtain optional argument from the CL.*/
if pGlyph=='' | pGlyph==","  then pGlyph= '█'    /*�*Not specified?  Then use the default.*/
if length(pGlyph)==2  then pGlyph= x2c(pGlyph)   /*�*Plot glyph is 2 chars?   Hexadecimal.*/
if length(pGlyph)==3  then pGlyph= d2c(pGlyph)   /*�*  "    "    " 3   "      Decimal.    */
aMat= 3x3  0 1 0 1 1 1 0 1 0              /*�*define  A  matrix size  and elements.*/
bMat= 3x3  1 1 1 1 0 1 1 1 1              /*�*   "    B     "     "    "     "     */
call makeMat 'A', aMat                           /*�*construct   A   matrix from elements.*/
call makeMat 'B', bMat                           /*�*    "       B      "     "     "     */
call KronMat 'Kronecker product'                 /*�*calculate the  Kronecker  product.   */
call showMat 'Kronecker product', result         /*�*display   the  Kronecker  product.   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
KronMat: parse arg what;              newV3= 0;           parse var  newV1.a.shape  aRows  aCols
parse var  newV1.b.shape  bRows  bCols
do       rA=1  for aRows
do     rB=1  for bRows;  newV3= newV3 + 1;       newV2= 0;         newV4=
do   cA=1  for aCols;  x= newV1.a.rA.cA
do cB=1  for bCols;  y= newV1.b.rB.cB;   newV2= newV2 + 1;   xy= x * y;     newV4= newV4 xy
newV1.what.newV3.newV2= xy
end   /*�*cB*/
end     /*�*cA*/
end       /*�*rB*/
end         /*�*rA*/;        return aRows * aRows   ||   'X'   ||   bRows * bRows
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
makeMat: parse arg what, size elements;   arg , row 'X' col .;      newV1.what.shape= row  col
newV3=0;    do   r=1  for row               /*�* [↓]  bump item#; get item; max width*/
do c=1  for col;   newV3= newV3 + 1;        newV1.what.r.c= word(elements, newV3)
end   /*�*c*/                   /*�* [↑] define an element of WHAT matrix*/
end     /*�*r*/;           return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showMat: parse arg what, size .;   parse var size  row  'X'  col   /*�*obtain mat name, sz*/
do    r=1  for row;    newV5=                     /*�*build row by row.  */
do c=1  for col;    newV5= newV5 || newV1.what.r.c     /*�*  "   col  " col.  */
end   /*�*c*/
newV5= translate(newV5, pGlyph, 10)                   /*�*change──►plot glyph*/
say strip(newV5, 'T')                             /*�*display line──►term*/
end     /*�*r*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Kronecker-product-based-fractals\kronecker-product-based-fractals.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
