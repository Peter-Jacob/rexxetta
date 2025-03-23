/*�*REXX program to process  instrument data  from a  data file.                */
numeric digits 20                      /*�*allow for bigger (precision) numbers.*/
ifid='READINGS.TXT'                    /*�*the name of the    input    file.    */
ofid='READINGS.OUT'                    /*�* "    "   "  "     output     "      */
grandSum=0                             /*�*the grand sum of whole file.         */
grandFlg=0                             /*�*the grand number of flagged data.    */
grandOKs=0
Lflag=0                                /*�*the longest period of flagged data.  */
Cflag=0                                /*�*the longest continous flagged data.  */
w=16                                   /*�*the width of fields when displayed.  */

do recs=1  while lines(ifid)\==0     /*�*keep reading records until finished. */
rec=linein(ifid)                     /*�*read the next record (line) of file. */
parse var rec datestamp Idata        /*�*pick off the dateStamp and the data. */
sum=0
flg=0
OKs=0

do j=1  until Idata=''             /*�*process the  instrument  data.       */
parse var Idata data.j flag.j Idata

if flag.j>0 then do                /*�*process good data ···                */
OKs=OKs+1
sum=sum+data.j
if Cflag>Lflag  then do
Ldate=datestamp
Lflag=Cflag
end
Cflag=0
end
else do                /*�*process flagged data ···             */
flg=flg+1
Cflag=Cflag+1
end
end   /*�*j*/

if OKs\==0  then avg=format(sum/OKs,,3)
else avg='[n/a]'
grandOKs=grandOKs+OKs
newV1=right(commas(avg),w)
grandSum=grandSum+sum
grandFlg=grandFlg+flg
if flg==0  then call sy datestamp ' average='newV1
else call sy datestamp ' average='newV1 '  flagged='right(flg,2)
end   /*�*recs*/

recs=recs-1                            /*�*adjust for reading the end─of─file.  */
if grandOKs\==0 then Gavg=format(grandSum/grandOKs,,3)
else Gavg='[n/a]'
call sy
call sy copies('═',60)
call sy '      records read:'   right(commas(recs),     w)
call sy '     grand     sum:'   right(commas(grandSum), w+4)
call sy '     grand average:'   right(commas(Gavg),     w+4)
call sy '     grand OK data:'   right(commas(grandOKs), w)
call sy '     grand flagged:'   right(commas(grandFlg), w)
if Lflag\==0 then call sy '   longest flagged:' right(commas(Lflag),w) " ending at " Ldate
call sy copies('═',60)
exit                                   /*�*stick a fork in it,  we're all done. */
/*�*────────────────────────────────────────────────────────────────────────────*/
commas: procedure;  parse arg newV1;   n=newV1'.9';    newV2=123456789;    b=verify(n,newV2,"M")
e=verify(n,newV2'0',,verify(n,newV2"0.",'M'))-4
do j=e  to b  by -3;   newV1=insert(',',newV1,j);    end  /*�*j*/;     return newV1
/*�*────────────────────────────────────────────────────────────────────────────*/
sy:     say arg(1);               call lineout ofid,arg(1);             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Text-processing-1\text-processing-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
