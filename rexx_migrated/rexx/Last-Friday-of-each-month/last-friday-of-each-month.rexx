/*�*REXX program displays the dates of the  last Fridays of each month for any given year.*/
parse arg yyyy                                   /*�*obtain optional argument from the CL.*/
do j=1  for 12                  /*�*traipse through all the year's months*/
say lastDOW('Friday', j, yyyy)  /*�*find last Friday for the  Jth  month.*/
end  /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
lastDOW: procedure;  arg dow .,mm .,yy .;      parse arg a.1,a.2,a.3 /*�*DOW = day of week*/
if mm=='' | mm=='*'  then mm= left( date('U'), 2)                    /*�*use default month*/
if yy=='' | yy=='*'  then yy= left( date('S'), 4)                    /*�*use default year */
if length(yy)==2     then yy= left( date('S'), 2)yy                  /*�*append century.  */
/*�*Note mandatory leading blank in strings below*/
newV1=" Monday TUesday Wednesday THursday Friday SAturday SUnday"
newV2=" JAnuary February MARch APril MAY JUNe JULy AUgust September October November December"
upper newV1 newV2                                                            /*�*uppercase strings*/
if dow==''                 then call .er "wasn't specified",     1   /*�*no month given ? */
if arg()>3                 then call .er 'arguments specified',  4   /*�*too many args  ? */

do j=1  for 3                                                      /*�*any plural args ?*/
if words( arg(j) ) > 1   then call .er 'is illegal:',   j          /*�*check if plural. */
end
/*�*find DOW in list.*/
dw= pos(' 'dow, newV1)                                                   /*�*find  day-of-week*/
if dw==0                   then call .er 'is invalid:'  , 1          /*�*no DOW was found?*/
if dw\==lastpos(' 'dow,newV1)  then call .er 'is ambiguous:', 1          /*�*check min length.*/

if datatype(mm, 'M')  then do                                        /*�*is MM alphabetic?*/
m= pos(' 'mm, newV2)                          /*�*maybe its good...*/
if m==0                   then call .er 'is invalid:'  ,   1
if m\==lastpos(' 'mm,newV2)   then call .er 'is ambiguous:',   2
mm= wordpos( word( substr(newV2,m), 1), newV2)-1  /*�*now, use true Mon*/
end

if \datatype(mm, 'W')   then call .er "isn't an integer:",       2   /*�*MM (mon) ¬integer*/
if \datatype(yy, 'W')   then call .er "isn't an integer:",       3   /*�*YY (yr)  ¬integer*/
if mm<1 | mm>12         then call .er "isn't in range 1──►12:",  2   /*�*MM out─of─range. */
if yy=0                 then call .er "can't be 0 (zero):",      3   /*�*YY can't be zero.*/
if yy<0                 then call .er "can't be negative:",      3   /*�* "   "    " neg. */
if yy>9999              then call .er "can't be > 9999:",        3   /*�* "   "    " huge.*/

tdow= wordpos( word( substr(newV1, dw), 1), newV1) - 1                       /*�*target DOW, 0──►6*/
/*�*day# of last dom.*/
newV3= date('B', right(yy + (mm=12), 4)right(mm // 12 + 1,  2, 0)"01", 'S') - 1
newV4= newV3 // 7                                                            /*�*calc. DOW,  0──►6*/
if newV4\==tdow  then newV3= newV3  -  newV4  -  7  +  tdow  +  7 * (newV4>tdow)         /*�*not DOW?  Adjust.*/
return date('weekday', newV3, "B")    date(, newV3, 'B')                     /*�*return the answer*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.er: arg ,newV3;   say;    say '***error*** (in LASTDOW)';        say    /*�*tell error,  and */
say word('day-of-week month year excess', arg(2))  arg(1)  a.newV3  /*�*plug in a choice.*/
say;      exit 13                                               /*�*··· then exit.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Last-Friday-of-each-month\last-friday-of-each-month.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
