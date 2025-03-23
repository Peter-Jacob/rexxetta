/*�*REXX program uses  exponent─and─mod  operator to test possible Mersenne numbers.      */
numeric digits 20                                /*�*this will be increased if necessary. */
parse arg N spec                                 /*�*obtain optional arguments from the CL*/
if    N=='' |    N==","  then    N=  88          /*�*Not specified?  Then use the default.*/
if spec=='' | spec==","  then spec= 920 970      /*�* "      "         "   "   "     "    */
do j=1;                  z= j              /*�*process a range, & then do some more.*/
if j==N             then j= word(spec, 1)  /*�*now, use  the high range of numbers. */
if j>word(spec, 2)  then leave             /*�*done with  "    "    "    "    "     */
if \isPrime(z)  then iterate               /*�*if  Z  isn't a prime,  keep plugging.*/
r= commas( testMer(z) );   L= length(r)    /*�*add commas;    get its new length.   */
if r==0  then say right('M'z, 10)     "──────── is a Mersenne prime."
else say right('M'z, 50)     "is composite, a factor:"right(r, max(L, 13) )
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPrime: procedure; parse arg x;             if wordpos(x, '2 3 5 7') \== 0  then return 1
if x<11  then return 0;             if x//2 == 0 | x//3       == 0  then return 0
do j=5  by 6;                  if x//j == 0 | x//(j+2)   == 0  then return 0
if j*j>x   then return 1                 /*�*◄─┐         ___                */
end   /*�*j*/                              /*�*  └─◄ Is j>√ x ?  Then return 1*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
iSqrt:   procedure; parse arg x;  newV4= 1;   r= 0;                 do while newV4<=x;    newV4= newV4 * 4
end   /*�*while*/
do while newV4>1;      newV4= newV4 % 4;   newV3= x-r-newV4;    r= r % 2
if newV3>=0  then do;  x= newV3;       r= r + newV4
end
end   /*�*while*/                             /*�*iSqrt ≡    integer square root.*/
return r                                      /*�*─────      ─       ──     ─  ─ */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
testMer: procedure;  parse arg x;              p= 2**x /*�* [↓]  do we have enough digits?*/
newV1=x2b( d2x(x) ) + 0
if pos('E',p)\==0  then do;  parse var p "E" newV3;   numeric digits newV3 + 2;   p= 2**x
end
newV2.= 1;   newV2.1= 0;   newV2.7= 0                     /*�*array used for a quicker test. */
R= iSqrt(p)                                   /*�*obtain integer square root of P*/
do k=2  by 2;         q= k*x  +  1 /*�*(shortcut) compute value of Q. */
m= q // 8                          /*�*obtain the remainder when ÷ 8. */
if newV2.m       then iterate          /*�*M  must be either one or seven.*/
parse var q '' -1 newV3;  if newV3==5  then iterate   /*�*last digit a five ? */
if q// 3==0  then iterate                     /*�*divisible by three? */
if q// 7==0  then iterate                     /*�*    "      " seven? */
if q//11==0  then iterate                     /*�*    "      " eleven?*/
/*�*      ____                     */
if q>R               then return 0 /*�*Is q>√2**x ?   A Mersenne prime*/
sq= 1;        newV5= newV1                /*�*obtain binary version from  $. */
do  until newV5=='';      sq= sq*sq
parse var newV5  newV3  2  newV5           /*�*obtain 1st digit and the rest. */
if newV3  then sq= (sq+sq) // q
end   /*�*until*/
if sq==1  then return q            /*�*Not a prime?   Return a factor.*/
end   /*�*k*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factors-of-a-Mersenne-number\factors-of-a-mersenne-number.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
