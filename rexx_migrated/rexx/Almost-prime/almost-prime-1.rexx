/*�*REXX program  computes and displays  the  first  N  K─almost  primes  from   1 ──► K. */
parse arg N K .                                  /*�*get optional arguments from the C.L. */
if N=='' | N==","  then N=10                     /*�*N  not specified?   Then use default.*/
if K=='' | K==","  then K= 5                     /*�*K   "      "          "   "     "    */
/*�*W: is the width of K, used for output*/
do m=1  for  K;     newV1=2**m;  fir=newV1           /*�*generate & assign 1st K─almost prime.*/
newV2=1;                if newV2==N  then leave      /*�*#: K─almost primes; Enough are found?*/
newV2=2;                newV1=newV1  3*(2**(m-1))        /*�*generate & append 2nd K─almost prime.*/
if newV2==N  then leave                          /*�*#: K─almost primes; Enough are found?*/
if m==1  then newV3=fir + fir                    /*�* [↓]  gen & append 3rd K─almost prime*/
else do;  newV3=9 * (2**(m-2));    newV2=3;    newV1=newV1  newV3;    end
do j=newV3 + m - 1   until newV2==N              /*�*process an  K─almost prime  N  times.*/
if factr()\==m  then iterate             /*�*not the correct  K─almost  prime?    */
newV2=newV2 + 1;         newV1=newV1 j                   /*�*bump K─almost counter; append it to $*/
end   /*�*j*/                              /*�* [↑]   generate  N  K─almost  primes.*/
say right(m, length(K))"─almost ("N') primes:'     newV1
end       /*�*m*/                              /*�* [↑]  display a line for each K─prime*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
factr: z=j;                    do f=0  while z// 2==0;  z=z% 2;  end  /*�*divisible by  2.*/
do f=f  while z// 3==0;  z=z% 3;  end  /*�*divisible  "  3.*/
do f=f  while z// 5==0;  z=z% 5;  end  /*�*divisible  "  5.*/
do f=f  while z// 7==0;  z=z% 7;  end  /*�*divisible  "  7.*/
do f=f  while z//11==0;  z=z%11;  end  /*�*divisible  " 11.*/
do f=f  while z//13==0;  z=z%13;  end  /*�*divisible  " 13.*/
do p=17  by 6  while  p<=z              /*�*insure  P  isn't divisible by three. */
parse var  p   ''  -1  newV3                /*�*obtain the right─most decimal digit. */
/*�* [↓]  fast check for divisible by 5. */
if newV3\==5  then do; do f=f+1  while z//p==0; z=z%p; end;  f=f-1; end  /*�*÷ by P? */
if newV3 ==3  then iterate                  /*�*fast check for  X  divisible by five.*/
x=p+2;             do f=f+1  while z//x==0; z=z%x; end;  f=f-1       /*�*÷ by X? */
end   /*�*i*/                             /*�* [↑]  find all the factors in  Z.    */

if f==0  then return 1                    /*�*if  prime (f==0),  then return unity.*/
return f                    /*�*return to invoker the number of divs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Almost-prime\almost-prime-1.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
