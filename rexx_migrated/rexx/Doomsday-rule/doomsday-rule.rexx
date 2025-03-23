/*�*REXX program finds the day─of─week for a specified date using Conway's Doomsday rule. */
parse arg newV1                                      /*�*obtain optional arguments from the CL*/
if newV1='' | newV1=","  then newV1=  ,                      /*�*Not specified?  Then use the default.*/
'01/06/1800 03/29/1875 12/07/1915 12/23/1970 05/14/2043 04/02/2077 04/02/2101'
d= 'Sun Mon Tues Wednes Thurs Fri Satur'         /*�*list of days of the week, sans "day".*/
y.0= 3 7 7 4 2 6 4 1 5 3 7 5                     /*�*doomsday dates for non-leapyear month*/
y.1= 4 1 7 4 2 6 4 1 5 3 7 5                     /*�*    "      "    "      leapyear   "  */

do j=1  for words(newV1);        datum= word(newV1, j)    /*�*process each of the dates.    */
parse var  datum    mm  '/'  dd  "/"  yy          /*�*parse the date  ──►  mm dd yy */
ly= leapyear(yy)                                  /*�*get indication of a leapyear. */
wd= (doomsday(yy)+dd-word(y.ly, mm) + 7) // 7 + 1 /*�*obtain a code for the weekday.*/
say datum    ' falls on '    word(d, wd)"day"     /*�*display day-of-week for date. */
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
doomsday: parse arg newV2;  return (2  +  5 * (newV2//4)  +  4 * (newV2//100)  +  6 * (newV2//400) ) // 7
leapyear: arg #; ly= #//4==0; if ly==0  then return 0;   return ((#//100\==0) | #//400==0)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Doomsday-rule\doomsday-rule.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
