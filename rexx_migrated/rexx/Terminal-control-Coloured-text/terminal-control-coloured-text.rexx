/*�*REXX program to display sixteen lines,  each of a different color.    */
parse arg newV28;  if newV28all()  then exit     /*�*exit if documentation specified*/
if \newV22  &  \newV19       then exit     /*�*if this isn't DOS,  then exit. */
if \newV7              then exit     /*�*if this isn't PC/REXX,   exit. */

color.0  = 'black'                     /*�*┌─────────────────────────────┐*/
color.1  = 'dark blue'                 /*�*│ Normally, all programs issue│*/
color.2  = 'dark green'                /*�*│ the  (above) error messages │*/
color.3  = 'dark cyan/turquois'        /*�*│ through another REXX program│*/
color.4  = 'dark red'                  /*�*│ ($ERR)  which has more      │*/
color.5  = 'dark pink/magenta'         /*�*│ verbiage and  explanations, │*/
color.6  = 'dark yellow (orange)'      /*�*│ and issues the error text in│*/
color.7  = 'dark white'                /*�*│ red (if color is available).│*/
color.8  = 'brite black (grey/gray)'   /*�*└─────────────────────────────┘*/
color.9  = 'bright blue'
color.10 = 'bright green'
color.11 = 'bright cyan/turquois'
color.12 = 'bright red'
color.13 = 'bright pink/magenta'
color.14 = 'bright yellow'
color.15 = 'bright white'

do j=0  to 15                 /*�*show all sixteen color codes.  */
call scrwrite ,,'color code=['right(j,2)"]" color.j,,,j;   say
end   /*�*j*/                   /*�*the  "SAY"  forces a  NEWLINE. */
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
 * REXX C:\Users\PeterJ\rexxetta\rexx\Terminal-control-Coloured-text\terminal-control-coloured-text.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
