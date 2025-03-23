/*�*REXX boilerplate determines how to clear screen (under various REXXes)*/
trace off;      parse arg newV26            /*�*turn off tracing; get C.L. args*/
if newV26all(arg())  then exit              /*�*Doc request?   Show, then exit.*/
if newV26cms then address ''                /*�*Is this CMS?  Use this address.*/

newV9                                   /*�*clear the (terminal) screen.   */            /*�* ◄═══   this is where  "it"  happens.*/

exit                                   /*�*stick a fork in it, we're done.*/
/*�*═════════════════════════════general 1-line subs══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════*/
newV26all:  newV26newV26=newV26;newV26=space(newV26);upper newV26;call newV13;newV21=right(newV26var('OS'),2)=='NT';newV9=word('CLS VMFCLEAR CLRSCREEN',1+newV26cms+newV17*2);if arg(1)\==1 then return 0;if wordpos(newV26,'? ?SAMPLES ?AUTHOR ?FLOW')==0 then return 0;newV7=']$H';call '$H' newV22 newV26;newV7=;return 1
newV26cal:  if symbol('!CALL')\=="VAR" then newV7=; return newV7
newV10:  newV10='ENVIRONMENT'; if newV11=='MSDOS'|newV6|newV25|newV15 then newV10='SYSTEM'; if newV16 then newV10='OS2'newV10; newV2=1=='f0'x; if newV20 then newV10='DOS'; return
newV13:  parse upper source newV11 newV12 newV13 . 1 . . newV22 newV23 newV24 .; call newV11; if newV19 then do; newV27=lastpos('\',newV22); newV24=left(newV22,newV27); newV22=substr(newV22,newV27+1); parse var newV22 newV22 '.' newV23; end; return word(0 newV22 newV23 newV24,1+('0'arg(1)))
newV26rex:  parse upper version newV14 newV3 newV1 .; newV6='BY'==newV3; newV8='KEXX'==newV14; newV4='REXX/PERSONAL'==newV14|'REXX/PC'==newV14; newV25='REXX-R4'==newV14; newV5='REXX-REGINA'==left(newV14,11); newV15='REXX-ROO'==newV14; call newV10; return
newV11:  newV26cms=newV11=='CMS'; newV16=newV11=='OS2'; newV17=newV11=='TSO'|newV11=='MVS'; newV18=newV11=='VSE'; newV19=pos('DOS',newV11)\==0|pos('WIN',newV11)\==0|newV11=='CMD'; newV20=left(newV11,6)=='DOSCRX'; call newV26rex; return
newV26var:  call newV13; if newV8 then return space(dosenv(arg(1))); return space(value(arg(1),,newV10))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Clear-the-screen\terminal-control-clear-the-screen.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
