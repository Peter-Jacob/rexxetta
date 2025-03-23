/*�*REXX program  sums  the  decimal digits  of natural numbers in any base up to base 36.*/
parse arg z                                      /*�*obtain optional argument from the CL.*/
if z='' | z=","  then z= '1 1234 fe f0e +F0E -666.00 11111112222222333333344444449'
do j=1  for words(z);     newV1=word(z, j)   /*�*obtain a number from the list.       */
say right(sumDigs(newV1), 9)    ' is the sum of the digits for the number '    newV1
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumDigs: procedure;  arg x;  newV2=123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ;  newV3=0
do k=1  to length(x);   newV3=newV3 + pos( substr(x, k, 1), newV2);  end /*�*k*/
return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-digits-of-an-integer\sum-digits-of-an-integer-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
