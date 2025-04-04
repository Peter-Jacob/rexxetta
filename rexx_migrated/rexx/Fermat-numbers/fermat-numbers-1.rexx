/*ช*REXX program to find and display  Fermat  numbers, and show factors of Fermat numbers.*/
parse arg n .                                    /*ช*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 9                     /*ช*Not specified?  Then use the default.*/
numeric digits 20                                /*ช*ensure enough decimal digits, for n=9*/

do j=0  to n;   f= 2** (2**j)   +  1      /*ช*calculate a series of Fermat numbers.*/
say right('F'j, length(n) + 1)': '     f  /*ช*display a particular     "      "    */
end   /*ช*j*/
say
do k=0  to n;   f= 2** (2**k)   +  1; say /*ช*calculate a series of Fermat numbers.*/
say center(' F'k": " f' ', 79, "โ")       /*ช*display a particular     "      "    */
p= factr(f)                               /*ช*factor a Fermat number,  given time. */
if words(p)==1  then say f ' is prime.'
else say 'factors: '   p
end   /*ช*k*/
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
factr:  procedure; parse arg x 1 z,,newV2
do k=1  to 11  by 2;  j= k;  if j==1  then j= 2;  if j==9  then iterate
call build                          /*ช*add  J  to the factors list.         */
end   /*ช*k*/                         /*ช* [โ]  factor  X  with some low primes*/

do y=0  by 2;         j= j + 2 +   y // 4      /*ช*ensure not  รท  by three.  */
parse var j '' -1 newV3;  if newV3==5  then iterate    /*ช*last digit a "5"? Skip it.*/
if j*j>x | j>z  then leave
call build                          /*ช*add  Y  to the factors list.         */
end   /*ช*y*/                         /*ช* [โ]  factor  X  with other higher #s*/
j= z
if z\==1  then newV2= build()
if newV2=''   then do;  newV1.1= x;  newV2= x;  newV4= 1;  end
return newV2
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
build:     do  while z//j==0;    z= z % j;    newV2= newV2 j;    end;              return strip(newV2)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fermat-numbers\fermat-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
