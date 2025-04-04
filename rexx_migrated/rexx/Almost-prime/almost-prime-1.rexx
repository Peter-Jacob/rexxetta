/*ͺ*REXX program  computes and displays  the  first  N  Kβalmost  primes  from   1 βββΊ K. */
parse arg N K .                                  /*ͺ*get optional arguments from the C.L. */
if N=='' | N==","  then N=10                     /*ͺ*N  not specified?   Then use default.*/
if K=='' | K==","  then K= 5                     /*ͺ*K   "      "          "   "     "    */
/*ͺ*W: is the width of K, used for output*/
do m=1  for  K;     newV1=2**m;  fir=newV1           /*ͺ*generate & assign 1st Kβalmost prime.*/
newV2=1;                if newV2==N  then leave      /*ͺ*#: Kβalmost primes; Enough are found?*/
newV2=2;                newV1=newV1  3*(2**(m-1))        /*ͺ*generate & append 2nd Kβalmost prime.*/
if newV2==N  then leave                          /*ͺ*#: Kβalmost primes; Enough are found?*/
if m==1  then newV3=fir + fir                    /*ͺ* [β]  gen & append 3rd Kβalmost prime*/
else do;  newV3=9 * (2**(m-2));    newV2=3;    newV1=newV1  newV3;    end
do j=newV3 + m - 1   until newV2==N              /*ͺ*process an  Kβalmost prime  N  times.*/
if factr()\==m  then iterate             /*ͺ*not the correct  Kβalmost  prime?    */
newV2=newV2 + 1;         newV1=newV1 j                   /*ͺ*bump Kβalmost counter; append it to $*/
end   /*ͺ*j*/                              /*ͺ* [β]   generate  N  Kβalmost  primes.*/
say right(m, length(K))"βalmost ("N') primes:'     newV1
end       /*ͺ*m*/                              /*ͺ* [β]  display a line for each Kβprime*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
factr: z=j;                    do f=0  while z// 2==0;  z=z% 2;  end  /*ͺ*divisible by  2.*/
do f=f  while z// 3==0;  z=z% 3;  end  /*ͺ*divisible  "  3.*/
do f=f  while z// 5==0;  z=z% 5;  end  /*ͺ*divisible  "  5.*/
do f=f  while z// 7==0;  z=z% 7;  end  /*ͺ*divisible  "  7.*/
do f=f  while z//11==0;  z=z%11;  end  /*ͺ*divisible  " 11.*/
do f=f  while z//13==0;  z=z%13;  end  /*ͺ*divisible  " 13.*/
do p=17  by 6  while  p<=z              /*ͺ*insure  P  isn't divisible by three. */
parse var  p   ''  -1  newV3                /*ͺ*obtain the rightβmost decimal digit. */
/*ͺ* [β]  fast check for divisible by 5. */
if newV3\==5  then do; do f=f+1  while z//p==0; z=z%p; end;  f=f-1; end  /*ͺ*Γ· by P? */
if newV3 ==3  then iterate                  /*ͺ*fast check for  X  divisible by five.*/
x=p+2;             do f=f+1  while z//x==0; z=z%x; end;  f=f-1       /*ͺ*Γ· by X? */
end   /*ͺ*i*/                             /*ͺ* [β]  find all the factors in  Z.    */

if f==0  then return 1                    /*ͺ*if  prime (f==0),  then return unity.*/
return f                    /*ͺ*return to invoker the number of divs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Almost-prime\almost-prime-1.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
