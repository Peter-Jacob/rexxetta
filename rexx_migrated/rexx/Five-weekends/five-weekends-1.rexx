/*�*REXX program  finds  months  that contain  five weekends   (given a date range).      */
month. =31;  month.2=0                           /*�*month days;   February is skipped.   */
month.4=30;  month.6=30; month.9=30; month.11=30 /*�*all the  months with  thirty-days.   */
parse arg yStart yStop .                         /*�*get the  "start"  and  "stop"  years.*/
if yStart=='' | yStart==","  then yStart= 1900   /*�*Not specified?  Then use the default.*/
if yStop =='' | yStop ==","  then yStop = 2100   /*�* "      "         "   "   "     "    */
years=yStop - yStart + 1                         /*�*calculate the number of yrs in range.*/
haps=0                                           /*�*number of five weekends happenings.  */
newV2.=0;                 newV1= 'five-weekend months' /*�*flag if a year has any five-weekends.*/
do y=yStart to yStop                      /*�*process the years specified.         */
do m=1  for 12;    wd.=0              /*�*process each month and also each year*/
do d=1  for month.m;  dat_= y"-"right(m,2,0)'-'right(d,2,0)
parse  upper  value   date('W', dat_, "I")    with    newV3 3
wd.newV3=wd.newV3+1                     /*�*?  is the first two chars of weekday.*/
end   /*�*d*/                     /*�*WD.su = number of Sundays in a month.*/
if wd.su\==5 | wd.fr\==5 | wd.sa\==5 then iterate           /*�*five weekends ?*/
say 'There are five weekends in'   y   date('M', dat_, "I")
haps=haps+1;   newV2.y=1                  /*�*bump counter; indicate yr has 5 WE's.*/
end         /*�*m*/
end             /*�*y*/
say
say "There were "  haps ' occurrence's(haps) "of"  newV1 'in year's(years)  yStart"──►"yStop
say; newV4=0
do y=yStart  to yStop;   if newV2.y  then iterate                    /*�*skip if OK.*/
newV4=newV4+1;        say  'Year '    y    " doesn't have any" newV1em'.'
end   /*�*y*/
say
say  "There are "  newV4 ' year's(newV4) "that haven't any" newV1 'in year's(years) yStart'──►'yStop
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s: if arg(1)==1  then return arg(3);      return word(arg(2) 's',1)        /*�*pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Five-weekends\five-weekends-1.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
