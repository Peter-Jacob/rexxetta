/*ª*REXX program adds 12 hours to a  given date and time, displaying the before and after.*/
aDate = 'March 7 2009 7:30pm EST'               /*ª*the original or base date to be used.*/

parse var aDate mon dd yyyy hhmm tz .            /*ª*obtain the various parts and pieces. */

mins = time('M', hhmm, "C")                    /*ª*get the number minutes past midnight.*/
mins = mins + (12*60)                          /*ª*add  twelve hours  to the  timestamp.*/
nMins = mins // 1440                            /*ª*compute number min into same/next day*/
days = mins %  1440                            /*ª*compute number of days added to dats.*/
aBdays = date('B', dd left(mon,3) yyyy)          /*ª*number of base days since REXX epoch.*/
nBdays = aBdays + days                           /*ª*now,  add the number of days added.  */
nDate = date(,nBdays, 'B')                      /*ª*calculate the new  date  (maybe).    */
nTime = time('C', nMins, "M")                   /*ª*    "      "   "   time     "        */

say aDate ' +  12 hours  â”€â”€â”€â–º '  ndate ntime tz  /*ª*display the new timestamp to console.*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Date-manipulation\date-manipulation.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
