/*ª*REXX program finds the  greatest element  in a list (of the first 25 reversed primes).*/
newV1 = reverse(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97)
say 'list of numbers = '  newV1                      /*ª*show the original list of numbers.   */
big=word(newV1, 1)                                   /*ª*choose an initial biggest number.    */
newV2 = words(newV1);        do j=2  to newV2                /*ª*traipse through the list,  find max. */
big=max(big, word(newV1, j) )   /*ª*use the  MAX  BIF to find the biggie.*/
end   /*ª*j*/
say                                              /*ª*stick a fork in it,  we're all done. */
say 'the biggest value in a list of '     newV2      " numbers is: "     big
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-element-of-a-list\greatest-element-of-a-list-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
