/*�*REXX program  sums  the squares of the numbers  in a (numeric)  vector of 15 numbers. */
numeric digits 100                               /*�*allow 100─digit numbers; default is 9*/
v= -100 9 8 7 6 0 3 4 5 2 1 .5 10 11 12          /*�*define a vector with fifteen numbers.*/
newV1=words(v)                                       /*�*obtain number of words in the V list.*/
newV2= 0                                             /*�*initialize the  sum  ($)  to zero.   */
do k=1  for newV1                             /*�*process each number in the V vector. */
newV2=newV2 + word(v,k)**2                        /*�*add a squared element to the ($) sum.*/
end   /*�*k*/                               /*�* [↑]  if vector is empty, then sum=0.*/
/*�*stick a fork in it,  we're all done. */
say 'The sum of '      newV1      " squared elements for the  V  vector is: "   newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-squares\sum-of-squares-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
