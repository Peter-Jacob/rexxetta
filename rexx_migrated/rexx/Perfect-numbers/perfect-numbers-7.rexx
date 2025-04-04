/*ͺ*REXX program tests if a number  (or a range of numbers)   is/are  perfect.            */
parse arg low high .                             /*ͺ*obtain optional arguments from the CL*/
if high=='' & low==""  then high=34000000        /*ͺ*No arguments?    Then use a range.   */
if  low==''            then  low=1               /*ͺ*if no   LOW,  then assume unity.     */
low=low+low//2                                   /*ͺ*if LOW is odd,  bump it by one.      */
if high==''            then high=low             /*ͺ*if no  HIGH,  then assume  LOW.      */
w=length(high)                                   /*ͺ*use   W   for formatting the output. */
numeric digits max(9,w+2)                        /*ͺ*ensure enough decimal digits for nums*/
newV1. =0;    newV1.1=2;     newV2.=2;     newV3=' 6'            /*ͺ*highest  magic number  and its index.*/
newV2.newV3=22;   newV2.16=12;   newV2.28=8;   newV2.36=20;   newV2.56=20;   newV2.76=20;   newV2.96=20
/*ͺ* [β]   "Lucas' numbers,  in 1891.    */
do i=low  to high  by 0              /*ͺ*process the single number or a range.*/
if isPerfect(i)  then say  right(i,w)   'is a perfect number.'
i=i+newV2.newV4                              /*ͺ*use a fast advance for the DO index. */
end   /*ͺ*i*/                          /*ͺ* [β]  note: the DO index is modified.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPerfect: procedure expose newV1. newV2. newV4              /*ͺ*expose (make global) some variables. */
parse arg  x  1  y  ''  -2  newV4         /*ͺ*#  (and copy), and the last 2 digits.*/
if x==6    then return 1              /*ͺ*handle the special case of  six.     */
if newV2.newV4==2  then return 0              /*ͺ*test last two digits: FranΓ§ois Lucas.*/
/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββ
β LucasβLehmer know that perfect numbers can  β
β be expressed as:    [2^n -1] * {2^(n-1) }   β
βββββββββββββββββββββββββββββββββββββββββββββββ*/
if newV1.0<x  then do newV1.1=newV1.1  while newV1.newV3<=x;  newV3=(2**newV1.1-1)*2**(newV1.1-1); newV1.0=newV3; newV1.newV3=newV3
end   /*ͺ*@.1*/          /*ͺ* [β]  uses memoization for formula.  */

if newV1.x==0  then return 0              /*ͺ*Didn't pass Lucas-Lehmer? Not perfect*/
/*ͺ*[β]  perfect numbers digital root = 1*/
do  until  y<10                 /*ͺ*find the digital root of  Y.         */
parse var y d 2;  do k=2  for length(y)-1; d=d+substr(y,k,1);  end  /*ͺ*k*/
y=d                             /*ͺ*find digital root of the digital root*/
end   /*ͺ*until*/                 /*ͺ*wash, rinse, repeat Β·Β·Β·              */

if d\==1  then return 0               /*ͺ*Is digital root Β¬ 1?  Then Β¬ perfect.*/
s=3 + x%2                             /*ͺ*we know the following factors: unity,*/
z=x                                   /*ͺ*2,  and  xΓ·2   (x is even).          */
q=1;  do  while q<=z;   q=q*4 ;  end  /*ͺ*while qβ€z*/            /*ͺ*       _____*/
r=0                                   /*ͺ* [β]    R  will be the integer β  X  */
do  while q>1;  q=q%4; newV3=z-r-q; r=r%2;  if newV3>=0  then do; z=newV3; r=r+q; end
end   /*ͺ*while q>1*/             /*ͺ* [β]  compute the integer SQRT of  X.*/
/*ͺ*                                _____*/
do j=3  to r               /*ͺ*starting at 3,  find factors β€ β  X  */
if x//j==0  then s=s+j+x%j /*ͺ*J divisible by X? Then add J and  XΓ·J*/
end   /*ͺ*j*/
return s==x                           /*ͺ*if the sum matches X,  then perfect! */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-7.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
