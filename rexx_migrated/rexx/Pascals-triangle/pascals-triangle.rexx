/*�*REXX program displays (or writes to a file)   Pascal's triangle  (centered/formatted).*/
numeric digits 3000                              /*�*be able to handle gihugeic triangles.*/
parse arg nn .                                   /*�*obtain the optional argument from CL.*/
if nn=='' | nn==","  then nn= 10                 /*�*Not specified?  Then use the default.*/
n= abs(nn)                                       /*�*N  is the number of rows in triangle.*/
w= length( newV4(n-1)  %  newV4(n%2)  %  newV4(n - 1 - n%2)) /*�*W:  the width of biggest integer.    */
ww= (n-1) * (W + 1)   +   1                      /*�*WW:  "    "    " triangle's last row.*/
newV1.= 1;      newV2.= newV1.;          unity= right(1, w)  /*�*defaults rows & lines; aligned unity.*/
/*�* [↓]  build rows of Pascals' triangle*/
do    r=1  for n;              rm= r-1   /*�*Note:  the first column is always  1.*/
do c=2  to rm;              cm= c-1   /*�*build the rest of the columns in row.*/
newV1.r.c= newV1.rm.cm  +  newV1.rm.c             /*�*assign value to a specific row & col.*/
newV2.r  = newV2.r   right(newV1.r.c, w)          /*�*and construct a line for output (row)*/
end   /*�*c*/                           /*�* [↑]    C  is the column being built.*/
if r\==1  then newV2.r= newV2.r  unity           /*�*for  rows≥2,  append a trailing  "1".*/
end      /*�*r*/                           /*�* [↑]    R  is the  row   being built.*/
/*�* [↑]  WIDTH: for nicely looking line.*/
do r=1  for n;     newV3= center(newV2.r, ww)      /*�*center this particular Pascals' row. */
if nn>0  then say                       newV3  /*�*SAY    if   NN    is positive,  else */
else call lineout 'PASCALS.'n, newV3  /*�*write this Pascal's row ───►  a file.*/
end   /*�*r*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV4: procedure; newV4=1;  do j=2  to arg(1); newV4= newV4*j; end /*�*j*/;  return newV4  /*�*compute factorial*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pascals-triangle\pascals-triangle.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
