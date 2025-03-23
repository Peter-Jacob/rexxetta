/*�*REXX program performs a  (square)  matrix inversion  using the  Gauss─Jordan  method. */
data=  8 3 7 5 9 12 10 11 6 2 4 13 14 15 16 17   /*�*the matrix element values.           */
call build  4                                    /*�*assign data elements to the matrix.  */
call show '@', 'The matrix of order '  n  " is:" /*�*display the (square) matrix.         */
call aux                                         /*�*define the auxiliary (identity) array*/
call invert                                      /*�*invert the matrix, store result in X.*/
call show 'X', "The inverted matrix is:"         /*�*display (inverted) auxiliary matrix. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
aux:   x.= 0;                do i=1  for n;   x.i.i= 1;   end;        return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
build: arg n;  newV2=0;  w=0;    do    r=1  for n                /*�*read a row of the matrix.*/
do c=1  for n;  newV2= newV2 + 1     /*�*  "  " col  "  "     "   */
newV1.r.c= word(data, newV2);  w= max(w, length(newV1.r.c) )
end   /*�*c*/                  /*�*W:  max width of a number*/
end      /*�*r*/;    return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
invert: do k=1  for n;                      t= newV1.k.k   /*�*divide each matrix row by  T.  */
do c=1  for n; newV1.k.c= newV1.k.c / t          /*�*process row of original matrix.*/
x.k.c= x.k.c / t          /*�*   "     "   " auxiliary   "   */
end   /*�*c*/
do r=1  for n;    if r==k  then iterate     /*�*skip if R is the same row as K.*/
t= newV1.r.k
do c=1  for n; newV1.r.c= newV1.r.c - t*newV1.k.c    /*�*process row of original matrix.*/
x.r.c= x.r.c - t*x.k.c    /*�*   "     "   " auxiliary    "  */
end   /*�*c*/
end      /*�*r*/
end         /*�*k*/;                      return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: parse arg newV3, title;  say;  say title;  f= 4     /*�*F:  fractional digits precision.*/
do   r=1  for n; newV4=
do c=1  for n; if newV3=='@' then newV4= newV4 right(       newV1.r.c, w)
else newV4= newV4 right(format(x.r.c, w, f), w + f + length(.))
end   /*�*c*/;   say newV4
end     /*�*r*/;                          return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gauss-Jordan-matrix-inversion\gauss-jordan-matrix-inversion-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
