/*ͺ*REXX program displays (or writes to a file)   Pascal's triangle  (centered/formatted).*/
numeric digits 3000                              /*ͺ*be able to handle gihugeic triangles.*/
parse arg nn .                                   /*ͺ*obtain the optional argument from CL.*/
if nn=='' | nn==","  then nn= 10                 /*ͺ*Not specified?  Then use the default.*/
n= abs(nn)                                       /*ͺ*N  is the number of rows in triangle.*/
w= length( newV4(n-1)  %  newV4(n%2)  %  newV4(n - 1 - n%2)) /*ͺ*W:  the width of biggest integer.    */
ww= (n-1) * (W + 1)   +   1                      /*ͺ*WW:  "    "    " triangle's last row.*/
newV1.= 1;      newV2.= newV1.;          unity= right(1, w)  /*ͺ*defaults rows & lines; aligned unity.*/
/*ͺ* [β]  build rows of Pascals' triangle*/
do    r=1  for n;              rm= r-1   /*ͺ*Note:  the first column is always  1.*/
do c=2  to rm;              cm= c-1   /*ͺ*build the rest of the columns in row.*/
newV1.r.c= newV1.rm.cm  +  newV1.rm.c             /*ͺ*assign value to a specific row & col.*/
newV2.r  = newV2.r   right(newV1.r.c, w)          /*ͺ*and construct a line for output (row)*/
end   /*ͺ*c*/                           /*ͺ* [β]    C  is the column being built.*/
if r\==1  then newV2.r= newV2.r  unity           /*ͺ*for  rowsβ₯2,  append a trailing  "1".*/
end      /*ͺ*r*/                           /*ͺ* [β]    R  is the  row   being built.*/
/*ͺ* [β]  WIDTH: for nicely looking line.*/
do r=1  for n;     newV3= center(newV2.r, ww)      /*ͺ*center this particular Pascals' row. */
if nn>0  then say                       newV3  /*ͺ*SAY    if   NN    is positive,  else */
else call lineout 'PASCALS.'n, newV3  /*ͺ*write this Pascal's row ββββΊ  a file.*/
end   /*ͺ*r*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV4: procedure; newV4=1;  do j=2  to arg(1); newV4= newV4*j; end /*ͺ*j*/;  return newV4  /*ͺ*compute factorial*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pascals-triangle\pascals-triangle.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
