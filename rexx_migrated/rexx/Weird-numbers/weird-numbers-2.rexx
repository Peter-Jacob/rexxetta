/*ͺ*REXX program  finds and displays  N   weird numbers in a vertical format (with index).*/
parse arg n cols .                               /*ͺ*obtain optional arguments from the CL*/
if    n=='' |    n==","  then    n=  400         /*ͺ*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=   10         /*ͺ* "      "         "   "   "     "    */
w= 10                                            /*ͺ*width of a number in any column.     */
call genP                                        /*ͺ*generate primes just past   Hp.      */
if cols>0 then say ' index β'center(' weird numbers',   1 + cols*(w+1)     )
if cols>0 then say 'ββββββββΌ'center(""              ,   1 + cols*(w+1), 'β')
weirds= 0;                             newV1.= 0    /*ͺ*the count of weird numbers  (so far).*/
idx= 1;                          newV3=              /*ͺ*index for the output list;  $: 1 line*/
do j=2  by 2  until weirds==n            /*ͺ*examine even integers 'til have 'nuff*/
if \weird(j)  then iterate               /*ͺ*Not a  weird  number?  Then skip it. */
weirds= weirds + 1                       /*ͺ*bump the count of  weird   numbers.  */
do a=1  for newV5  until newV4>hp;  if newV2.a<sigma+j  then iterate;   newV4= j*newV2.a;   newV1.newV4= 1
end   /*ͺ*a*/
c= commas(j)                             /*ͺ*maybe add commas to the number.      */
newV3= newV3 right(c, max(w, length(c) ) )       /*ͺ*add a nice prime βββΊ list, allow big#*/
if weirds//cols\==0  then iterate        /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV3, 2);  newV3= /*ͺ*display what we have so far  (cols). */
idx= idx + cols                          /*ͺ*bump the  index  count for the output*/
end   /*ͺ*j*/

if newV3\==''  then say center(idx, 7)"β"  substr(newV3, 2)  /*ͺ*possible display residual output.*/
if cols>0 then say 'ββββββββ΄'center(""              ,  1 + cols*(w+1), 'β')
say
say 'Found '       commas(weirds)          ' weird numbers'
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV4;  do ic=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, ic); end;  return newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
DaS:  procedure; parse arg x 1 z 1,b;       a= 1 /*ͺ*get X,Z,B (the 1st arg); init A list.*/
r= 0;         q= 1                         /*ͺ* [β] ββinteger square rootββ     ___ */
do while q<=z; q=q*4; end             /*ͺ*R:  an integer which will be    β X  */
do while q>1;  q=q%4;  newV4= z-r-q;  r=r%2;  if newV4>=0  then  do;  z=newV4;  r=r+q;  end
end   /*ͺ*while q>1*/                   /*ͺ* [β]  compute the integer sqrt of  X.*/
sig = a                                    /*ͺ*initialize the sigma so far.     ___ */
do j=2  to r - (r*r==x)                /*ͺ*divide by some integers up to   β X  */
if x//j==0  then do;  a=a j;  b= x%j b /*ͺ*if Γ·, add both divisors to Ξ± & Γ.    */
sig= sig +j +x%j /*ͺ*bump the sigma (the sum of Pdivisors)*/
end
end   /*ͺ*j*/                            /*ͺ* [β]  %  is the REXX integer division*/
/*ͺ* [β]  adjust for a square.        ___*/
if j*j==x  then  return sig+j  a j b       /*ͺ*Was  X  a square?    If so, add  β X */
return sig    a   b       /*ͺ*return the divisors  (both lists).   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: hp= 1000 * n                               /*ͺ*high Prime limit; define 2 low primes*/
newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11     /*ͺ*define some low primes.              */
newV5=5;     s.newV5= newV2.newV5 **2    /*ͺ*number of primes so far;     primeΒ². */
/*ͺ* [β]  generate more  primes  βξεχΦ³  high.*/
do j=newV2.newV5+2  by 2  for max(0, hp%2-newV2.newV5%2-1)      /*ͺ*find odd primes from here on. */
parse var j '' -1 newV4; if     newV4==5  then iterate  /*ͺ*J divisible by 5?  (right dig)*/
if j// 3==0  then iterate  /*ͺ*"     "      " 3?             */
if j// 7==0  then iterate  /*ͺ*"     "      " 7?             */
/*ͺ* [β]  the above five lines saves time*/
do k=5  while s.k<=j              /*ͺ* [β]  divide by the known odd primes.*/
if j // newV2.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ³  β J   */
newV5= newV5+1;    newV2.newV5= j;    s.newV5= j*j           /*ͺ*bump # of Ps; assign next P;  PΒ²; P# */
end          /*ͺ*j*/;           return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
weird: procedure expose newV1. sigma; parse arg x   /*ͺ*obtain a # to be tested for weirdness*/
if x<70 | x//3==0       then return 0     /*ͺ*test if X is too low or multiple of 3*/
if newV1.x                 then return 1     /*ͺ*Is this a prime*previous #? Found one*/
parse value  DaS(x)  with  sigma divs     /*ͺ*obtain sigma and the proper divisors.*/
if sigma<=x  then  return 0               /*ͺ*X  isn't abundant  (sigma too small).*/
newV5= words(divs)                            /*ͺ*count the number of divisors for  X. */
if newV5<3   then return 0                    /*ͺ*Not enough divisors?    "      "     */
if newV5>15  then return 0                    /*ͺ*number of divs > 15?  It's not weird.*/
a.=                                       /*ͺ*initialize the    A.   stemmed array.*/
do i=1  for newV5;     newV4= word(divs, i)   /*ͺ*obtain one of the divisors of  X.    */
newV2.i= newV4;          a.newV4= .               /*ͺ*assign proper divsβββΊ@ array; also id*/
end   /*ͺ*i*/
df= sigma - x                             /*ͺ*calculate difference between ΞξεχΦ΅ and X.*/
if a.df==.  then return 0                 /*ͺ*Any divisor is equal to DF? Not weird*/
c= 0;           u= 2**newV5                   /*ͺ*zero combo counter; calc. power of 2.*/
do p=1  for u-2;            c= c + 1  /*ͺ*convert PβββΊbinary with leading zeros*/
yy.c= strip( x2b( d2x(p) ),  'L', 0)  /*ͺ*store this particular combination.   */
end   /*ͺ*p*/
/*ͺ* [β]  decreasing partitions is faster*/
do part=c  by -1  for c;      s= 0    /*ͺ*test of a partition add to the arg X.*/
newV4= yy.part;           L= length(newV4)    /*ͺ*obtain one method of partitioning.   */
do cp=L  by -1  for L               /*ͺ*obtain a sum of  a  partition.       */
if substr(newV4,cp,1)  then do;  s= s + newV2.cp            /*ͺ*1 bit?  Then add βββΊS*/
if s==x  then return 0 /*ͺ*Sum equal?  Not weird*/
if s==df then return 0 /*ͺ*Sum = DF?    "    "  */
if s>x   then iterate  /*ͺ*Sum too big? Try next*/
end
end   /*ͺ*cp*/
end     /*ͺ*part*/
return 1                                   /*ͺ*no sum equal to  X,  so  X  is weird.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Weird-numbers\weird-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
