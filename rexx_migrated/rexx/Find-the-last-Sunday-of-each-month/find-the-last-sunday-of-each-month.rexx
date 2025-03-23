/*�*REXX program displays dates of last Sundays of each month for any year*/
parse arg yyyy
do j=1 for  12
newV1 = lastDOW('Sunday', j, yyyy)
say right(newV1,4)'-'right(j,2,0)"-"left(word(newV1,2),2)
end  /*�*j*/
exit                                   /*�*stick a fork in it, we're done.*/
/*�*┌────────────────────────────────────────────────────────────────────┐
│ lastDOW:  procedure to return the date of the  last day-of-week of │
│           any particular month  of any particular year.            │
│                                                                    │
│ The  day-of-week  must be specified (it can be in any case,        │
│ (lower-/mixed-/upper-case)  as an English name of the spelled day  │
│ of the week,   with a minimum length that causes no ambiguity.     │
│ I.E.:   W  for Wednesday,   Sa  for Saturday,   Su  for Sunday ... │
│                                                                    │
│ The month can be specified as an integer   1 ──► 12                │
│    1=January     2=February     3=March     ...     12=December    │
│ or the English  name  of the month,  with a minimum length that    │
│ causes no ambiguity.    I.E.:  Jun  for June,   D  for December.   │
│ If omitted  [or an asterisk(*)],  the current month is used.       │
│                                                                    │
│ The year is specified as an integer or just the last two digits    │
│ (two digit years are assumed to be in the current century,  and    │
│ there is no windowing for a two-digit year).                       │
│ If omitted  [or an asterisk(*)],  the current year is used.        │
│ Years < 100   must be specified with  (at least 2)  leading zeroes.│
│                                                                    │
│ Method used: find the "day number" of the 1st of the next month,   │
│ then subtract one  (this gives the "day number" of the last day of │
│ the month,  bypassing the leapday mess).   The last day-of-week is │
│ then obtained straightforwardly,   or  via subtraction.            │
└────────────────────────────────────────────────────────────────────┘*/
lastdow: procedure; arg dow .,mm .,yy .              /*�*DOW = day of week*/
parse arg a.1,a.2,a.3                                /*�*orig args, errmsg*/
if mm=='' | mm=='*' then mm=left(date('U'),2)        /*�*use default month*/
if yy=='' | yy=='*' then yy=left(date('S'),4)        /*�*use default year */
if length(yy)==2 then yy=left(date('S'),2)yy         /*�*append century.  */
/*�*Note mandatory leading blank in strings below.*/
newV2=" Monday TUesday Wednesday THursday Friday SAturday SUnday"
newV3=" JAnuary February MARch APril MAY JUNe JULy AUgust September",
" October November December"
upper newV2 newV3                                            /*�*uppercase strings*/
if dow==''                 then call .er "wasn't specified",1
if arg()>3                 then call .er 'arguments specified',4

do j=1 for 3                                       /*�*any plural args ?*/
if words(arg(j))>1       then call .er 'is illegal:',j
end

dw=pos(' 'dow,newV2)                                     /*�*find  day-of-week*/
if dw==0                   then call .er 'is invalid:',1
if dw\==lastpos(' 'dow,newV2)  then call .er 'is ambigious:',1

if datatype(mm,'month') then                         /*�*if MM is alpha...*/
do
m=pos(' 'mm,newV3)                                     /*�*maybe its good...*/
if m==0                  then call .er 'is invalid:',1
if m\==lastpos(' 'mm,newV3)  then call .er 'is ambigious:',2
mm=wordpos(word(substr(newV3,m),1),newV3)-1                /*�*now, use true Mon*/
end

if \datatype(mm,'W')       then call .er "isn't an integer:",2
if \datatype(yy,'W')       then call .er "isn't an integer:",3
if mm<1 | mm>12            then call .er "isn't in range 1──►12:",2
if yy=0                    then call .er "can't be 0 (zero):",3
if yy<0                    then call .er "can't be negative:",3
if yy>9999                 then call .er "can't be > 9999:",3

tdow=wordpos(word(substr(newV2,dw),1),newV2)-1               /*�*target DOW, 0──►6*/
/*�*day# of last dom.*/
newV1=date('B',right(yy+(mm=12),4)right(mm//12+1,2,0)"01",'S')-1
newV4=newV1//7                                               /*�*calc. DOW,  0──►6*/
if newV4\==tdow then newV1=newV1-newV4-7+tdow+7*(newV4>tdow)             /*�*not DOW?  Adjust.*/
return date('weekday',newV1,"B") date(,newV1,'B')            /*�*return the answer*/

.er: arg ,newV1;say; say '***error!*** (in LASTDOW)';say /*�*tell error,  and */
say word('day-of-week month year excess',arg(2)) arg(1) a.newV1
say; exit 13                                       /*�*... then exit.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-the-last-Sunday-of-each-month\find-the-last-sunday-of-each-month.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
