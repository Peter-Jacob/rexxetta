/*�*REXX program  finds  months  that contain  five weekends   (given a date range).      */
month. =31;  month,2=0                           /*�*month days;   February is skipped.   */
month.4=30;  month.6=30; month.9=30; month.11=30 /*�*all the  months with  thirty-days.   */
newV1='January February March April May June July August September October November December'
parse arg yStart yStop .                         /*�*get the  "start"  and  "stop"  years.*/
if yStart=='' | yStart==","  then yStart= 1900   /*�*Not specified?  Then use the default.*/
if yStop =='' | yStop ==","  then yStop = 2100   /*�* "      "         "   "   "     "    */
years=yStop - yStart + 1                         /*�*calculate the number of yrs in range.*/
haps=0                                           /*�*number of five weekends happenings.  */
newV3.=0;                 newV2= 'five-weekend months' /*�*flag if a year has any five-weekends.*/
do y=yStart to yStop                      /*�*process the years specified.         */
do m=1  for 12;    wd.=0              /*�*process each month and also each year*/
do d=1  for month.m
newV4=dow(m,d,y)                    /*�*get the  day-of-week  for  mm/dd/yyyy*/
wd.newV4=wd.newV4+1                     /*�*?:   1=Sun,  2=Mon, 3=Tue ∙∙∙  7=Sat.*/
end   /*�*d*/
if wd.1\==5 | wd.6\==5 | wd.7\==5  then iterate            /*�*not a weekend ? */
say 'There are five weekends in'   y   word(newV1, m)
haps=haps+1;   newV3.y=1                  /*�*bump counter; indicate yr has 5 WE's.*/
end         /*�*m*/
end              /*�*y*/
say
say  'There were ' haps " occurrence"s(haps) 'of'  newV2 "in year"s(years)  yStart'──►'yStop
newV5=0; say
do y=yStart  to yStop;  if newV3.y  then iterate                    /*�*skip if OK.*/
newV5=newV5+1
say  'Year '    y    " doesn't have any five-weekend months."
end   /*�*y*/
say
say  "There are " newV5 ' year's(newV5) "that haven't any"  newV2 'in year's(years) yStart'──►'yStop
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dow:  procedure;  parse arg m,d,y;           if m<3 then  do;  m=m+12;  y=y-1;  end
yL=left(y,2);    yr=right(y,2);        w=(d+(m+1)*26%10+yr+yr%4+yL%4+5*yL) // 7
if w==0 then w=7;     return w            /*�*Sunday=1,  Monday=2, ...  Saturday=7 */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:    if arg(1)==1  then return arg(3);      return word(arg(2) 's',1)     /*�*pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Five-weekends\five-weekends-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
