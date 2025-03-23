/*�*REXX program finds the  LCM  (Least Common Multiple)  of any number of integers.      */
numeric digits 10000                             /*�*can handle 10k decimal digit numbers.*/
say 'the LCM of      19  and   0                   is ───►  '     lcm(19    0            )
say 'the LCM of       0  and  85                   is ───►  '     lcm( 0   85            )
say 'the LCM of      14  and  -6                   is ───►  '     lcm(14,  -6            )
say 'the LCM of      18  and  12                   is ───►  '     lcm(18   12            )
say 'the LCM of      18  and  12  and  -5          is ───►  '     lcm(18   12,   -5      )
say 'the LCM of      18  and  12  and  -5  and  97 is ───►  '     lcm(18,  12,   -5,   97)
say 'the LCM of 2**19-1  and  2**521-1             is ───►  '     lcm(2**19-1    2**521-1)
/*�* [↑]   7th  &  13th  Mersenne primes.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
lcm: procedure; parse arg newV1,newV2; newV1=newV1 newV2;           do i=3  to arg();  newV1=newV1 arg(i);  end  /*�*i*/
parse var newV1 x newV1                                  /*�*obtain the first value in args. */
x=abs(x)                                         /*�*use the absolute value of  X.   */
do  while newV1\==''                       /*�*process the remainder of args.  */
parse var newV1 newV3 newV1;    if newV3<0  then newV3=-newV3  /*�*pick off the next arg (ABS val).*/
if newV3==0  then return 0                 /*�*if zero, then LCM is also zero. */
d=x*newV3                                  /*�*calculate part of the LCM here. */
do  until newV3==0;    parse  value   x//newV3  newV3     with     newV3  x
end   /*�*until*/                 /*�* [↑]  this is a short & fast GCD*/
x=d%x                                  /*�*divide the pre─calculated value.*/
end   /*�*while*/                        /*�* [↑]  process subsequent args.  */
return x                                         /*�*return with the LCM of the args.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Least-common-multiple\least-common-multiple-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
