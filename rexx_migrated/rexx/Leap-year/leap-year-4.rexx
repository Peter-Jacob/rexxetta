leapyear:  procedure;  parse arg y          /*ª*year could be: Y, YY, YYY, YYYY*/
if y//4\==0      then return 0              /*ª*Not Ã· by 4?    Not a leap year.*/
if length(y)==2  then y=left(date('S'),2)y  /*ª*adjust for a 2â”€digit  YY  year.*/
return y//100\==0 | y//400==0               /*ª*apply  100 and 400  year rule. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Leap-year\leap-year-4.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
