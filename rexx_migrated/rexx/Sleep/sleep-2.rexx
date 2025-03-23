/*�*REXX program delays (or SLEEPS) a number of whole seconds; fractional secs are ignored*/
trace off                                              /*�*suppress REXX error messages.  */
parse arg newV30                                            /*�*obtain all the arguments.      */
if newV30all(arg()) then exit                               /*�*documentation requested ?      */
if newV30cms  then address ''                               /*�*if CMS, then use fast cmd path.*/
signal on halt                                         /*�*handle  HALT  gracefully.      */
signal on noValue                                      /*�*handle the REXX noValue error. */
signal on syntax                                       /*�*handle the REXX syntax errors. */

/*�*┌────────────────────────────────────────────────────────────────────┐
┌─┘ The  DELAY  function is used to delay (wait) a specific amount of  └─┐
│ (wall-clock)  time specified in seconds.  Any fraction part is ignored.│
│                                                                        │
│ If the REXX program invoking  DELAY  function is running under PC/REXX │
│ or  Personal REXX,  this REXX program should never be invoked as those │
└─┐ REXXes have their own built-in function (BIF)  named   "DELAY".    ┌─┘
└────────────────────────────────────────────────────────────────────┘*/

newV1  = 'CP SLEEP'                                 /*�*point to the (CP) SLEEP command*/
newV8     = 'PING'                                     /*�*  "    "  "  DOS  PING     "   */

parse var newV30 n newV31                                        /*�*parse argument from the parms. */
if newV31\=='' | arg()>1  then call er 59                   /*�*are there too many arguments ? */
if n==''             then n=1                          /*�*No args?  Then assume  1 second*/
if \isNum(n)  then call er 53,n 'delay-seconds'        /*�*is   n   not numeric?   Error. */
n=n%1                                                  /*�*elide any fractional second.   */
if n<=0  then return 0
/*�* ┌────────────────────┐ */
/*�* │ delay  n  seconds. │ */
/*�* └────────────────────┘ */
select
when newV30cms     then newV1  n%1  "SEC"              /*�*is this CMS?  Then use CP SLEEP*/
when newV19     then call sleep n%1                    /*�* "   "  TSO?    "   "  SLEEP   */
when newV6  then call sleep n%1                    /*�* "   " Regina?  "   "    "     */
when newV21     then newV8 '-n' n "127.0.0.1 > NUL"    /*�* "   "  DOS?    "   "   PING   */
otherwise          nop
end   /*�*select*/

return 0                                               /*�*return a zero value to invoker.*/
/*�*─────────────────────────────general 1─line subroutines───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────*/
newV30all:  newV30newV30=newV30;newV30=space(newV30);upper newV30;call newV15;newV23=right(newV30var('OS'),2)=="NT";newV11=word('CLS VMFCLEAR CLRSCREEN',1+newV30cms+newV19*2);if arg(1)\==1 then return 0;if wordpos(newV30,"? ?SAMPLES ?AUTHOR ?FLOW")==0 then return 0;newV9=']$H';call "$H" newV24 newV30;newV9=;return 1
newV30cal:    if symbol('!CALL')\=="VAR"  then newV9=;        return newV9
newV12:    newV12='ENVIRONMENT'; if newV13=="MSDOS" | newV7 | newV27 | newV17  then newV12='SYSTEM';  if newV18  then newV12="OS2"newV12;  newV3=3=='f3'x;  if newV22  then newV12="DOS";      return
newV15:    parse upper source newV13 newV14 newV15 . 1 . . newV24 newV25 newV26 .;  call newV13;  if newV21  then do;  newV31=lastpos('\',newV24);  newV26=left(newV24,newV31);  newV24=substr(newV24,newV31+1); parse var newV24 newV24 "." newV25; end;   return word(0 newV24 newV25 newV26, 1+('0'arg(1)))
newV30rex:    parse upper version newV16 newV4 newV2 .;  newV7='BY'==newV4;  newV10="KEXX"==newV16;  newV5='REXX/PERSONAL'==newV16 | "REXX/PC"==newV16;  newV27='REXX-R4'==newV16;  newV6="REXX-REGINA"==left(newV16,11);  newV17='REXX-ROO'==newV16; call newV12; return
newV13:    newV30cms=newV13=='CMS';  newV18=newV13=="OS2";  newV19=newV13=='TSO' | newV13=="MVS";  newV20=newV13=='VSE';  newV21=pos("DOS",newV13)\==0 | pos('WIN',newV13)\==0 | newV13=="CMD";  newV22=left(newV13,6)=='DOSCRX';  call newV30rex;   return
newV30var:    call newV15;  if newV10  then return space(dosenv(arg(1)));   return space(value(arg(1), , newV12))
er:      parse arg newV28,newV29;  call '$ERR'  "14"p(newV28)  p(word(newV28,2)  newV15(1))  newV29;   if newV28<0  then return newV28;     exit result
p:       return word(arg(1), 1)
halt:    call er .1
isNum:   return datatype(arg(1), 'N')
noValue: newV30sigl=sigl;  call er 17, newV15(2)  newV15(3)  newV30sigl  condition('D')  sourceline(newV30sigl)
syntax:  newV30sigl=sigl;  call er 13, newV15(2)  newV15(3)  newV30sigl  newV30cal()  condition('D')  sourceline(newV30sigl)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sleep\sleep-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
