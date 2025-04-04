/*ͺ*REXX pgm performs Reduced Row Echelon Form (RREF), AKA row canonical form on a matrix)*/
cols= 0;  w= 0;   newV1. =0                          /*ͺ*max cols in a row; max width; matrix.*/
mat.=;                  mat.1=  '    1   2   -1      -4   '
mat.2=  '    2   3   -1     -11   '
mat.3=  '   -2   0   -3      22   '
do r=1  until mat.r=='';      newV2=mat.r  /*ͺ*build  @.row.col  from (matrix) mat.X*/
do c=1  until newV2='';       parse  var   newV2    newV1.r.c  newV2
w= max(w, length(newV1.r.c) + 1) /*ͺ*find the maximum width of an element.*/
end   /*ͺ*c*/
cols= max(cols, c)                     /*ͺ*save the maximum number of columns.  */
end   /*ͺ*r*/
rows= r-1                                        /*ͺ*adjust the row count (from DO loop). */
call showMat  'original matrix'                  /*ͺ*display the original matrixβββΊscreen.*/
newV3= 1                                             /*ͺ*set the working column pointer to  1.*/
/*ͺ* βββββββββββββββββββββββββββββββββββββββββββββ Reduced Row Echelon Form on matrix.*/
do r=1  for rows  while cols>newV3                 /*ͺ*begin to perform the heavy lifting.  */
j= r                                           /*ͺ*use a subsitute index for the DO loop*/
do  while  newV1.j.newV3==0;    j= j + 1
if j==rows  then do;    j= r;     newV3= newV3 + 1;    if cols==newV3  then leave r;     end
end      /*ͺ*while*/
/*ͺ* [β]  swap rows J,R (but not if same)*/
do newV2=1  for cols  while j\==r;    parse value   newV1.r.newV2  newV1.j.newV2    with    newV1.j.newV2  newV1.newV2.newV2
end      /*ͺ*_*/
newV4= newV1.r.newV3
do d=1  for cols  while newV4\=1;     newV1.r.d= newV1.r.d / newV4
end      /*ͺ*d*/                             /*ͺ* [β] divide row J by @.r.p ββunlessβξεχΦ³1*/
do k=1  for rows;             newV4= newV1.k.newV3 /*ͺ*subtract (row K)   @.r.s  from row K.*/
if k==r | newV4=0  then iterate            /*ͺ*skip  if  row K is the same as row R.*/
do s=1  for cols;          newV1.k.s= newV1.k.s   -   newV4 * newV1.r.s
end   /*ͺ*s*/
end      /*ͺ*k*/                         /*ͺ* [β]  for the rest of numbers in row.*/
newV3= newV3+1                                         /*ͺ*bump the working column pointer.     */
end          /*ͺ*r*/

call showMat  'matrix RREF'                      /*ͺ*display the reduced row echelon form.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showMat: parse arg title;          say;  say center(title, 3 + (cols+1) * w, 'β');    say
do      r=1  for rows;   newV2=
do c=1  for cols
if newV1.r.c==''  then do;   say "***error*** matrix element isn't defined:"
say 'row'    r",  column"    c'.';        exit 13
end
newV2= newV2  right(newV1.r.c, w)
end   /*ͺ*c*/
say newV2                                 /*ͺ*display a matrix row to the terminal.*/
end        /*ͺ*r*/;       return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Reduced-row-echelon-form\reduced-row-echelon-form.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
