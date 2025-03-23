/*�*REXX program  finds and displays  N   weird numbers in a vertical format (with index).*/
parse arg n cols .                               /*�*obtain optional arguments from the CL*/
if    n=='' |    n==","  then    n=  400         /*�*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=   10         /*�* "      "         "   "   "     "    */
w= 10                                            /*�*width of a number in any column.     */
call genP                                        /*�*generate primes just past   Hp.      */
if cols>0 then say ' index │'center(' weird numbers',   1 + cols*(w+1)     )
if cols>0 then say '───────┼'center(""              ,   1 + cols*(w+1), '─')
weirds= 0;                             newV1.= 0    /*�*the count of weird numbers  (so far).*/
idx= 1;                          newV3=              /*�*index for the output list;  $: 1 line*/
do j=2  by 2  until weirds==n            /*�*examine even integers 'til have 'nuff*/
if \weird(j)  then iterate               /*�*Not a  weird  number?  Then skip it. */
weirds= weirds + 1                       /*�*bump the count of  weird   numbers.  */
do a=1  for newV5  until newV4>hp;  if newV2.a<sigma+j  then iterate;   newV4= j*newV2.a;   newV1.newV4= 1
end   /*�*a*/
c= commas(j)                             /*�*maybe add commas to the number.      */
newV3= newV3 right(c, max(w, length(c) ) )       /*�*add a nice prime ──► list, allow big#*/
if weirds//cols\==0  then iterate        /*�*have we populated a line of output?  */
say center(idx, 7)'│'  substr(newV3, 2);  newV3= /*�*display what we have so far  (cols). */
idx= idx + cols                          /*�*bump the  index  count for the output*/
end   /*�*j*/

if newV3\==''  then say center(idx, 7)"│"  substr(newV3, 2)  /*�*possible display residual output.*/
if cols>0 then say '───────┴'center(""              ,  1 + cols*(w+1), '─')
say
say 'Found '       commas(weirds)          ' weird numbers'
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do ic=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, ic); end;  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
DaS:  procedure; parse arg x 1 z 1,b;       a= 1 /*�*get X,Z,B (the 1st arg); init A list.*/
r= 0;         q= 1                         /*�* [↓] ══integer square root══     ___ */
do while q<=z; q=q*4; end             /*�*R:  an integer which will be    √ X  */
do while q>1;  q=q%4;  newV4= z-r-q;  r=r%2;  if newV4>=0  then  do;  z=newV4;  r=r+q;  end
end   /*�*while q>1*/                   /*�* [↑]  compute the integer sqrt of  X.*/
sig = a                                    /*�*initialize the sigma so far.     ___ */
do j=2  to r - (r*r==x)                /*�*divide by some integers up to   √ X  */
if x//j==0  then do;  a=a j;  b= x%j b /*�*if ÷, add both divisors to α & ß.    */
sig= sig +j +x%j /*�*bump the sigma (the sum of Pdivisors)*/
end
end   /*�*j*/                            /*�* [↑]  %  is the REXX integer division*/
/*�* [↓]  adjust for a square.        ___*/
if j*j==x  then  return sig+j  a j b       /*�*Was  X  a square?    If so, add  √ X */
return sig    a   b       /*�*return the divisors  (both lists).   */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: hp= 1000 * n                               /*�*high Prime limit; define 2 low primes*/
newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11     /*�*define some low primes.              */
newV5=5;     s.newV5= newV2.newV5 **2    /*�*number of primes so far;     prime². */
/*�* [↓]  generate more  primes  ����ֳ  high.*/
do j=newV2.newV5+2  by 2  for max(0, hp%2-newV2.newV5%2-1)      /*�*find odd primes from here on. */
parse var j '' -1 newV4; if     newV4==5  then iterate  /*�*J divisible by 5?  (right dig)*/
if j// 3==0  then iterate  /*�*"     "      " 3?             */
if j// 7==0  then iterate  /*�*"     "      " 7?             */
/*�* [↑]  the above five lines saves time*/
do k=5  while s.k<=j              /*�* [↓]  divide by the known odd primes.*/
if j // newV2.k == 0  then iterate j  /*�*Is  J ÷ X?  Then not prime.     ___  */
end   /*�*k*/                       /*�* [↑]  only process numbers  ����ֳ  √ J   */
newV5= newV5+1;    newV2.newV5= j;    s.newV5= j*j           /*�*bump # of Ps; assign next P;  P²; P# */
end          /*�*j*/;           return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
weird: procedure expose newV1. sigma; parse arg x   /*�*obtain a # to be tested for weirdness*/
if x<70 | x//3==0       then return 0     /*�*test if X is too low or multiple of 3*/
if newV1.x                 then return 1     /*�*Is this a prime*previous #? Found one*/
parse value  DaS(x)  with  sigma divs     /*�*obtain sigma and the proper divisors.*/
if sigma<=x  then  return 0               /*�*X  isn't abundant  (sigma too small).*/
newV5= words(divs)                            /*�*count the number of divisors for  X. */
if newV5<3   then return 0                    /*�*Not enough divisors?    "      "     */
if newV5>15  then return 0                    /*�*number of divs > 15?  It's not weird.*/
a.=                                       /*�*initialize the    A.   stemmed array.*/
do i=1  for newV5;     newV4= word(divs, i)   /*�*obtain one of the divisors of  X.    */
newV2.i= newV4;          a.newV4= .               /*�*assign proper divs──►@ array; also id*/
end   /*�*i*/
df= sigma - x                             /*�*calculate difference between ����ֵ and X.*/
if a.df==.  then return 0                 /*�*Any divisor is equal to DF? Not weird*/
c= 0;           u= 2**newV5                   /*�*zero combo counter; calc. power of 2.*/
do p=1  for u-2;            c= c + 1  /*�*convert P──►binary with leading zeros*/
yy.c= strip( x2b( d2x(p) ),  'L', 0)  /*�*store this particular combination.   */
end   /*�*p*/
/*�* [↓]  decreasing partitions is faster*/
do part=c  by -1  for c;      s= 0    /*�*test of a partition add to the arg X.*/
newV4= yy.part;           L= length(newV4)    /*�*obtain one method of partitioning.   */
do cp=L  by -1  for L               /*�*obtain a sum of  a  partition.       */
if substr(newV4,cp,1)  then do;  s= s + newV2.cp            /*�*1 bit?  Then add ──►S*/
if s==x  then return 0 /*�*Sum equal?  Not weird*/
if s==df then return 0 /*�*Sum = DF?    "    "  */
if s>x   then iterate  /*�*Sum too big? Try next*/
end
end   /*�*cp*/
end     /*�*part*/
return 1                                   /*�*no sum equal to  X,  so  X  is weird.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Weird-numbers\weird-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
