/*ͺ*REXX program  displays  divisors  of any [negative/zero/positive]  integer or a range.*/
parse arg LO HI inc .                                         /*ͺ*obtain the optional args*/
HI= word(HI LO 20, 1);  LO= word(LO 1,1);  inc= word(inc 1,1) /*ͺ*define the range options*/
w= length(HI) + 2;    numeric digits max(9, w-2);     newV2= 'β'  /*ͺ*decimal digits for  //  */
newV1.=left('',7); newV1.1= "{unity}"; newV1.2= '[prime]'; newV1.newV2= "  {β}  " /*ͺ*define some literals.   */
say center('n', w)    "#divisors"    center('divisors', 60)   /*ͺ*display the  header.    */
say copies('β', w)    "βββββββββ"    copies('β'       , 60)   /*ͺ*   "     "   separator. */
pn= 0                                                         /*ͺ*count of prime numbers. */
do k=2  until sq.k>=HI;   sq.k= k*k          /*ͺ*memoization for squares.*/
end   /*ͺ*k*/
do n=LO  to HI  by inc;  newV3= divs(n);  newV4= words(newV3)        /*ͺ*get list of divs; # divs*/
if newV3==newV2  then do;  newV4= newV2;  newV3= '  (infinite)';  end        /*ͺ*handle case for infinity*/
p= newV1.newV4;    if n<0  then if n\==-1  then p= newV1..           /*ͺ*   "     "   "  negative*/
if p==newV1.2  then pn= pn + 1                               /*ͺ*Prime? Then bump counter*/
say center(n, w)      center('['newV4"]", 9)       "βββΊ "        p      ' '       newV3
end   /*ͺ*n*/                                 /*ͺ* [β]   process a range of integers.  */
say
say right(pn, 20)    ' primes were found.'       /*ͺ*display the number of primes found.  */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
divs: procedure expose sq.; parse arg x 1 b; a=1 /*ͺ*set  X  and  B  to the 1st argument. */
if x<2  then do;  x= abs(x);  if x==1  then return 1; if x==0  then return 'β';  b=x
end
odd= x // 2                                /*ͺ* [β]  process EVEN or ODD ints.   ___*/
do j=2+odd  by 1+odd  while sq.j<x       /*ͺ*divide by all the integers up to β x */
if x//j==0  then do; a=a j; b=x%j b; end /*ͺ*Γ·?  Add divisors to  Ξ±  and  Γ  lists*/
end   /*ͺ*j*/                              /*ͺ* [β]  %  βξεχΦ²  integer division.     ___*/
if sq.j==x  then  return  a j b            /*ͺ*Was  X  a square?   Then insert  β x */
return  a   b            /*ͺ*return the divisors of both lists.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factors-of-an-integer\factors-of-an-integer-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
