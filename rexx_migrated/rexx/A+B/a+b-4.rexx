/*ª*REXX program obtains some numbers from the input stream (the console), shows their sum*/
numeric digits 1000                              /*ª*just in case the user gets  ka-razy. */
say 'enter some numbers to be summed:'           /*ª*display a prompt message to terminal.*/
parse pull y                                     /*ª*obtain all numbers from input stream.*/
many= words(y)                                   /*ª*obtain the number of numbers entered.*/
newV1= 0                                             /*ª*initialize the sum to zero.          */
do j=1  for many                   /*ª*process each of the numbers.         */
newV1= newV1 + word(y, j)                  /*ª*add one number to the sum.           */
end   /*ª*j*/
/*ª*stick a fork in it,  we're all done. */
say 'sum of '   many   " numbers = "   newV1/1       /*ª*display normalized sum $ to terminal.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\A+B\a+b-4.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
