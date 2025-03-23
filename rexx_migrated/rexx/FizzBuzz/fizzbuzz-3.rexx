/*ª*REXX program displays numbers  1 â”€â”€â–º 100  (some transformed) for the FizzBuzz problem.*/

do j=1  for 100;  newV1=
if j//3 ==0  then newV1=newV1'Fizz'
if j//5 ==0  then newV1=newV1'Buzz'
/*ª* if j//7 ==0  then _=_'Jazz' */                /*ª* â—„â”€â”€â”€ note that this is a comment.   */
say right(word(newV1 j,1),8)
end   /*ª*j*/                                   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\FizzBuzz\fizzbuzz-3.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
