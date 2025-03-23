/*ª*REXX program displays a char's ASCII code/value (or EBCDIC if run on an EBCDIC system)*/
yyy= 'c'                               /*ª*assign a lowercase       c        to   YYY.    */
yyy= "c"                               /*ª* (same as above)                               */
say  'from char, yyy code=' yyy

yyy= '63'x                             /*ª*assign hexadecimal      63        to   YYY.    */
yyy= '63'X                             /*ª* (same as above)                               */
say  'from  hex, yyy code=' yyy

yyy= x2c(63)                           /*ª*assign hexadecimal      63        to   YYY.    */
say  'from  hex, yyy code=' yyy

yyy= '01100011'b                       /*ª*assign a binary      0011 0100    to   YYY.    */
yyy= '0110 0011'b                      /*ª* (same as above)                               */
yyy= '0110 0011'B                      /*ª*   "   "    "                                  */
say  'from  bin, yyy code=' yyy

yyy= d2c(99)                           /*ª*assign decimal code     99        to   YYY.    */
say  'from  dec, yyy code=' yyy

say                                    /*ª*     [â†“]    displays the value of  YYY  in Â·Â·Â· */
say  'char code: '   yyy               /*ª* character code  (as an 8-bit ASCII character).*/
say  ' hex code: '   c2x(yyy)          /*ª*    hexadecimal                                */
say  ' dec code: '   c2d(yyy)          /*ª*        decimal                                */
say  ' bin code: '   x2b( c2x(yyy) )   /*ª*         binary  (as a bit string)             */
/*ª*stick a fork in it, we're all done with display*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Character-codes\character-codes-1.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
