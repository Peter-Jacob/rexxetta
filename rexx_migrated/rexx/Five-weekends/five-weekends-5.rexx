/*ª*REXX program  finds  months  that contain  five weekends   (given a date range).      */
month. =31                                       /*ª*days in "all" the months.            */
month.2=0; month.4=0; month.6=0; month.9=0; month.11=0              /*ª*not 31 day months.*/
month.4=30;  month.6=30; month.9=30; month.11=30 /*ª*all the  months with  thirty-days.   */
parse arg yStart yStop .                         /*ª*get the  "start"  and  "stop"  years.*/
if yStart=='' | yStart==","  then yStart= 1900   /*ª*Not specified?  Then use the default.*/
if yStop =='' | yStop ==","  then yStop = 2100   /*ª* "      "         "   "   "     "    */
years=yStop - yStart + 1                         /*ª*calculate the number of yrs in range.*/
haps=0                                           /*ª*number of five weekends happenings.  */
newV2.=0;                 newV1= 'five-weekend months' /*ª*flag if a year has any five-weekends.*/
do y=yStart  to yStop                     /*ª*process the years specified.         */
do m=1  for 12;  if month.m==0  then iterate       /*ª*only test 31-day months.*/
dat_= y"-"right(m,2,0)'-01'           /*ª*get the date in the desired format.  */
if left(date('W',dat_,"I"),2)\=='Fr'  then iterate     /*ª*isn't not a Friday? */
say 'There are five weekends in'    y     date('M', dat_, "I")
haps=haps+1;   newV2.y=1                  /*ª*bump counter; indicate yr has 5 WE's.*/
end   /*ª*m*/
end      /*ª*y*/
say
say  'There were ' haps " occurrence"s(haps) 'of'  newV1 "in year"s(years)  yStart'â”€â”€â–º'yStop
newV3=0; say
do y=yStart  to yStop;  if newV2.y  then iterate                    /*ª*skip if OK.*/
newV3=newV3+1
say  'Year '    y    " doesn't have any five-weekend months."
end   /*ª*y*/
say
say  "There are " newV3 ' year's(newV3) "that haven't any"  newV1 'in year's(years) yStart'â”€â”€â–º'yStop
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Five-weekends\five-weekends-5.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
