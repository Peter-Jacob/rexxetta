/*ͺ*REXX program demonstrates how to use a  generator  (also known as an  iterator).      */
parse arg N .;   if N=='' |  N==","  then N=20   /*ͺ*N  not specified?   Then use default.*/
newV1.=                                              /*ͺ* [β]  calculate squares,cubes,pureSq.*/
do i=1  for N;   call Gsquare     i
call Gcube       i
call GpureSquare i     /*ͺ*these are  cubeβfree  square numbers.*/
end   /*ͺ*i*/

do k=1  for N;  newV1.pureSquare.k=;  end /*ͺ*k*/ /*ͺ*this is used to drop  1st  N  values.*/

w=length(N+10);               ps= 'pure square'  /*ͺ*the width of the numbers;  a literal.*/

do m=N+1  for 10;    say ps   right(m, w)":"     right(GpureSquare(m), 3*w)
end       /*ͺ*m*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Gpower:      procedure expose newV1.;       parse arg x,p;   q=newV1.pow.x.p
if q\==''  then return q;  newV2=x**p;          newV1.pow.x.p=newV2
return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Gsquare:     procedure expose newV1.;       parse arg x;     q=newV1.square.x
if q==''  then newV1.square.x=Gpower(x, 2)
return newV1.square.x
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Gcube:       procedure expose newV1.;       parse arg x;     q=newV1.cube.x
if q==''  then newV1.cube.x=Gpower(x, 3)        newV2=newV1.cube.x;     newV1.3pow.newV2=1
return newV1.cube.x
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
GpureSquare: procedure expose newV1.;       parse arg x;     q=newV1.pureSquare.x
if q\==''  then return q
newV3=0
do j=1  until newV3==x;  newV4=Gpower(j, 2)        /*ͺ*search for pure square. */
if newV1.3pow.newV4==1  then iterate               /*ͺ*is it a power of three? */
newV3=newV3+1;               newV1.pureSquare.newV3=newV4      /*ͺ*assign next pureSquare. */
end   /*ͺ*j*/
return newV1.pureSquare.x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generator-Exponential\generator-exponential.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
