/*ͺ*REXX program performs a  (square)  matrix inversion  using the  GaussβJordan  method. */
data=  8 3 7 5 9 12 10 11 6 2 4 13 14 15 16 17   /*ͺ*the matrix element values.           */
call build  4                                    /*ͺ*assign data elements to the matrix.  */
call show '@', 'The matrix of order '  n  " is:" /*ͺ*display the (square) matrix.         */
call aux                                         /*ͺ*define the auxiliary (identity) array*/
call invert                                      /*ͺ*invert the matrix, store result in X.*/
call show 'X', "The inverted matrix is:"         /*ͺ*display (inverted) auxiliary matrix. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
aux:   x.= 0;                do i=1  for n;   x.i.i= 1;   end;        return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
build: arg n;  newV2=0;  w=0;    do    r=1  for n                /*ͺ*read a row of the matrix.*/
do c=1  for n;  newV2= newV2 + 1     /*ͺ*  "  " col  "  "     "   */
newV1.r.c= word(data, newV2);  w= max(w, length(newV1.r.c) )
end   /*ͺ*c*/                  /*ͺ*W:  max width of a number*/
end      /*ͺ*r*/;    return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
invert: do k=1  for n;                      t= newV1.k.k   /*ͺ*divide each matrix row by  T.  */
do c=1  for n; newV1.k.c= newV1.k.c / t          /*ͺ*process row of original matrix.*/
x.k.c= x.k.c / t          /*ͺ*   "     "   " auxiliary   "   */
end   /*ͺ*c*/
do r=1  for n;    if r==k  then iterate     /*ͺ*skip if R is the same row as K.*/
t= newV1.r.k
do c=1  for n; newV1.r.c= newV1.r.c - t*newV1.k.c    /*ͺ*process row of original matrix.*/
x.r.c= x.r.c - t*x.k.c    /*ͺ*   "     "   " auxiliary    "  */
end   /*ͺ*c*/
end      /*ͺ*r*/
end         /*ͺ*k*/;                      return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: parse arg newV3, title;  say;  say title;  f= 4     /*ͺ*F:  fractional digits precision.*/
do   r=1  for n; newV4=
do c=1  for n; if newV3=='@' then newV4= newV4 right(       newV1.r.c, w)
else newV4= newV4 right(format(x.r.c, w, f), w + f + length(.))
end   /*ͺ*c*/;   say newV4
end     /*ͺ*r*/;                          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gauss-Jordan-matrix-inversion\gauss-jordan-matrix-inversion-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
