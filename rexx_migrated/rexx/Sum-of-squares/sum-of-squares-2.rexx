/*�*REXX program  sums  the squares of the numbers  in a (numeric)  vector of 15 numbers. */
numeric digits 100                               /*�*allow 100─digit numbers; default is 9*/
parse arg v                                      /*�*get optional numbers from the C.L.   */
if v=''  then v= -100 9 8 7 6 0 3 4 5 2 1 .5 10 11 12      /*�*Not specified?  Use default*/
newV1=words(v)                                                 /*�*obtain number of words in V*/
say 'The vector of '    newV1     " elements is: "   space(v)  /*�*display the vector numbers.*/
newV2= 0                                             /*�*initialize the  sum  ($)  to zero.   */
do  until v=='';   parse var v x v  /*�*process each number in the V vector. */
newV2=newV2 + x**2                          /*�*add a squared element to the ($) sum.*/
end   /*�*until*/                     /*�* [↑]  if vector is empty, then sum=0.*/
say                                              /*�*stick a fork in it,  we're all done. */
say 'The sum of '       newV1     " squared elements for the  V  vector is: "      newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-of-squares\sum-of-squares-2.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
