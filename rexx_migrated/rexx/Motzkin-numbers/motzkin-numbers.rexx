/*ͺ*REXX program to display the first  N  Motzkin numbers,  and if that number is prime.  */
numeric digits 92                                /*ͺ*max number of decimal digits for task*/
parse arg n .                                    /*ͺ*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 42                    /*ͺ*Not specified?  Then use the default.*/
w= length(n) + 1;  wm= digits()%4                /*ͺ*define maximum widths for two columns*/
say center('n', w     )   center("Motzkin[n]", wm)       center(' primality', 11)
say center('' , w, "β")   center(''          , wm, "β")  center('',           11, "β")
newV1.= 1                                            /*ͺ*define default vale for the @. array.*/
do m=0  for n                              /*ͺ*step through indices for Motzkin #'s.*/
if m>1  then newV1.m= (@(m-1)*(m+m+1) + @(m-2)*(m*3-3))%(m+2)  /*ͺ*calculate a Motzkin #*/
call show                                  /*ͺ*display a Motzkin number βββΊ terminal*/
end   /*ͺ*m*/

say center('' , w, "β")   center(''          , wm, "β")  center('',           11, "β")
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@:      parse arg i;          return newV1.i         /*ͺ*return function expression based on I*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end; return newV2
prime:  if isPrime(newV1.m)  then return "   prime";                                 return ''
show:   y= commas(newV1.m);  say right(m, w)  right(y, max(wm, length(y)))  prime(); return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: procedure expose pnewV2. p#. pnewV3.;  parse arg x     /*ͺ*persistent PΒ·Β· REXX variables.*/
if symbol('P?.#')\=='VAR'  then         /*ͺ*1st time here?   Then define primes. */
do                                    /*ͺ*L is a list of some low primes < 100.*/
L= 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101
pnewV2.=0                                 /*ͺ* [β]  define P_index,  P,  P squared.*/
do i=1  for words(L);   newV3= word(L,i);   pnewV2.newV3= 1;   p#.i= newV3;   pnewV3.i= newV3*newV3
end   /*ͺ*i*/;                   pnewV2.0= x2d(3632c8eb5af3b) /*ͺ*bypass big Γ·*/
pnewV2.n= newV3 + 4                           /*ͺ*define next prime after last prime.  */
pnewV2.#= i - 1                           /*ͺ*define the number of primes found.   */
end                                   /*ͺ* p?.  p#.  p_   must be unique.      */
if x<pnewV2.n  then return pnewV2.x             /*ͺ*special case, handle some low primes.*/
if x==pnewV2.0 then return 1                /*ͺ*save a number of primality divisions.*/
parse var  x   ''   -1   newV3              /*ͺ*obtain rightβmost decimal digit of X.*/
if    newV3==5  then return 0;  if x//2 ==0  then return 0   /*ͺ*X Γ· by 5?  X Γ· by 2?*/
if x//3==0  then return 0;  if x//7 ==0  then return 0   /*ͺ*" "  " 3?  " "  " 7?*/
/*ͺ*weed numbers that're β₯ 11 multiples. */
do j=5  to pnewV2.#  while pnewV3.j<=x;  if x//p#.j ==0  then return 0
end   /*ͺ*j*/
/*ͺ*weed numbers that're>high multiple Ps*/
do k=pnewV2.n  by 6  while k*k<=x;   if x//k    ==0  then return 0
if x//(k+2)==0  then return 0
end   /*ͺ*k*/;           return 1       /*ͺ*Passed all divisions?   It's a prime.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Motzkin-numbers\motzkin-numbers.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
