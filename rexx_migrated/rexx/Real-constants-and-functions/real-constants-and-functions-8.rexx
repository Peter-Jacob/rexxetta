numeric digits ddd               /*ª*sets the current precision to  DDD   */
numeric fuzz   fff               /*ª*arithmetic comparisons with FFF fuzzy*/
numeric form   kkk               /*ª*exponential: scientific | engineering*/

low=min(a,b,c,d,e,f,g, ...)      /*ª*finds the min of specified arguments.*/
big=min(a,b,c,d,e,f,g, ...)      /*ª*finds the max of specified arguments.*/

rrr=random(low,high)             /*ª*gets a random integer from LOW-->HIGH*/
arr=random(low,high,seed)        /*ª* ... with a seed (to make repeatable)*/

mzp=sign(x)                      /*ª*finds the sign of  x   (-1, 0, +1).  */

fs=format(x)                    /*ª*formats X  with the current DIGITS() */
fb=format(x,bbb)                /*ª*            BBB  digs  before decimal*/
fa=format(x,bbb,aaa)            /*ª*            AAA  digs  after  decimal*/
fa=format(x,,0)                 /*ª*            rounds  X  to an integer.*/
fe=format(x,,eee)               /*ª*            exponent has eee places. */
ft=format(x,,eee,ttt)           /*ª*if x exceeds TTT digits, force exp.  */

hh=b2x(bbb)                      /*ª*converts binary/bits to hexadecimal. */
dd=c2d(ccc)                      /*ª*converts character   to decimal.     */
hh=c2x(ccc)                      /*ª*converts character   to hexadecimal. */
cc=d2c(ddd)                      /*ª*converts decimal     to character.   */
hh=d2x(ddd)                      /*ª*converts decimal     to hexadecimal. */
bb=x2b(hhh)                      /*ª*converts hexadecimal to binary (bits)*/
cc=x2c(hhh)                      /*ª*converts hexadecimal to character.   */
dd=x2d(hhh)                      /*ª*converts hexadecimal to decimal.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Real-constants-and-functions\real-constants-and-functions-8.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
