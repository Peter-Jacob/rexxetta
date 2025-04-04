/*ͺ*REXX program calculates  Carmichael  3βstrong  pseudoprimes  (up to and including N). */
numeric digits 18                                /*ͺ*handle big dig #s (9 is the default).*/
parse arg N .;    if N=='' | N==","  then N=61   /*ͺ*allow user to specify for the search.*/
tell= N>0;           N= abs(N)                   /*ͺ*N>0?  Then display Carmichael numbers*/
newV2= 0                                             /*ͺ*number of Carmichael numbers so far. */
newV1.=0;   newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1; newV1.13=1; newV1.17=1; newV1.19=1; newV1.23=1; newV1.29=1; newV1.31=1
/*ͺ*[β]  prime number memoization array. */
do p=3  to N  by 2;  pm= p-1;  bot=0;  top=0 /*ͺ*step through some (odd) prime numbers*/
if \isPrime(p)  then iterate;  nps= -p*p     /*ͺ*is   P   a prime?   No, then skip it.*/
c.= 0                                        /*ͺ*the list of Carmichael #'s  (so far).*/
do h3=2  for  pm-1;   g= h3 + p     /*ͺ*get Carmichael numbers for this prime*/
npsH3= ((nps // h3) + h3) // h3     /*ͺ*define a couple of shortcuts for pgm.*/
gPM= g * pm                         /*ͺ*define a couple of shortcuts for pgm.*/
/*ͺ* [β] perform some weeding of D values*/
do d=1  for g-1;                   if gPM // d    \== 0      then iterate
if npsH3       \== d//h3  then iterate
q= 1  +  gPM   % d;    if \isPrime(q)            then iterate
r= 1  +  p * q % h3;   if q * r // pm \== 1      then iterate
if \isPrime(r)            then iterate
newV2= newV2 + 1;   c.q= r              /*ͺ*bump Carmichael counter; add to array*/
if bot==0  then bot= q;   bot= min(bot, q);             top= max(top, q)
end   /*ͺ*d*/
end       /*ͺ*h3*/
newV3=                                           /*ͺ*build list of some Carmichael numbers*/
if tell  then  do j=bot  to top  by 2;          if c.j\==0  then newV3= newV3  p"β"j'β'c.j
end           /*ͺ*j*/

if newV3\==''  then say  'Carmichael number: '      strip(newV3)
end                /*ͺ*p*/
say
say 'ββββββββ '     newV2     " Carmichael numbers found."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: parse arg x;             if newV1.x      then return 1       /*ͺ*is X  a known prime?*/
if x<37  then return 0;  if x//2==0  then return 0; if x// 3==0     then return 0
parse var x  ''  -1  newV4;  if newV4==5     then return 0; if x// 7==0     then return 0
if x//11==0  then return 0; if x//13==0  then return 0; if x//17==0 then return 0
if x//19==0  then return 0; if x//23==0  then return 0; if x//29==0 then return 0
do k=29  by 6  until k*k>x;    if x//k       ==0  then return 0
if x//(k+2)   ==0  then return 0
end   /*ͺ*k*/
newV1.x=1;                                                                   return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Carmichael-3-strong-pseudoprimes\carmichael-3-strong-pseudoprimes.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
