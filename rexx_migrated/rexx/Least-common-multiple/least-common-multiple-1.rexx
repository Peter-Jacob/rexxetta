/*ͺ*REXX program finds the  LCM  (Least Common Multiple)  of any number of integers.      */
numeric digits 10000                             /*ͺ*can handle 10k decimal digit numbers.*/
say 'the LCM of      19  and   0                   is ββββΊ  '     lcm(19    0            )
say 'the LCM of       0  and  85                   is ββββΊ  '     lcm( 0   85            )
say 'the LCM of      14  and  -6                   is ββββΊ  '     lcm(14,  -6            )
say 'the LCM of      18  and  12                   is ββββΊ  '     lcm(18   12            )
say 'the LCM of      18  and  12  and  -5          is ββββΊ  '     lcm(18   12,   -5      )
say 'the LCM of      18  and  12  and  -5  and  97 is ββββΊ  '     lcm(18,  12,   -5,   97)
say 'the LCM of 2**19-1  and  2**521-1             is ββββΊ  '     lcm(2**19-1    2**521-1)
/*ͺ* [β]   7th  &  13th  Mersenne primes.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
lcm: procedure; parse arg newV1,newV2; newV1=newV1 newV2;           do i=3  to arg();  newV1=newV1 arg(i);  end  /*ͺ*i*/
parse var newV1 x newV1                                  /*ͺ*obtain the first value in args. */
x=abs(x)                                         /*ͺ*use the absolute value of  X.   */
do  while newV1\==''                       /*ͺ*process the remainder of args.  */
parse var newV1 newV3 newV1;    if newV3<0  then newV3=-newV3  /*ͺ*pick off the next arg (ABS val).*/
if newV3==0  then return 0                 /*ͺ*if zero, then LCM is also zero. */
d=x*newV3                                  /*ͺ*calculate part of the LCM here. */
do  until newV3==0;    parse  value   x//newV3  newV3     with     newV3  x
end   /*ͺ*until*/                 /*ͺ* [β]  this is a short & fast GCD*/
x=d%x                                  /*ͺ*divide the preβcalculated value.*/
end   /*ͺ*while*/                        /*ͺ* [β]  process subsequent args.  */
return x                                         /*ͺ*return with the LCM of the args.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Least-common-multiple\least-common-multiple-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
