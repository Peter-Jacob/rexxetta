/*ช*REXX program displays in which  years  12/25  (December 25th)   falls on a  Sunday.   */
parse arg start finish .                         /*ช*get the  START  and  FINISH  years.  */
if  start=='' |  start==","  then  start=2008    /*ช*Not specified?  Then use the default.*/
if finish=='' | finish==","  then finish=2121    /*ช* "       "        "   "   "     "    */

do y=start  to finish                      /*ช*process all the years specified.     */

if date('Weekday', y"-12-25", 'ISO')\=='Sunday'  then iterate

/*ช* if date('w'      , y"-12-25", 'i'  ) ยทยทยท       (same as above).  */
/*ช*          โโโโโโ   โโโโโโโโโโ  โโโ                                */
/*ช*          option   yyyy-mm-dd  fmt                                */

say 'December 25th,'    y    "falls on a Sunday."
end   /*ช*y*/
/*ช*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Day-of-the-week\day-of-the-week-3.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
