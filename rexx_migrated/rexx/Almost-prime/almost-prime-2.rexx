/*ͺ*REXX program  computes and displays  the first    N    Kβalmost primes from  1 βββΊ K. */
parse arg N K .                                  /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==','  then N=10                     /*ͺ*N  not specified?   Then use default.*/
if K=='' | K==','  then K= 5                     /*ͺ*K   "      "          "   "     "    */
nn=N;  N=abs(N);   w=length(K)                   /*ͺ*N positive? Then show Kβalmost primes*/
limit= (2**K) * N / 2                            /*ͺ*this is the limit for most K-primes. */
if N==1  then limit=limit * 2                    /*ͺ*  "   "  "    "    "  a    N    of 1.*/
if K==1  then limit=limit * 4                    /*ͺ*  "   "  "    "    "  a Kβprime  " 2.*/
if K==2  then limit=limit * 2                    /*ͺ*  "   "  "    "    "  "    "     " 4.*/
if K==3  then limit=limit * 3 % 2                /*ͺ*  "   "  "    "    "  "    "     " 8.*/
call genPrimes  limit + 1                        /*ͺ*generate primes up to the  LIMIT + 1.*/
say 'The highest prime computed: '        newV2.newV4        " (under the limit of " limit').'
say                                              /*ͺ* [β]  define where 1st Kβprime is odd*/
d.=0;  d.2=  2;  d.3 =  4;  d.4 =  7;  d.5 = 13;  d.6 = 22;  d.7 =  38;   d.8=63
d.9=102;  d.10=168;  d.11=268;  d.12=426;  d.13=673;  d.14=1064
d!=0
do m=1  for  K;    d!=max(d!,d.m)            /*ͺ*generate & assign 1st Kβalmost prime.*/
mr=right(m,w);     mm=m-1

newV3=;           do newV4=1  to min(N, d!)          /*ͺ*assign some doubled Kβalmost primes. */
newV3=newV3  d.mm.newV4 * 2
end   /*ͺ*#*/
newV4=newV4-1
if m==1  then from=2
else from=1 + word(newV3, words(newV3) )

do j=from   until  newV4==N                  /*ͺ*process an  Kβalmost prime  N  times.*/
if factr()\==m  then iterate             /*ͺ*not the correct  Kβalmost  prime?    */
newV4=newV4+1;   newV3=newV3 j                           /*ͺ*bump Kβalmost counter; append it to $*/
end   /*ͺ*j*/                              /*ͺ* [β]   generate  N  Kβalmost  primes.*/

if nn>0  then say mr"βalmost ("N') primes:'     newV3
else say '    the last'  mr  "Kβalmost prime: "   word(newV3, words(newV3))
/*ͺ* [β]  assign Kβalmost primes.*/
do q=1  for newV4;     d.m.q=word(newV3,q)             ;   end  /*ͺ*q*/
do q=1  for newV4;  if d.m.q\==d.mm.q*2  then leave;   end  /*ͺ*q*/
/*ͺ* [β]  count doubly-duplicates*/
/*ͺ*ββββ say copies('β',40)  'for '   m", "   q-1   'numbers were doublyβduplicated.' ββββ*/
/*ͺ*ββββ say                                                                          ββββ*/
end       /*ͺ*m*/                              /*ͺ* [β]  display a line for each Kβprime*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
factr: if newV1.j\==.  then return newV1.j
z=j;                                do f=0 while z// 2==0; z=z% 2; end   /*ͺ*Γ· by 2*/
do f=f while z// 3==0; z=z% 3; end   /*ͺ*Γ· "  3*/
do f=f while z// 5==0; z=z% 5; end   /*ͺ*Γ· "  5*/
do f=f while z// 7==0; z=z% 7; end   /*ͺ*Γ· "  7*/
do f=f while z//11==0; z=z%11; end   /*ͺ*Γ· " 11*/
do f=f while z//13==0; z=z%13; end   /*ͺ*Γ· " 13*/
do f=f while z//17==0; z=z%17; end   /*ͺ*Γ· " 17*/
do f=f while z//19==0; z=z%19; end   /*ͺ*Γ· " 19*/

do i=9    while  newV2.i<=z;       d=newV2.i    /*ͺ*divide by some higher primes.        */
do f=f  while z//d==0;   z=z%d;  end  /*ͺ*is  Z  divisible by the  prime  D ?  */
end   /*ͺ*i*/                             /*ͺ* [β]  find all factors in  Z.        */

if f==0  then f=1;   newV1.j=f;   return f    /*ͺ*Is prime (fβ‘0)?   Then return unity. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genPrimes: arg x;             newV2.=;      newV2.1=2;     newV2.2=3;    newV1.=.;     newV4=2;     s.newV4=newV2.newV4**2
do j=newV2.newV4 +2  by 2  to x             /*ͺ*only find odd primes from here on.   */
do p=2  while s.p<=j             /*ͺ*divide by some known low odd primes. */
if j//newV2.p==0  then iterate j     /*ͺ*Is  J  divisible by X?  Then Β¬ prime.*/
end   /*ͺ*p*/                      /*ͺ* [β]  a prime  (J)  has been found.  */
newV4=newV4+1;    newV2.newV4=j;   newV1.j=1;   s.newV4=j*j /*ͺ*bump prime count, and also assign Β·Β·Β·*/
end      /*ͺ*j*/                      /*ͺ* Β·Β·Β· the # of factors, prime, primeΒ².*/
return                                /*ͺ* [β]  not an optimal prime generator.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Almost-prime\almost-prime-2.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
