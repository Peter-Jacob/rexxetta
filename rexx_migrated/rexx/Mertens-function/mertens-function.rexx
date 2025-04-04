/*ͺ*REXX pgm computes & shows a value grid of the Mertens function for a range of integers*/
parse arg LO HI grp eqZ xZ .                     /*ͺ*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=    0            /*ͺ*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI=  199            /*ͺ* "      "         "   "   "     "    */
if grp=='' | grp==","  then grp=   20            /*ͺ* "      "         "   "   "     "    */
if eqZ=='' | eqZ==","  then eqZ= 1000            /*ͺ* "      "         "   "   "     "    */
if  xZ=='' |  xZ==","  then  xZ= 1000            /*ͺ* "      "         "   "   "     "    */
call genP                                        /*ͺ*generate primes up to max  β  HIHI   */
call Franz LO, HI
if eqZ>0  then call Franz 1, -eqZ
if  xZ>0  then call Franz -1, xZ
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Franz: parse arg a 1 oa,b 1 ob;        newV1= ' The Mertens sequence from '
a= abs(a);   b= abs(b);    grid= oa>=0 & ob>=0   /*ͺ*semaphore used to show a grid title. */
if grid  then say center(newV1 LO " βββΊ " HI" ", max(50, grp*3), 'β')    /*ͺ*show title*/
else say
zeros= 0                                         /*ͺ*# of  0's found for Mertens function.*/
Xzero= 0                                         /*ͺ*number of times that zero was crossed*/
newV4=;                 prev=                        /*ͺ*$  holds output grid of GRP numbers. */
do j=a  to b;     newV5= Mertens(j)               /*ͺ*process some numbers from  LO βββΊ HI.*/
if newV5==0  then zeros= zeros + 1                /*ͺ*Is Zero?  Then bump the zeros counter*/
if newV5==0  then if prev\==0 then Xzero= Xzero+1 /*ͺ*prev Β¬=0?   "   "    "  Xzero    "   */
prev= newV5
if grid  then newV4= newV4 right(newV5, 2)                /*ͺ*build grid if A & B are nonβnegative.*/
if words(newV4)==grp  then do;  say substr(newV4, 2);  newV4=    /*ͺ*show grid if fully populated, */
end                           /*ͺ*  and nullify it for more #s. */
end   /*ͺ*j*/                                   /*ͺ*for small grids, using wordCnt is OK.*/

if newV4\==''  then say substr(newV4, 2)                 /*ͺ*handle any residual numbers not shown*/
if oa<0  then say newV1   a    " to "    b   ' has crossed zero '    Xzero    " times."
if ob<0  then say newV1   a    " to "    b   ' has '                 zeros    " zeros."
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Mertens: procedure expose newV3. newV2. M.;  parse arg n; if M.n\==.  then return M.n
if n<1  then return 'β'; m= 0           /*ͺ*handle special cases of nonβpositive#*/
do k=1  for n;   m= m + mobius(k)  /*ͺ*sum the  MU's  up to  N.             */
end   /*ͺ*k*/                        /*ͺ* [β] mobius function uses memoization*/
M.n= m;          return m               /*ͺ*return the sum of all the  MU's.     */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
mobius: procedure expose newV3. newV2.;  parse arg x 1 ox  /*ͺ*get integer to be tested for  mu  */
if newV2.x\==.  then return newV2.x            /*ͺ*X computed before?  Return that value*/
if x<1  then return 'β';      mu= 0      /*ͺ*handle special case of non-positive #*/
do k=1;  p= newV3.k; if p>x  then leave       /*ͺ* (P)    > X?   Then we're done.*/
if p*p>x    then do; mu= mu+1; leave; end /*ͺ* (P**2) > X?   Bump # and leave*/
if x//p==0  then do; mu= mu+1       /*ͺ*X divisible by P?   Bump  mu  number.*/
x= x % p       /*ͺ*                    Divide by prime. */
if x//p==0  then return 0  /*ͺ*XΓ·by P?  Then return zero*/
end
end   /*ͺ*k*/                         /*ͺ*MU (below) is almost always small, <9*/
newV2.ox=  -1 ** mu;         return newV2.ox   /*ͺ*raise -1 to the mu power, memoize it.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV3.1=2; newV3.2=3; newV3.3=5; newV3.4=7; newV3.5=11; newV3.6=13 /*ͺ*initialize some low primes; # primes.*/
newV2.=.;  M.=newV2.;      newV6= 6;  sq.newV6= newV3.6**2   /*ͺ*     "     2 arrays for memoization. */
do j=newV3.newV6+4  by 2  to max(HI, eqZ, xZ); parse var j '' -1 newV5   /*ͺ*odd Ps from now on*/
if newV5==5 then iterate; if j//3==0 then iterate; if j//7==0  then iterate /*ͺ*Γ· 5 3 7*/
do k=7  while sq.k<=j                  /*ͺ*divide by some generated odd primes. */
if j//newV3.k==0  then iterate j           /*ͺ*Is J divisible by  P?  Then not prime*/
end   /*ͺ*k*/                            /*ͺ* [β]  a prime  (J)  has been found.  */
newV6= newV6+1;          newV3.newV6=j;  sq.j= j*j        /*ͺ*bump P count;  PβββΊ@.;  compute  J**2*/
end      /*ͺ*j*/;                    return /*ͺ*calculate the squares of some primes.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mertens-function\mertens-function.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
