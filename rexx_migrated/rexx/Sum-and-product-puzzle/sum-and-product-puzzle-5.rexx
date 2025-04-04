/*ͺ*REXX program solves the  Sum and Product Puzzle (also known as the Impossible Puzzle).*/
newV1.= 0;                        h= 100;  newV1.3= 1    /*ͺ*assign array default;  assign high P.*/
do j=5  by 2  to h                  /*ͺ*find all odd primes  βξεχΦ²  1st argument.*/
do k=3  while k*k<=j;   if j//k==0  then iterate j          /*ͺ*J Γ· by K ? */
end  /*ͺ*k*/;             newV1.j= 1    /*ͺ*found a net prime number: J          */
end    /*ͺ*j*/
newV1.2=1                                            /*ͺ*assign the even prime, ex post facto.*/
do s=2  for h-1;  if C1(s)==0  then iterate /*ͺ*find and display the puzzle solution.*/
newV2= 0;                do m=2  for  s%2 -1    /*ͺ* [β]  check for uniqueness of product*/
if C2(m * (s-m))  then do;  if newV2>0  then iterate s;  newV2= m;   end
end   /*ͺ*m*/
if newV2>0  then say  'The numbers are:  '         newV2            " and "           s-newV2
end   /*ͺ*s*/
if newV2==0  then     say  'No solution found.'
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
C1: procedure expose newV1.;        parse arg s      /*ͺ*validate the first puzzle condition. */
do a=2  for s%2-1;        if newV1.a  then do;   newV3= s - a;   if newV1.newV3  then return 0;  end
end;  /*ͺ*a*/;              return 1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
C2: procedure expose newV1. h;  parse arg p;    newV2= 0 /*ͺ*validate the second puzzle condition.*/
do j=2  while j*j<p                        /*ͺ*perform up to the square root of  P. */
if p//j==0  then do;               q= p % j
if q>=2  then  if q<=h  then  if C1(j+q)  then  if newV2  then return 0
else newV2= 1
end
end   /*ͺ*j*/;              return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-and-product-puzzle\sum-and-product-puzzle-5.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
