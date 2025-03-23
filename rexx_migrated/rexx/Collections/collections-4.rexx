primeList = '2 3 5 7 11 13 17 19 23 29 31 37 41 43'        /*ª* or Â·Â·Â·  */
primeList =  2 3 5 7 11 13 17 19 23 29 31 37 41 43

/*ª*in this case, the quotes  (')  can be elided.*/

primes= words(primeList)          /*ª*the  WORDS  BIF  counts the number of blankâ”€ */
/*ª*separated words (in this case, prime numbers)*/
/*ª*in the  value  of the variable   "primeList".*/

do j=1  for primes              /*ª*can also be coded as:      do j=1  to primes */
say 'prime'    j    "is"    word(primeList, j)
/*ª*this method  (using the   WORD   BIF) isn't  */
/*ª*very efficient for very large arrays  (those */
/*ª*with many many thousands of elements).       */
end   /*ª*j*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Collections\collections-4.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
