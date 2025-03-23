leapyear:  procedure;   parse arg yr
if yr//4\==0  then return 0                 /*ช*Not รท by 4?    Not a leap year.*/
return  yr//400==0  |  yr//100\==0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Leap-year\leap-year-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
