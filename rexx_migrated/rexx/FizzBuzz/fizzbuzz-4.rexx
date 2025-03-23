/*ª*REXX program displays numbers  1 â”€â”€â–º 100  (some transformed) for the FizzBuzz problem.*/
/*ª* [â†“]  concise, but somewhat obtuse.  */
do j=1  for 100
say right(word(word('Fizz', 1+(j//3\==0))word('Buzz', 1+(j//5\==0)) j, 1), 8)
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\FizzBuzz\fizzbuzz-4.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
