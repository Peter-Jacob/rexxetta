/*ͺ*REXX program  generates and displays  three forms of an   NxN   Pascal matrix.        */
numeric digits 50                                /*ͺ*be able to calculate huge factorials.*/
parse arg N .                                    /*ͺ*obtain the optional matrix size  (N).*/
if N==''  | N==","  then N= 5                    /*ͺ*Not specified?  Then use the default.*/
call show  N,  upp(N),  'Pascal upper triangular matrix'
call show  N,  low(N),  'Pascal lower triangular matrix'
call show  N,  sym(N),  'Pascal symmetric matrix'
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
upp:  procedure; parse arg N;  newV1=                /*ͺ*gen Pascal upper triangular matrix.  */
do i=0  for N;  do j=0  for N; newV1=newV1 comb(j,   i);   end; end;   return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
low:  procedure; parse arg N;  newV1=                /*ͺ*gen Pascal lower triangular matrix.  */
do i=0  for N;  do j=0  for N; newV1=newV1 comb(i,   j);   end; end;   return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sym:  procedure; parse arg N;  newV1=                /*ͺ*generate  Pascal symmetric  matrix.  */
do i=0  for N;  do j=0  for N; newV1=newV1 comb(i+j, i);   end; end;   return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2:    procedure; parse arg x;  newV2=1;    do j=2  to x;  newV2= newV2*j;  end;        return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
comb: procedure; parse arg x,y;        if x=y  then return 1                /*ͺ* {=} case.*/
if y>x  then return 0                /*ͺ* {>} case.*/
if x-y<y  then y= x-y;  newV3= 1;    do j=x-y+1  to x;  newV3= newV3*j;  end;    return newV3 / newV2(y)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: procedure; parse arg s,newV4;   w=0;    newV5=0                               /*ͺ*get args. */
do x=1  for s**2;  w= max(w, 1 + length( word(newV4,x) ) );    end
say;   say center( arg(3), 50, 'β')                                   /*ͺ*show title*/
do    r=1  for s;  if r==1  then newV1= '[['             /*ͺ*row  1    */
else newV1= ' ['             /*ͺ*rows 2   N*/
do c=1  for s;  newV5= newV5+1;   e= (c==s)               /*ͺ*e βξεχΦ² "end".*/
newV1=newV1 || right( word(newV4, newV5), w) || left(',', \e) || left("]", e)
end   /*ͺ*c*/                                       /*ͺ* [β]  row.*/
say newV1 || left(',', r\==s)left("]", r==s)             /*ͺ*show row. */
end     /*ͺ*r*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pascal-matrix-generation\pascal-matrix-generation-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
