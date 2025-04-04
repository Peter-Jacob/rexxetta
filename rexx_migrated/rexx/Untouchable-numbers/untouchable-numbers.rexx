/*ͺ*REXX pgm finds N untouchable numbers (numbers that can't be equal to any aliquot sum).*/
parse arg n cols tens over .                     /*ͺ*obtain optional arguments from the CL*/
if    n='' |    n==","            then    n=2000 /*ͺ*Not specified?  Then use the default.*/
if cols='' | cols=="," | cols==0  then cols=  10 /*ͺ* "       "        "   "   "      "   */
if tens='' | tens==","            then tens=   0 /*ͺ* "       "        "   "   "      "   */
if over='' | over==","            then over=  20 /*ͺ* "       "        "   "   "      "   */
tell= n>0;                             n= abs(n) /*ͺ*N>0?  Then display the untouchable #s*/
call genP  n * over                              /*ͺ*call routine to generate some primes.*/
u.= 0                                            /*ͺ*define all possible aliquot sums β‘ 0.*/
do p=1  for newV6;   newV3= newV1.p + 1;   u.newV3= 1  /*ͺ*any prime+1  is  not  an untouchable.*/
newV3= newV1.p + 3;   u.newV3= 1  /*ͺ* "  prime+3   "   "    "      "      */
end   /*ͺ*p*/                            /*ͺ* [β]  this will also rule out  5.    */
u.5= 0                                           /*ͺ*special case as prime 2 + 3 sum to 5.*/
do j=2  for lim;  if newV2.j  then iterate /*ͺ*Is  J  a prime?   Yes, then skip it. */
y= sigmaP()                            /*ͺ*compute:  aliquot sum (sigma P) of J.*/
if y<=n  then u.y= 1                   /*ͺ*mark  Y  as a touchable if in range. */
end  /*ͺ*j*/
call show                                        /*ͺ*maybe show untouchable #s and a count*/
if tens>0  then call powers                      /*ͺ*Any "tens" specified?  Calculate 'em.*/
exit cnt                                         /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
genSq:    do newV3=1  until newV3*newV3>lim;  q.newV3= newV3*newV3;  end;  q.newV3= newV3*newV3;  newV3= newV3+1;  q.newV3= newV3*newV3;  return
grid:   newV5= newV5 right( commas(t), w);  if cnt//cols==0  then do;  say newV5;  newV5=;  end;  return
powers:   do pr=1  for tens;   call 'UNTOUCHA' -(10**pr);   end  /*ͺ*recurse*/;     return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV6= 9;  newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6=13; newV1.7=17; newV1.8=19; newV1.9=23 /*ͺ*a list*/
newV2.=0;  newV2.2=1; newV2.3=1; newV2.5=1; newV2.7=1; newV2.11=1; newV2.13=1; newV2.17=1; newV2.19=1  newV2.23=1 /*ͺ*primes*/
parse arg lim;   call genSq                /*ͺ*define the (high) limit for searching*/
qq.10= 100  /*ͺ*define square of the 10th prime index*/
do j=newV1.newV6+6  by 2  to lim                 /*ͺ*find odd primes from here on forward.*/
parse var  j    ''  -1  newV3;   if     newV3==5  then iterate;  if j// 3==0  then iterate
if j// 7==0  then iterate;   if j//11==0  then iterate;  if j//13==0  then iterate
if j//17==0  then iterate;   if j//19==0  then iterate;  if j//23==0  then iterate
/*ͺ*start dividing by the tenth prime: 29*/
do k=10  while qq.k <= j       /*ͺ* [β]  divide  J  by known odd primes.*/
if j//newV1.k==0  then iterate j   /*ͺ*J Γ· by a prime?  Then Β¬prime.   ___  */
end   /*ͺ*k*/                    /*ͺ* [β]  only process numbers  βξεχΦ΅  β J   */
newV6= newV6+1;                     newV1.newV6= j       /*ͺ*bump prime count; assign a new prime.*/
newV2.j= 1;                    qq.newV6= j*j     /*ͺ*mark prime;  compute square of prime.*/
end             /*ͺ*j*/;        return     /*ͺ*#:  is the number of primes generated*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: w=7; newV5= right(2, w+1)  right(5, w)         /*ͺ*start the list of an even prime and 5*/
cnt= 2              /*ͺ*count of the only two primes in list.*/
do t=6  by 2  to n;  if u.t then iterate /*ͺ*Is  T  touchable?    Then skip it.   */
cnt= cnt + 1;     if tell then call grid /*ͺ*bump count;  maybe show a grid line. */
end   /*ͺ*t*/
if tell & newV5\==''  then say newV5 /*ͺ*display a residual grid line, if any.*/
if tell           then say   /*ͺ*show a spacing blank line for output.*/
if n>0  then say right( commas(cnt), 20)  ,             /*ͺ*indent the output a bit.*/
' untouchable numbers were found  βξεχΦ΅ '    commas(n);            return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sigmaP: s= 1                                     /*ͺ*set initial sigma sum (S) to 1.   ___*/
if j//2  then do m=3  by 2  while q.m<j  /*ͺ*divide by odd integers up to the β J */
if j//m==0  then s=s+m+j%m /*ͺ*add the two divisors to the sum.     */
end   /*ͺ*m*/                /*ͺ* [β]  process an odd integer.     ___*/
else do m=2        while q.m<j  /*ͺ*divide by all integers up to the β J */
if j//m==0  then s=s+m+j%m /*ͺ*add the two divisors to the sum.     */
end   /*ͺ*m*/                /*ͺ* [β]  process an even integer.    ___*/
if q.m==j  then return s + m             /*ͺ*Was  J  a square?   If so, add   β J */
return s                 /*ͺ*                    No, just return. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Untouchable-numbers\untouchable-numbers.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
