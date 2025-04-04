/*ͺ*REXX pgm demonstrates Benford's law applied to 2 common functions (30 dec. digs used).*/
numeric digits length( e() )  -  length(.)       /*ͺ*width of (e)  for LN & LOG precision.*/
parse arg N .;  if N=='' | N==","  then N= 1000  /*ͺ*allow sample size to be specified.   */
pad= "   "                                       /*ͺ*W1, W2: # digs past the decimal point*/
w1= max(2 + length('observed'), length(N-2) )    /*ͺ*for aligning output for a number.    */
w2= max(2 + length('expected'), length(N  ) )    /*ͺ* "      "    frequency distributions.*/
LN10= ln(10)                                     /*ͺ*calculate the  ln(10)   {used by LOG}*/
call coef                                        /*ͺ*generate nine frequency coefficients.*/
call fib                                         /*ͺ*generate   N   Fibonacci numbers.    */
call show "Benford's law applied to"      N      'Fibonacci numbers'
call fact                                        /*ͺ*generate   N   factorials.           */
call show "Benford's law applied to"      N      'factorial products'
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
coef:       do j=1  for 9; newV1.j=pad center(format(log(1+1/j),,length(N)+2),w2); end; return
fact: newV2.=1; do j=2  for N-1;       a= j-1;                   newV2.j= newV2.a * j;     end; return
fib:  newV2.=1; do j=3  for N-2;       a= j-1;       b= a-1;     newV2.j= newV2.a + newV2.b;   end; return
e:    return 2.71828182845904523536028747135266249775724709369995957496696762772407663035
log:  return   ln( arg(1) )    /   LN10
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ln: procedure; parse arg x; e= e();  newV4= e;  ig= (x>1.5);  is= 1 - 2 * (ig\=1); i= 0;  s= x
do while ig&s>1.5  |  \ig&s<.5             /*ͺ*nittyβgritty part of  LN  calculation*/
do k=-1; iz=s*newV4**-is; if k>=0&(ig&iz<1|\ig&iz>.5)  then leave; newV4=newV4*newV4; izz=iz;  end
s=izz;  i= i + is* 2**k; end  /*ͺ*while*/;    x= x * e** - i - 1;  z= 0;  newV4= -1;  p= z
do k=1;  newV4= -newV4 * x; z= z + newV4/k; if z=p  then leave;  p= z;  end /*ͺ*k*/;  return z+i
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: say;  say pad   ' digit '    pad   center("observed",w1)  pad  center('expected',w2)
say pad  'βββββββ'   pad   center("", w1, 'β')  pad  center("",w2,'β')   pad  arg(1)
newV3.=0;     do j=1  for N;   newV4= left(newV2.j, 1);     newV3.newV4= newV3.newV4 + 1  /*ͺ*get the 1st digit.*/
end   /*ͺ*j*/
do f=1  for 9;  say pad center(f,7) pad center(format(newV3.f/N,,length(N-2)),w1)  newV1.f
end   /*ͺ*k*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Benfords-law\benfords-law.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
