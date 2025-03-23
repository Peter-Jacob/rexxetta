/*�*REXX program  generates and displays  three forms  of an   NxN   Pascal matrix.       */
numeric digits 50                                /*�*be able to calculate huge factorials.*/
parse arg N .                                    /*�*obtain the optional matrix  size (N).*/
if N==''  | N==","  then N= 5                    /*�*Not specified?  Then use the default.*/
call show N, Pmat(N, 'upper'), 'Pascal upper triangular matrix'
call show N, Pmat(N, 'lower'), 'Pascal lower triangular matrix'
call show N, Pmat(N, 'sym')  , 'Pascal symmetric matrix'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Pmat: procedure; parse arg N;    newV1=              /*�*generate a format of a Pascal matrix.*/
arg , ?                                    /*�*get uppercase version of the 2nd arg.*/
do i=0  for N; do j=0  for N       /*�*pick a format to use  [↓]            */
if abbrev('UPPER'      , ?, 1)  then newV1= newV1 comb(j  , i)
if abbrev('LOWER'      , ?, 1)  then newV1= newV1 comb(i  , j)
if abbrev('SYMMETRICAL', ?, 1)  then newV1= newV1 comb(i+j, j)
end  /*�*j*/         /*�*       ↑                              */
end   /*�*i*/                       /*�*       │                              */
return newV1                                  /*�*       └──min. abbreviation is 1 char.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV2:    procedure; parse arg x;  newV2=1;    do j=2  to x;    newV2= newV2 * j;    end;      return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb: procedure; parse arg x,y;        if x=y  then return 1                /*�* {=} case.*/
if y>x  then return 0                /*�* {>} case.*/
if x-y<y  then y=x-y; newV3= 1;      do j=x-y+1  to x;  newV3= newV3 * j;  end;  return newV3 / newV2(y)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: procedure; parse arg s,newV4;   w=0;    newV5=0                               /*�*get args. */
do x=1  for s**2;  w=max(w,1+length(word(newV4,x)));  end
say;   say center( arg(3), 50, '─')                                   /*�*show title*/
do   r=1  for s;   if r==1  then newV1= '[['             /*�*row  1    */
else newV1= ' ['             /*�*rows 2   N*/
do c=1  for s;  newV5= newV5 + 1;     e= (c==s)           /*�*e ����ֲ "end".*/
newV1=newV1 || right( word(newV4, newV5), w) || left(', ',\e) || left("]", e)
end   /*�*c*/                                       /*�* [↑]  row.*/
say newV1 || left(',', r\==s)left(']', r==s)             /*�*show row. */
end     /*�*r*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pascal-matrix-generation\pascal-matrix-generation-2.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
