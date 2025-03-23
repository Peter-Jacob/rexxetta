/*�*REXX program  sums  the  decimal digits  of  integers  expressed in base ten.         */
parse arg z                                      /*�*obtain optional argument from the CL.*/
if z='' | z=","  then z=copies(7, 108)           /*�*let's generate a pretty huge integer.*/
numeric digits 1 + max( length(z) )              /*�*enable use of gigantic numbers.      */

do j=1  for words(z);    newV1=abs(word(z, j))  /*�*ignore any leading sign,  if present.*/
say sumDigs(newV1)      ' is the sum of the digits for the number '    newV1
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumDigs: procedure;  parse arg N 1 newV2 2 newV3         /*�*use first decimal digit for the sum. */
do  while newV3\=='';  parse var newV3 newV1 2 newV3;  newV2=newV2+newV1;  end  /*�*while*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-digits-of-an-integer\sum-digits-of-an-integer-3.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
