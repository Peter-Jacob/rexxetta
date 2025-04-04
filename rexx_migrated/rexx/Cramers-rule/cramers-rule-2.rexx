/*ͺ*REXX program uses Cramer's rule to find and display solution of given linear equations*/
values=     '-3 -32 -47 49'                      /*ͺ*values of each matrix row of numbers.*/
variables= substr('abcdefghijklmnopqrstuvwxyz', 27 - words(values) )   /*ͺ*variable names.*/
call makeM  ' 2  -1   5  1        3   2   2  -6        1   3   3  -1        5  -2  -3   3'
do   y=1  for sz;  newV3=              /*ͺ*display the matrix (linear equations)*/
do x=1  for sz;  newV3= newV3 right(psign(newV2.x.y), w)'*'substr(variables, x, 1)
end   /*ͺ*y*/                      /*ͺ* [β]   rightβjustify matrix elements.*/
pad= left('', length(newV3) - 2);    say newV3   ' = '   right( word(values, y), wv)
end     /*ͺ*x*/                      /*ͺ* [β]   obtain value of the equation. */
say; say
do     k=1  for sz                 /*ͺ*construct the nominator matrix.      */
do   j=1  for sz
do i=1  for sz;  if i==k  then newV1.i.j= word(values, j)
else newV1.i.j= newV2.i.j
end   /*ͺ*i*/
end     /*ͺ*j*/
say pad substr(variables,k,1) ' = ' right(det(makeL())/det(mat), digits()+2)
end       /*ͺ*k*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
makeL: newV3=; do x=1  for sz; do y=1  for sz; newV3= newV3 newV1.x.y; end; end; return newV3 /*ͺ*matrixββΊlist*/
mSize: arg newV4; do sz=0 for 1e3; if sz*sz==newV4 then return; end; say 'error,bad matrix';exit 9
psign: parse arg num;  if left(num, 1)\=='-'  &  x>1  then return "+"num;   return num
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
det: procedure;  parse arg a b c d 1 nums;        call mSize words(nums);    newV4= 0
if sz==2  then return a*d  -  b*c
do   j=1  for sz
do i=1  for sz;    newV4= newV4 + 1;      newV2.i.j= word(nums, newV4)
end   /*ͺ*i*/
end
aa= 0
do     i=1  for sz;  odd= i//2;     newV3=
do   j=2  for sz-1
do k=1  for sz;  if k\==i  then newV3= newV3  newV2.k.j
end   /*ͺ*k*/
end     /*ͺ*j*/
aa= aa   -   (-1 ** odd)  *  newV2.i.1  *  det(newV3)
end;      /*ͺ*i*/;                                               return aa
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
makeM: procedure expose newV2. values mat sz w wv;  parse arg mat;    call mSize words(mat)
newV5= 0;                     wv= 0;                           w= 0
do   j=1  for sz;  wv= max(wv, length( word( values, j) ) )
do k=1  for sz;  newV5= newV5+1;  newV2.k.j= word(mat, newV5);    w= max(w, length(newV2.k.j))
end   /*ͺ*k*/
end;    /*ͺ*j*/;     w= w + 1;                                   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cramers-rule\cramers-rule-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
