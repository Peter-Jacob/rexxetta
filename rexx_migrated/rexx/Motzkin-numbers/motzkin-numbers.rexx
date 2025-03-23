/*�*REXX program to display the first  N  Motzkin numbers,  and if that number is prime.  */
numeric digits 92                                /*�*max number of decimal digits for task*/
parse arg n .                                    /*�*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 42                    /*�*Not specified?  Then use the default.*/
w= length(n) + 1;  wm= digits()%4                /*�*define maximum widths for two columns*/
say center('n', w     )   center("Motzkin[n]", wm)       center(' primality', 11)
say center('' , w, "─")   center(''          , wm, "─")  center('',           11, "─")
newV1.= 1                                            /*�*define default vale for the @. array.*/
do m=0  for n                              /*�*step through indices for Motzkin #'s.*/
if m>1  then newV1.m= (@(m-1)*(m+m+1) + @(m-2)*(m*3-3))%(m+2)  /*�*calculate a Motzkin #*/
call show                                  /*�*display a Motzkin number ──► terminal*/
end   /*�*m*/

say center('' , w, "─")   center(''          , wm, "─")  center('',           11, "─")
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:      parse arg i;          return newV1.i         /*�*return function expression based on I*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end; return newV2
prime:  if isPrime(newV1.m)  then return "   prime";                                 return ''
show:   y= commas(newV1.m);  say right(m, w)  right(y, max(wm, length(y)))  prime(); return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPrime: procedure expose pnewV2. p#. pnewV3.;  parse arg x     /*�*persistent P·· REXX variables.*/
if symbol('P?.#')\=='VAR'  then         /*�*1st time here?   Then define primes. */
do                                    /*�*L is a list of some low primes < 100.*/
L= 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101
pnewV2.=0                                 /*�* [↓]  define P_index,  P,  P squared.*/
do i=1  for words(L);   newV3= word(L,i);   pnewV2.newV3= 1;   p#.i= newV3;   pnewV3.i= newV3*newV3
end   /*�*i*/;                   pnewV2.0= x2d(3632c8eb5af3b) /*�*bypass big ÷*/
pnewV2.n= newV3 + 4                           /*�*define next prime after last prime.  */
pnewV2.#= i - 1                           /*�*define the number of primes found.   */
end                                   /*�* p?.  p#.  p_   must be unique.      */
if x<pnewV2.n  then return pnewV2.x             /*�*special case, handle some low primes.*/
if x==pnewV2.0 then return 1                /*�*save a number of primality divisions.*/
parse var  x   ''   -1   newV3              /*�*obtain right─most decimal digit of X.*/
if    newV3==5  then return 0;  if x//2 ==0  then return 0   /*�*X ÷ by 5?  X ÷ by 2?*/
if x//3==0  then return 0;  if x//7 ==0  then return 0   /*�*" "  " 3?  " "  " 7?*/
/*�*weed numbers that're ≥ 11 multiples. */
do j=5  to pnewV2.#  while pnewV3.j<=x;  if x//p#.j ==0  then return 0
end   /*�*j*/
/*�*weed numbers that're>high multiple Ps*/
do k=pnewV2.n  by 6  while k*k<=x;   if x//k    ==0  then return 0
if x//(k+2)==0  then return 0
end   /*�*k*/;           return 1       /*�*Passed all divisions?   It's a prime.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Motzkin-numbers\motzkin-numbers.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
