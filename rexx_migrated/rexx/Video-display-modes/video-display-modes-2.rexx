/*�*REXX program to switch video display modes based on columns and lines.*/
parse arg newV28;  if newV28all()  then exit     /*�*exit if documentation specified*/
if \newV22  &  \newV19       then exit     /*�*if this isn't DOS,  then exit. */

parse arg cols lines .
'MODE'   "CON:       COLS="cols     'LINES='lines

exit                                   /*�*stick a fork in it, we're done.*/
/*�*══════════════════════════════════general 1-line subs═════════════════*/
newV4=newV28;newV28=space(newV28);upper newV28;call newV16;newV23=right(newV28var('OS'),2)=='NT';newV12=word('CLS VMFCLEAR CLRSCREEN',1+newV28cms+newV20*2);if arg(1)\==1 then return 0;if wordpos(newV28,'? ?SAMPLES ?AUTHOR ?FLOW')==0 then return 0;newV10=']$H';call '$H' newV24 newV28;newV10=;return 1
newV28cal:if symbol('!CALL')\=="VAR" then newV10=;return newV10
newV1='ENVIRONMENT';if newV14=='MSDOS'|newV9|newV27|newV18 then newV13='SYSTEM';if newV19 then newV13='OS2'newV13;newV5=1=='f0'x;return
newV16:parse upper source newV14 newV15 newV16 . 1 . . newV24 newV25 newV26 .;call newV14;if newV22 then do;newV29=lastpos('\',newV24);newV26=left(newV24,newV29);newV24=substr(newV24,newV29+1);parse var newV24 newV24 '.' newV25;end;return word(0 newV24 newV25 newV26,1+('0'arg(1)))
newV28rex:parse upper version newV17 newV6 newV3 .;newV9='BY'==newV6;newV11='KEXX'==newV17;newV7='REXX/PERSONAL'==newV17|'REXX/PC'==newV17;newV27='REXX-R4'==newV17;newV8='REXX-REGINA'==left(newV17,11);newV18='REXX-ROO'==newV17;call newV13;return
newV2=newV14=='CMS';newV19=newV14=='OS2';newV20=newV14=='TSO'|newV14=='MVS';newV21=newV14=='VSE';newV22=pos('DOS',newV14)\==0|pos('WIN',newV14)\==0|newV14=='CMD';call newV28rex;return
newV28var:call newV16;if newV11 then return space(dosenv(arg(1)));return space(value(arg(1),,newV13))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Video-display-modes\video-display-modes-2.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
