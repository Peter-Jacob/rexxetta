/*ª*REXX pgm finds & shows the sum of elements below the main diagonal of a square matrix.*/
newV2= '1 3 7 8 10 2 4 16 14 4 3 1 9 18 11 12 14 17 18 20 7 1 3 9 5';       newV3= words(newV2)
do siz=1  while siz*siz<newV3;  end             /*ª*determine the size of the matrix.    */
w= 0                                             /*ª*W:  the maximum width any any element*/
do j=1  for newV3;         parse var newV2  newV1..j  newV2 /*ª*obtain a number of the array (list). */
w= max(w, length(newV1..j))                     /*ª*examine each element for its width.  */
end   /*ª*j*/                                 /*ª* [â†‘] this is aligning matrix elements*/
s= 0;                       z= 0                 /*ª*initialize the sum  [S]  to zero.    */
do      r=1  for siz;  newV4= left('', 12)      /*ª*_:  contains a row of matrix elements*/
do c=1  for siz;  z= z + 1;  newV1.z= newV1..z /*ª*get a  number  of the    "      "    */
newV4= newV4  right(newV1.z, w)                    /*ª*build a row of elements for display. */
if c<r  then s= s + newV1.z                /*ª*add a  "lower element"  to the sum.  */
end   /*ª*r*/
say newV4                                       /*ª*display a row of the matrix to term. */
end        /*ª*c*/
say 'sum of elements below main diagonal is: ' s /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-elements-below-main-diagonal-of-matrix\sum-of-elements-below-main-diagonal-of-matrix-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
