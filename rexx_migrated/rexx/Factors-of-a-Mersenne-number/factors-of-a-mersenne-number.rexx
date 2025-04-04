/*ͺ*REXX program uses  exponentβandβmod  operator to test possible Mersenne numbers.      */
numeric digits 20                                /*ͺ*this will be increased if necessary. */
parse arg N spec                                 /*ͺ*obtain optional arguments from the CL*/
if    N=='' |    N==","  then    N=  88          /*ͺ*Not specified?  Then use the default.*/
if spec=='' | spec==","  then spec= 920 970      /*ͺ* "      "         "   "   "     "    */
do j=1;                  z= j              /*ͺ*process a range, & then do some more.*/
if j==N             then j= word(spec, 1)  /*ͺ*now, use  the high range of numbers. */
if j>word(spec, 2)  then leave             /*ͺ*done with  "    "    "    "    "     */
if \isPrime(z)  then iterate               /*ͺ*if  Z  isn't a prime,  keep plugging.*/
r= commas( testMer(z) );   L= length(r)    /*ͺ*add commas;    get its new length.   */
if r==0  then say right('M'z, 10)     "ββββββββ is a Mersenne prime."
else say right('M'z, 50)     "is composite, a factor:"right(r, max(L, 13) )
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: procedure; parse arg x;             if wordpos(x, '2 3 5 7') \== 0  then return 1
if x<11  then return 0;             if x//2 == 0 | x//3       == 0  then return 0
do j=5  by 6;                  if x//j == 0 | x//(j+2)   == 0  then return 0
if j*j>x   then return 1                 /*ͺ*βββ         ___                */
end   /*ͺ*j*/                              /*ͺ*  βββ Is j>β x ?  Then return 1*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
iSqrt:   procedure; parse arg x;  newV4= 1;   r= 0;                 do while newV4<=x;    newV4= newV4 * 4
end   /*ͺ*while*/
do while newV4>1;      newV4= newV4 % 4;   newV3= x-r-newV4;    r= r % 2
if newV3>=0  then do;  x= newV3;       r= r + newV4
end
end   /*ͺ*while*/                             /*ͺ*iSqrt β‘    integer square root.*/
return r                                      /*ͺ*βββββ      β       ββ     β  β */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
testMer: procedure;  parse arg x;              p= 2**x /*ͺ* [β]  do we have enough digits?*/
newV1=x2b( d2x(x) ) + 0
if pos('E',p)\==0  then do;  parse var p "E" newV3;   numeric digits newV3 + 2;   p= 2**x
end
newV2.= 1;   newV2.1= 0;   newV2.7= 0                     /*ͺ*array used for a quicker test. */
R= iSqrt(p)                                   /*ͺ*obtain integer square root of P*/
do k=2  by 2;         q= k*x  +  1 /*ͺ*(shortcut) compute value of Q. */
m= q // 8                          /*ͺ*obtain the remainder when Γ· 8. */
if newV2.m       then iterate          /*ͺ*M  must be either one or seven.*/
parse var q '' -1 newV3;  if newV3==5  then iterate   /*ͺ*last digit a five ? */
if q// 3==0  then iterate                     /*ͺ*divisible by three? */
if q// 7==0  then iterate                     /*ͺ*    "      " seven? */
if q//11==0  then iterate                     /*ͺ*    "      " eleven?*/
/*ͺ*      ____                     */
if q>R               then return 0 /*ͺ*Is q>β2**x ?   A Mersenne prime*/
sq= 1;        newV5= newV1                /*ͺ*obtain binary version from  $. */
do  until newV5=='';      sq= sq*sq
parse var newV5  newV3  2  newV5           /*ͺ*obtain 1st digit and the rest. */
if newV3  then sq= (sq+sq) // q
end   /*ͺ*until*/
if sq==1  then return q            /*ͺ*Not a prime?   Return a factor.*/
end   /*ͺ*k*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factors-of-a-Mersenne-number\factors-of-a-mersenne-number.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
