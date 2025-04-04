/*ͺ*REXX program calculates  primes  via the  AgrawalβKayalβSaxena  (AKS)  primality test.*/
parse arg Z .                                    /*ͺ*obtain optional argument from the CL.*/
if Z=='' | Z=="," then Z= 200                    /*ͺ*Not specified?  Then use the default.*/
OZ=Z;               tell= Z<0;       Z= abs(Z)   /*ͺ*Is Z negative?  Then show expression.*/
numeric digits  max(9,  Z % 3)                   /*ͺ*define a dynamic # of decimal digits.*/
call AKS                                         /*ͺ*invoke the AKS funtion for coef. bld.*/
if left(OZ,1)=='+' then do; say Z isAksp(); exit /*ͺ*display if  Z  is  or isn't  a prime.*/
end                      /*ͺ* [β]  call isAKSp if Z has leading +.*/
say;    say "primes found:"   newV4                  /*ͺ*display the  prime number  list.     */
say;    if \datatype(newV4, 'W')  then exit          /*ͺ* [β]  the digit length of a big coef.*/
say 'Found '   words(newV4)   " primes and the largest coefficient has "   length(newV3.pm.h)  newV1
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
AKS: newV2.0= '-';      newV2.1= "+";           newV3. = 1   /*ͺ*$.x: sign char; default coefficients.*/
q.= 1;         q.1= 0;             q.4= 0   /*ͺ*sparse array for faster comparisons. */
newV4=;            L= length(Z)                 /*ͺ*define list of prime numbers (so far)*/
do p=3  for Z;      pm=p - 1;   pp=p + 1 /*ͺ*PM & PP: used as a coding convenience*/
do m=2  for pp % 2   - 1;   mm=m - 1 /*ͺ*calculate coefficients for a power.  */
newV3.p.m= newV3.pm.mm + newV3.pm.m;    h=pp - m /*ͺ*calculate left  side of  coefficients*/
newV3.p.h= newV3.p.m                         /*ͺ*    "     right   "   "       "      */
end   /*ͺ*m*/                          /*ͺ* [β]  The  M   DO  loop creates both */
end       /*ͺ*p*/                          /*ͺ*      sides in the same loop.        */
if tell  then say '(x-1)^'right(0, L)":  1" /*ͺ*possibly display the first expression*/
newV1= 'decimal digits.'                      /*ͺ* [β]  test for primality by division.*/
do n=2  for Z;     nh=n % 2;    d= n - 1 /*ͺ*create expressions;  find the primes.*/
do k=3  to nh  while newV3.n.k//d == 0   /*ͺ*are coefficients divisible by  N-1 ? */
end   /*ͺ*k*/                          /*ͺ* [β]  skip the 1st & 2nd coefficients*/
if k>nh   then if q.d  then newV4= newV4 d       /*ͺ*add a number to the prime list.      */
if \tell  then iterate                   /*ͺ*Don't tell?   Don't show expressions.*/
y= '(x-1)^'right(d, L)":"                /*ͺ*define the 1st part of the expression*/
s=1                                      /*ͺ*S:     is the sign indicator (-1β+1).*/
do j=n  for n-1  by -1               /*ͺ*create the higher powers first.      */
if j==2  then xp= 'x'                /*ͺ*if power=1, then don't show the power*/
else xp= 'x^' ||   j-1      /*ͺ*        Β·Β·Β· else show power with  ^  */
if j==n  then y=y  xp                /*ͺ*no sign (+β-) for the 1st expression.*/
else y=y  newV2.s || newV3.n.j'β'xp /*ͺ*build the expression with sign (+|-).*/
s= \s                                /*ͺ*flip the sign for the next expression*/
end   /*ͺ*j*/                          /*ͺ* [β]  the sign (now) is either 0 β 1,*/
say  y  newV2.s'1'                           /*ͺ*just show the first  N  expressions, */
end       /*ͺ*n*/                          /*ͺ* [β]  Β·Β·Β· but only for  negative  Z. */
if newV4==''  then newV4= "none";        return newV4   /*ͺ*if null, return "none"; else return #*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isAKSp: if z==word(newV4,words(newV4))  then return ' is a prime.';  else return " isn't a prime."
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\AKS-test-for-primes\aks-test-for-primes-2.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
