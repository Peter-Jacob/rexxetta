/*ͺ*REXX program to process  instrument data  from a  data file.                */
numeric digits 20                      /*ͺ*allow for bigger numbers.            */
ifid='READINGS.TXT'                    /*ͺ*name of the   input  file.           */
ofid='READINGS.OUT'                    /*ͺ*  "   "  "   output    "             */
grandSum=0                             /*ͺ*grand sum of the whole file.         */
grandFlg=0                             /*ͺ*grand number of flagged data.        */
grandOKs=0
Lflag=0                                /*ͺ*longest period of flagged data.      */
Cflag=0                                /*ͺ*longest continuous flagged data.     */
oldDate =0                             /*ͺ*placeholder of penultimate date.     */
w       =16                            /*ͺ*width of fields when displayed.      */
dupDates=0                             /*ͺ*count of duplicated timestamps.      */
badFlags=0                             /*ͺ*count of bad flags  (not integer).   */
badDates=0                             /*ͺ*count of bad dates  (bad format).    */
badData =0                             /*ͺ*count of bad data   (not numeric).   */
ignoredR=0                             /*ͺ*count of ignored records, bad records*/
maxInstruments=24                      /*ͺ*maximum number of instruments.       */
yyyyCurr=right(date(),4)               /*ͺ*get the current year (today).        */
monDD.  =31                            /*ͺ*number of days in every month.       */
/*ͺ*# days in Feb. is figured on the fly.*/
monDD.4 =30
monDD.6 =30
monDD.9 =30
monDD.11=30

do records=1  while lines(ifid)\==0  /*ͺ*read until finished.                 */
rec=linein(ifid)                     /*ͺ*read the next record (line).         */
parse var rec datestamp Idata        /*ͺ*pick off the the dateStamp and data. */
if datestamp==oldDate  then do       /*ͺ*found a duplicate timestamp.         */
dupDates=dupDates+1   /*ͺ*bump the dupDate counter*/
call sy datestamp copies('~',30),
'is a duplicate of the',
"previous datestamp."
ignoredR=ignoredR+1     /*ͺ*bump # of ignoredRecs.*/
iterate  /*ͺ*ignore this duplicate record.        */
end

parse var datestamp yyyy '-' mm '-' dd   /*ͺ*obtain YYYY, MM, and the DD.     */
monDD.2=28+leapyear(yyyy)            /*ͺ*how long is February in year  YYYY ? */
/*ͺ*check for various bad formats.       */
if verify(yyyy||mm||dd,1234567890)\==0 |,
length(datestamp)\==10   |,
length(yyyy)\==4         |,
length(mm  )\==2         |,
length(dd  )\==2         |,
yyyy<1970                |,
yyyy>yyyyCurr            |,
mm=0  | dd=0             |,
mm>12 | dd>monDD.mm  then do
badDates=badDates+1
call sy datestamp copies('~'),
'has an illegal format.'
ignoredR=ignoredR+1  /*ͺ*bump number ignoredRecs.*/
iterate              /*ͺ*ignore this bad record. */
end
oldDate=datestamp                    /*ͺ*save datestamp for the next read.    */
sum=0
flg=0
OKs=0

do j=1  until Idata=''             /*ͺ*process the instrument data.         */
parse var Idata data.j flag.j Idata

if pos('.',flag.j)\==0 |,          /*ͺ*does flag have a decimal point  -or- */
\datatype(flag.j,'W')  then do  /*ͺ* Β·Β·Β· is the flag not a whole number? */
badFlags=badFlags+1 /*ͺ*bump badFlags counter*/
call sy datestamp copies('~'),
'instrument' j "has a bad flag:",
flag.j
iterate       /*ͺ*ignore it and it's data.   */
end

if \datatype(data.j,'N')  then do  /*ͺ*is the flag not a whole number?*/
badData=badData+1      /*ͺ*bump counter.*/
call sy datestamp copies('~'),
'instrument' j "has bad data:",
data.j
iterate       /*ͺ*ignore it & it's flag.*/
end

if flag.j>0  then do               /*ͺ*if good data, ~~~                    */
OKs=OKs+1
sum=sum+data.j
if Cflag>Lflag  then do
Ldate=datestamp
Lflag=Cflag
end
Cflag=0
end
else do               /*ͺ*flagged data ~~~                     */
flg=flg+1
Cflag=Cflag+1
end
end   /*ͺ*j*/

if j>maxInstruments then do
badData=badData+1       /*ͺ*bump the badData counter.*/
call sy datestamp copies('~'),
'too many instrument datum'
end

if OKs\==0  then avg=format(sum/OKs,,3)
else avg='[n/a]'
grandOKs=grandOKs+OKs
newV1=right(commas(avg),w)
grandSum=grandSum+sum
grandFlg=grandFlg+flg
if flg==0  then  call sy datestamp ' average='newV1
else  call sy datestamp ' average='newV1 '  flagged='right(flg,2)
end   /*ͺ*records*/

records=records-1                      /*ͺ*adjust for reading the  endβofβfile. */
if grandOKs\==0  then grandAvg=format(grandsum/grandOKs,,3)
else grandAvg='[n/a]'
call sy
call sy copies('=',60)
call sy '      records read:'  right(commas(records ),w)
call sy '   records ignored:'  right(commas(ignoredR),w)
call sy '     grand     sum:'  right(commas(grandSum),w+4)
call sy '     grand average:'  right(commas(grandAvg),w+4)
call sy '     grand OK data:'  right(commas(grandOKs),w)
call sy '     grand flagged:'  right(commas(grandFlg),w)
call sy '   duplicate dates:'  right(commas(dupDates),w)
call sy '         bad dates:'  right(commas(badDates),w)
call sy '         bad  data:'  right(commas(badData ),w)
call sy '         bad flags:'  right(commas(badFlags),w)
if Lflag\==0 then call sy '   longest flagged:' right(commas(LFlag),w) " ending at " Ldate
call sy copies('=',60)
exit                                   /*ͺ*stick a fork in it,  we're all  done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: procedure;  parse arg newV1;   n=newV1'.9';    newV2=123456789;    b=verify(n,newV2,"M")
e=verify(n,newV2'0',,verify(n,newV2"0.",'M'))-4
do j=e  to b  by -3;   newV1=insert(',',newV1,j);    end  /*ͺ*j*/;     return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
leapyear: procedure; arg y             /*ͺ*year could be:  Y,  YY,  YYY, or YYYY*/
if length(y)==2 then y=left(right(date(),4),2)y      /*ͺ*adjust for   YY   year.*/
if y//4\==0     then return 0          /*ͺ* not divisible by 4?   Not a leapyear*/
return y//100\==0 | y//400==0          /*ͺ*apply the 100  and the 400 year rule.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sy:     say arg(1);               call lineout ofid,arg(1);             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Text-processing-2\text-processing-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
