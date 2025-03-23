/*�*REXX program to solve Pell's equation for the smallest solution of positive integers. */
numeric digits 2200                              /*�*ensure enough decimal digs for answer*/
parse arg newV1                                      /*�*obtain optional arguments from the CL*/
if newV1=='' | newV1==","  then newV1= 61 109 181 277        /*�*Not specified?  Then use the defaults*/
d= 28                                            /*�*used for aligning the output numbers.*/
do j=1  for words(newV1);    newV2= word(newV1, j)    /*�*process all the numbers in the list. */
parse value   pells(newV2)   with   x  y      /*�*extract the two values of  X  and  Y.*/
cx= comma(x);       Lcx= length(cx);           cy=  comma(y);       Lcy= length(cy)
say 'x^2 -'right(newV2, max(4, length(newV2)))    "* y^2 == 1" ,
' when x='right(cx, max(d, Lcx))     "  and y="right(cy, max(d, Lcy))
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comma: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3= insert(',', newV3, jc); end;  return newV3
floor: procedure; parse arg x;  newV4= x % 1;          return  newV4   -    (x < 0)   *   (x \= newV4)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
iSqrt: procedure; parse arg x;  r= 0;     q= 1;           do  while q<=x;  q= q * 4;   end
do  while q>1; q= q%4; newV4= x-r-q; r= r%2; if newV4>=0  then do; x= newV4; r= r+q; end; end
return r                                  /*�*R:  is the integer square root of X. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pells: procedure; parse arg n; x= iSqrt(n);  y=x /*�*obtain arg;  obtain integer sqrt of N*/
parse value  1 0   with   e1 e2  1  f2 f1 /*�*assign values for: E1, E2, and F2, F1*/
z= 1;        r= x + x
do  until ( (e2 + x*f2)**2  -  n*f2*f2)  ==  1
y= r*z  -  y;     z= floor( (n - y*y) / z)
r= floor( (x + y  ) / z)
parse value  e2   r*e2  +  e1     with     e1  e2
parse value  f2   r*f2  +  f1     with     f1  f2
end   /*�*until*/
return e2  +  x * f2     f2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pells-equation\pells-equation.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
