/*ช*REXX program creates a  matrix  from console input, performs/shows  LU  decomposition.*/
newV1= 0;    P.= 0;    PA.= 0;     L.= 0;     U.= 0  /*ช*initialize some variables to zero.   */
parse arg x                                      /*ช*obtain matrix elements from the C.L. */
call bldAMat;       call showMat 'A'    /*ช*build and display A  matrix.*/
call bldPmat;       call showMat 'P'    /*ช*  "    "     "    P     "   */
call multMat;       call showMat 'PA'   /*ช*  "    "     "    PA    "   */
do y=1  for N;  call bldUmat;       call bldLmat        /*ช*build     U  and  L     "   */
end   /*ช*y*/
call showMat 'L';   call showMat 'U'    /*ช*display   L  and  U     "   */
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
bldAMat: ?= words(x);  do N=1  for ?  until N**2>=?                /*ช*find matrix size.  */
end  /*ช*N*/
if N**2\==?  then do;  say '***error*** wrong # of elements entered:'  ?;  exit 9
end
do    r=1  for N                                 /*ช*build   A   matrix.*/
do c=1  for N;        newV1= newV1 + 1;     newV2= word(x, newV1);        A.r.c= newV2
if \datatype(newV2, 'N')  then call er "element isn't numeric: "  newV2
end   /*ช*c*/
end      /*ช*r*/;          return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
bldLmat:          do    r=1  for N                                 /*ช*build lower matrix.*/
do c=1  for N;        if r==c  then do;   L.r.c= 1;   iterate;    end
if c\==y | r==c | c>r  then iterate
newV2= PA.r.c
do k=1  for c-1;    newV2= newV2   -   U.k.c * L.r.k
end  /*ช*k*/
L.r.c= newV2 / U.c.c
end   /*ช*c*/
end      /*ช*r*/;          return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
bldPmat: c= N;    do r=N  by -1  for N;    P.r.c= 1;     c= c + 1  /*ช*build perm. matrix.*/
if c>N  then c= N%2;     if c==N  then c= 1
end   /*ช*r*/;             return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
bldUmat:          do    r=1  for N;        if r\==y  then iterate  /*ช*build upper matrix.*/
do c=1  for N;        if c<r    then iterate
newV2= PA.r.c
do k=1  for r-1;     newV2= newV2   -   U.k.c * L.r.k
end   /*ช*k*/
U.r.c= newV2 / 1
end   /*ช*c*/
end      /*ช*r*/;          return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
multMat:          do      i=1  for N                 /*ช*multiply matrix  P and A  โโโบ PA */
do   j=1  for N
do k=1  for N;      pa.i.j=  (pa.i.j   +   p.i.k * a.k.j)    /    1
end   /*ช*k*/
end     /*ช*j*/                   /*ช*รท by one does normalization [โ]. */
end        /*ช*i*/;        return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
showMat: parse arg mat,rows,cols;   say;   rows= word(rows N,1);   cols= word(cols rows,1)
w= 0;    do    r=1  for rows
do c=1  for cols;     w= max(w,  length( value( mat'.'r"."c ) ) )
end  /*ช*c*/
end     /*ช*r*/
say center(mat  'matrix',  cols * (w + 1) + 7,  "โ")      /*ช*display the header.*/
do    r=1  for rows;     newV2=
do c=1  for cols;     newV2= newV2 right( value(mat'.'r"."c),   w + 1)
end   /*ช*c*/
say newV2
end      /*ช*r*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\LU-decomposition\lu-decomposition.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
