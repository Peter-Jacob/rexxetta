/*ͺ*REXX program to process  instrument data  from a  data file.                */
numeric digits 20                      /*ͺ*allow for bigger (precision) numbers.*/
ifid='READINGS.TXT'                    /*ͺ*the name of the    input    file.    */
ofid='READINGS.OUT'                    /*ͺ* "    "   "  "     output     "      */
grandSum=0                             /*ͺ*the grand sum of whole file.         */
grandFlg=0                             /*ͺ*the grand number of flagged data.    */
grandOKs=0
Lflag=0                                /*ͺ*the longest period of flagged data.  */
Cflag=0                                /*ͺ*the longest continous flagged data.  */
w=16                                   /*ͺ*the width of fields when displayed.  */

do recs=1  while lines(ifid)\==0     /*ͺ*keep reading records until finished. */
rec=linein(ifid)                     /*ͺ*read the next record (line) of file. */
parse var rec datestamp Idata        /*ͺ*pick off the dateStamp and the data. */
sum=0
flg=0
OKs=0

do j=1  until Idata=''             /*ͺ*process the  instrument  data.       */
parse var Idata data.j flag.j Idata

if flag.j>0 then do                /*ͺ*process good data Β·Β·Β·                */
OKs=OKs+1
sum=sum+data.j
if Cflag>Lflag  then do
Ldate=datestamp
Lflag=Cflag
end
Cflag=0
end
else do                /*ͺ*process flagged data Β·Β·Β·             */
flg=flg+1
Cflag=Cflag+1
end
end   /*ͺ*j*/

if OKs\==0  then avg=format(sum/OKs,,3)
else avg='[n/a]'
grandOKs=grandOKs+OKs
newV1=right(commas(avg),w)
grandSum=grandSum+sum
grandFlg=grandFlg+flg
if flg==0  then call sy datestamp ' average='newV1
else call sy datestamp ' average='newV1 '  flagged='right(flg,2)
end   /*ͺ*recs*/

recs=recs-1                            /*ͺ*adjust for reading the endβofβfile.  */
if grandOKs\==0 then Gavg=format(grandSum/grandOKs,,3)
else Gavg='[n/a]'
call sy
call sy copies('β',60)
call sy '      records read:'   right(commas(recs),     w)
call sy '     grand     sum:'   right(commas(grandSum), w+4)
call sy '     grand average:'   right(commas(Gavg),     w+4)
call sy '     grand OK data:'   right(commas(grandOKs), w)
call sy '     grand flagged:'   right(commas(grandFlg), w)
if Lflag\==0 then call sy '   longest flagged:' right(commas(Lflag),w) " ending at " Ldate
call sy copies('β',60)
exit                                   /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: procedure;  parse arg newV1;   n=newV1'.9';    newV2=123456789;    b=verify(n,newV2,"M")
e=verify(n,newV2'0',,verify(n,newV2"0.",'M'))-4
do j=e  to b  by -3;   newV1=insert(',',newV1,j);    end  /*ͺ*j*/;     return newV1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sy:     say arg(1);               call lineout ofid,arg(1);             return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Text-processing-1\text-processing-1.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
