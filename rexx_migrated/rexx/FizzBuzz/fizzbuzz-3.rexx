/*�*REXX program displays numbers  1 ──► 100  (some transformed) for the FizzBuzz problem.*/

do j=1  for 100;  newV1=
if j//3 ==0  then newV1=newV1'Fizz'
if j//5 ==0  then newV1=newV1'Buzz'
/*�* if j//7 ==0  then _=_'Jazz' */                /*�* ◄─── note that this is a comment.   */
say right(word(newV1 j,1),8)
end   /*�*j*/                                   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\FizzBuzz\fizzbuzz-3.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
