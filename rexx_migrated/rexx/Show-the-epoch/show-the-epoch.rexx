/*ช*REXX program displays the number of days since the epoch for the DATE function (BIF). */

say '     today is: '  date()                    /*ช*today's is format:     mm MON YYYY   */

days=date('Basedate')                            /*ช*only the first char of option is used*/
say right(days, 40)         " days since the REXX base date of January 1st, year 1"

say ' and today is: '  date(, days, "B")         /*ช*it should still be today (ยตSec later)*/
/*ช*   โ                โโโโโโโโ This BIF (Built-In Function) is only */
/*ช*   โโโโโโโโโโโโโโโโโโ        for  newer  versions of  REXX  that  */
/*ช*                             support the  2nd and 3rd  arguments. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Show-the-epoch\show-the-epoch.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
