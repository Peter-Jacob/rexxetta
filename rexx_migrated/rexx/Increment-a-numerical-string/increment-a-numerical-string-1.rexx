/*�*REXX program demonstrates a method how to increment a numerical string*/
count = "3"      /*�*REXX variables (and constants) are character strings.*/
count =  3       /*�*(identical to the above statement.)                  */
count = count+1  /*�*strings in a numerical context are treated as numbers*/
say 'sum=' count /*�*display the value of  COUNT  to the terminal (screen)*/

/*�*────────────────── The default numeric digits for REXX is  9  digits. */
/*�*────────────────── However, that can be increased with NUMERIC DIGITS.*/

numeric digits 15000   /*�*let's go ka-razy with fifteen thousand digits. */

count=copies(2,15000)  /*�*stressing REXX's brains with lots of  two's,   */
/*�*the above is considered a number in REXX.      */
count=count+3          /*�*make that last digit of  COUNT  a  "5".        */

if 1==0  then          /*�*let's not display this gihugeic number to term,*/
say  'count='  count   /*�*ya most likely don't want to display this thing*/

/*�* [↓]  show the six leftmost and rightmost digs.*/
say  'count='  left(count,6)'···'right(count,6)
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Increment-a-numerical-string\increment-a-numerical-string-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
