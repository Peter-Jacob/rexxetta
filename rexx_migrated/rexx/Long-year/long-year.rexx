/*ª*REXX program determines If a (calendar) year is a short or long  year */
/*ª*                                                    (52 or 53 weeks). */
Parse Arg lo hi .                              /*ª* obtain optional args. */
current=left(date('S'),4)
If lo=='' | lo=="," | lo=='*' Then lo=current  /*ª*Not given? Use default.*/
If hi=='' | hi==","           Then hi=lo       /*ª* "    "     "     "    */
If                    hi=='*' Then hi=current  /*ª*an asterisk: current yr*/

Do yr=lo To hi                        /*ª* process single yr  or range of */
Say '     year ' yr ' is a ',
right(word('short long',is_long(yr)+1),5) ' year'
End
Exit
/*ª*----------------------------------------------------------------------*/
wd_1231:
/*ª*************************************************************************
* returns the day of the week of 31 December year
*************************************************************************/
Parse Arg year
Return (year+year%4-year%100+year%400)//7

is_long:
Parse Arg year
Return wd_1231(year)==4 |,    /*ª* year ends in a Thursday              */
wd_1231(year-1)==3     /*ª* or previous year ends in a Wednesday */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-year\long-year.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
