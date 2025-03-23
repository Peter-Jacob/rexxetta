/*ª* REXX */
yyy='c'               /*ª*assign a lowercase   c to  YYY */
yyy='83'x             /*ª*assign hexadecimal  83 to  YYY */
/*ª*the  X  can be upper/lowercase.*/
yyy=x2c(83)           /*ª* (same as above)               */
yyy='10000011'b       /*ª* (same as above)               */
yyy='1000 0011'b      /*ª* (same as above)               */
/*ª*the  B  can be upper/lowercase.*/
yyy=d2c(129)          /*ª*assign decimal code 129 to YYY */

say yyy               /*ª*displays the value of  YYY                   */
say c2x(yyy)          /*ª*displays the value of  YYY in hexadecimal.   */
say c2d(yyy)          /*ª*displays the value of  YYY in decimal.       */
say x2b(c2x(yyy))/*ª*displays the value of YYY in binary (bit string). */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Character-codes\character-codes-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
