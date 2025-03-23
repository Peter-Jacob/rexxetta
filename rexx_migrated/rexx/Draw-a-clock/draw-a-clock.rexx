/*�*REXX program displays the  current (local) time  as a  digital clock  on the terminal.*/
trace off                                        /*�*turn off tracing/possible host errors*/
parse arg newV29                                      /*�*obtain optional arguments from the CL*/
if newV29all(arg())  then exit                        /*�*was there a request for some help?   */
if newV29cms         then address ''                  /*�*If CMS,  then initialize ADDRESS name*/

signal on halt                                   /*�*initialize target label when HALTed. */
signal on noValue                                /*�*     "        "     "     "  noValue.*/
signal on syntax                                 /*�*     "        "     "     "  syntax. */

parse var newV29 ops                                  /*�*obtain optional arguments from the CL*/
ops = space(ops)                                 /*�*elide superfluous blanks from options*/
blinkSecs = 1                                    /*�*amount of time between displays.     */
creep     = 1                                    /*�*moves the output "around" the screen.*/
tops      = '.C=blue .BC=░ .BS=1 .BLOCK=12'      /*�*options to be specified for  $T.REXX */

do while ops\==''                              /*�*process all the specified options.   */
parse var ops newV26 2 1 newV30 . 1 y ops               /*�*extract various information from opt.*/
upper newV30                                        /*�*uppercase the    _    REXX variavle. */
select
when newV30==','                    then nop              /*�*ignore any comma used.*/
when newV26==.  &  pos("=",newV30)\==0  then tops= tops y     /*�*add this value to TOPS*/
when abbn('BLINKSECs')         then blinksecs= no()  /*�*use/not use BLINKSECs.*/
when abbn('CREEPs')            then creep= no()      /*�* "   "   "  CREEPs.   */
otherwise                      call er 55,y          /*�*whoops! Invalid option*/
end   /*�*select*/
end            /*�*while ops¬==''*/

if \newV4  then  blinkSecs= 0                  /*�*Not PC/REXX?  Then turn off BLINKSECS*/
tops= space(tops)                                /*�*elide superfluous blanks in  TOPS.   */
parse value  scrsize()  with  sd sw .            /*�*obtain the terminal screen dimensions*/
oldTime=                                         /*�*blank out the OLDTIME for comparison.*/
do until queued()\==0                 /*�*if user entered some text, then QUIT.*/
ct= time()                            /*�*obtain the current  (system)  time.  */
mn= substr(ct, 4, 2)                  /*�*extract the minutes part of the time.*/
ss= right(ct, 2)                      /*�*   "     "  seconds   "  "   "    "  */
inewV30= 0                                 /*�*REXX variable used for display creep.*/
pnewV30= 0                                 /*�*  "      "      "   "     "      "   */
call blinksec
if ct==oldTime  then  if newV29cms  then 'CP SLEEP'       /*�*sleep for one second. */
else call delay 1     /*�*  "    "   "     "    */

if creep  then do;            pnewV30 = 3  + right(mn, 1) /*�*perform display creep.*/
if sd>26  then pnewV30 = pnewV30 +  left(mn, 1)
if sd>33  then pnewV30 = pnewV30 +  left(mn, 1)
if sd>44  then pnewV30 = pnewV30 +  left(mn, 1) + right(mn, 1)
end
newV27= - pnewV30                              /*�*change the sign of the  P_  number.  */
inewV30= 2 + left(ct, 1)                   /*�*obtain indentation size base on  HH. */
if sw>108  then ctt= ct               /*�*maybe use wider  format for the clock*/
else ctt= left(ct, 5)      /*�*maybe use narrow    "    "   "    "  */
r= $t('.P='newV27  ".I="inewV30  tops  ctt)    /*�*where the rubber meets the road.     */
if r\==0   then leave                 /*�*Had an error in  $T ?   Then quit.   */
oldTime= time()                       /*�*save the new time, it may be the same*/
end   /*�*forever*/
exit 0                                           /*�*stick a fork in it,  we're all done. */

