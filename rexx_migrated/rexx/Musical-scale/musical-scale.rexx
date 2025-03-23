/*�*REXX program  sounds  eight notes  of the    C  major   natural diatonic  music scale.*/
parse arg newV27                                      /*�*obtain optional arguments from the CL*/
/*�* [↓]  invoke boilerplate REXX code.  */
if newV27all( arg() )  then exit                      /*�*determine which REXX is running,  if */
/*�*    any form of help requested, exit.*/
if \newV5   & \newV4  then do
say "***error***  this program can't execute under:"   newV14
exit 13
end

newV28 = 'do ra me fa so la te do'                    /*�*the words for music scale sounding.  */
dur = 1/4                                        /*�*define duration as a quarter second. */
do j=1  for words(newV28)                  /*�*sound each "note" in the string.     */
call notes word(newV28, j), dur            /*�*invoke a subroutine for the sounds.  */
end   /*�*j*/                           /*�* [↑]   sound each of the words.      */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
notes: procedure expose newV5 newV4; arg note,dur /*�*obtain the arguments from list. */
newV26.= 0                                          /*�*define common names for sounds. */
newV26.la= 220;        newV26.si= 246.94;    newV26.te= newV26.si;      newV26.ta= newV26.te;    newV26.ti=  newV26.te
newV26.do= 261.6256;   newV26.ut= newV26.do;      newV26.re= 293.66;    newV26.ra= newV26.re;    newV26.mi=  329.63
newV26.ma= newV26.mi;       newV26.fa= 349.23;    newV26.so= 392;                      newV26.sol= newV26.so
if newV26.note==0  then return                      /*�*if frequency is zero,  skip it. */
if newV4  then call  sound newV26.note,dur        /*�*sound the note using SOUND bif. */
if newV5  then do                            /*�* [↓]  reformat some numbers.    */
ms= format(dur*1000, , 0)     /*�*Regina requires DUR in millisec.*/
intN= format(newV26.note, , 0)     /*�*   "      "     NOTE is integer.*/
call  beep  intN, ms          /*�*sound the note using  BEEP  BIF.*/
end
return
/*�*─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────*/
newV27all: newV27newV27=newV27;newV27=space(newV27);upper newV27;call newV13;newV21=right(newV27var('OS'),2)=='NT';newV9=word('CLS VMFCLEAR CLRSCREEN',1+newV27cms+newV17*2);if arg(1)\==1 then return 0;if wordpos(newV27,'? ?SAMPLES ?AUTHOR ?FLOW')==0 then return 0;newV7=']$H';call '$H' newV22 newV27;newV7=;return 1
newV27cal: if symbol('!CALL')\=="VAR"  then newV7=;                             return newV7
newV10: newV10= 'ENVIRONMENT';   if newV11=="MSDOS"  |  newV6  |  newV25  |  newV15  then newV10= 'SYSTEM';   if newV16  then newV10= "OS2"newV10;   newV2= 3=='f3'x;   if newV20  then newV10="DOS";                    return
newV13: parse upper source newV11 newV12 newV13 . 1 . . newV22 newV23 newV24 .;  call newV11;  if newV19  then do;  newV29= lastpos('\',newV22);  newV24= left(newV22,newV29);  newV22= substr(newV22,newV29+1);  parse var newV22 newV22 "." newV23;  end;      return word(0 newV22 newV23 newV24, 1 + ('0'arg(1) ) )
newV27rex: parse upper version newV14 newV3 newV1 .;  newV6= 'BY'==newV3; newV8= "KEXX"==newV14; newV4= 'REXX/PERSONAL'==newV14 | "REXX/PC"==newV14; newV25= 'REXX-R4'==newV14; newV5= "REXX-REGINA"==left(newV14, 11); newV15= 'REXX-ROO'==newV14; call newV10; return
newV11: newV27cms= newV11=='CMS';   newV16= newV11=="OS2";   newV17= newV11=='TSO'  |  newV11=="MVS";   newV18= newV11=='VSE';   newV19= pos("DOS", newV11)\==0  |  pos('WIN', newV11)\==0  |  newV11=="CMD";   newV20= left(newV11, 6)=='DOSCRX';                         call newV27rex; return
newV27var: call newV13;   if newV8  then return space( dosenv( arg(1) ) );        return space( value( arg(1), , newV10) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Musical-scale\musical-scale.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
