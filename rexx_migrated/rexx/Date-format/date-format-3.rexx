/*�*REXX pgm shows current date:  yyyy-mm-dd  &  Dayofweek, Month dd, yyyy*/
say date('I')                          /*�*yyyy-mm-dd with leading zeroes.*/

say  date('W')","   date('M')   word(date(), 1)","  left(date('S'),4)
/*�* [↑]  dayofweek  Month dd, yyyy*/
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-format\date-format-3.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