/*�*═════════════════════════════general 1-line subs══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════*/
newV29all:  newV29newV29=newV29;newV29=space(newV29);upper newV29;call newV13;newV21=right(newV29var('OS'),2)=='NT';newV9=word('CLS VMFCLEAR CLRSCREEN',1+newV29cms+newV17*2);if arg(1)\==1 then return 0;if wordpos(newV29,'? ?SAMPLES ?AUTHOR ?FLOW')==0 then return 0;newV7=']$H';call '$H' newV22 newV29;newV7=;return 1
newV29cal:     if symbol('!CALL')\=="VAR"  then newV7=;      return newV7
newV10:     newV10= 'ENVIRONMENT';    if newV11=="MSDOS"  |  newV6  |  newV25  |  newV15  then newV10= 'SYSTEM';    if newV16  then newV10= "OS2"newV10;    newV2= 3=='f3'x;    if newV20  then newV10= "DOS";      return
newV13:     parse upper source newV11 newV12 newV13 . 1 . . newV22 newV23 newV24 .;   call newV11;   if newV19  then do;   newV30= lastpos('\', newV22);   newV24= left(newV22, newV30);   newV22= substr(newV22, newV30+1);   parse var newV22 newV22 '.' newV23;   end;   return word(0 newV22 newV23 newV24, 1 +('0'arg(1)))
newV29rex:     parse upper version newV14 newV3 newV1 .; newV6= 'BY'==newV3; newV8= "KEXX"==newV14; newV4= 'REXX/PERSONAL'==newV14 | "REXX/PC"==newV14; newV25= 'REXX-R4'==newV14; newV5="REXX-REGINA"==left(newV14, 11); newV15='REXX-ROO'==newV14; call newV10; return
newV11:     newV29cms= newV11=='CMS';    newV16= newV11=="OS2";    newV17= newV11=='TSO'  |  newV11=="MVS";    newV18= newV11=='VSE';    newV19= pos("DOS", newV11)\==0  |  pos('WIN', newV11)\==0  |  newV11=="CMD";    newV20= left(newV11, 6)=='DOSCRX';    call newV29rex;              return
newV29var:     call newV13;   if newV8  then return space( dosenv( arg(1) ) );                      return space( value( arg(1), , newV10))
$t:       newV7= ']$T';  call "$T"  arg(1);   newV7=;                                        return result
abb:      parse upper arg abbu;     parse arg abb;      return abbrev(abbu, newV30, abbl(abb) )
abbl:     @abc = 'abcdefghijklmnopqrstuvwxyz';          return verify(arg(1)'a', @abc, 'M') - 1
abbn:     parse arg abbn;                               return abb(abbn) | abb('NO'abbn)
blinksec: if \blinksecs  then return;      bsec= ' ';      ss2= right(ss, 2);      if sw<=80  then bsec= copies(" ", 2 + ss2)  ss2;      call scrwrite 1 + right(mn, 1), 1, bsec, , , 1;      call cursor sd - right(mn, 1), sw - length(bsec);     return
er:       parse arg newV26,newV28;  call '$ERR'  "14"p(newV26)  p(word(newV26, 2)  newV13(1))  newV28;  if newV26<0  then return newV26;    exit result
err:      call er '-'arg(1),arg(2);                     return ''
erx:      call er '-'arg(1),arg(2);                     exit 0
halt:     call er .1
no:       if arg(1)\==''  then call er 01,arg(2);        return left(newV30, 2) \== 'NO'
noValue:  newV29sigl= sigl;         call er 17,newV13(2)  newV13(3)  newV29sigl          condition('D')  sourceline(newV29sigl)
p:        return word( arg(1), 1)
syntax:   newV29sigl= sigl;         call er 13,newV13(2)  newV13(3)  newV29sigl  newV29cal()  condition('D')  sourceline(newV29sigl)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Draw-a-clock\draw-a-clock.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
