/*ช*REXX program (old school) displays in which years 12/25 (Dec. 25th) falls on a Sunday.*/
parse arg start finish .                         /*ช*get the  START  and  FINISH  years.  */
if  start=='' |  start==","  then  start=2008    /*ช*Not specified?  Then use the default.*/
if finish=='' | finish==","  then finish=2121    /*ช* "       "        "   "   "     "    */

do y=start  to finish                      /*ช*process all the years specified.     */
if dow(12,25,y)==1  then say 'December 25th,'       y       "falls on a Sunday."
end   /*ช*y*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
dow: procedure; parse arg m,d,y;                 if m<3  then do;  m= m+12;  y= y-1;  end
yL= left(y, 2);      yr= right(y, 2);  w= (d + (m+1)*26%10 +yr +yr%4 +yL%4 +5*yL) //7
if w==0  then w= 7;  return w               /*ช*Sunday=1,  Monday=2,  ยทยทยท  Saturday=7*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Day-of-the-week\day-of-the-week-4.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
