/*ͺ*REXX program demonstrates a method to use  "here"  documents in REXX. */
parse arg doc .                        /*ͺ*"here" name is case sensitive. */

do j=1  for sourceline()
if sourceline(j)\=='ββ'doc  then iterate
do newV1=j+1  to sourceline()  while sourceline(newV1)\=='ββ.'
say sourceline(newV1)
end   /*ͺ*!*/
exit                              /*ͺ*stick a fork in it, we're done.*/
end         /*ͺ*j*/

say doc '"here" document not found.'
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββstart of "here" docsββββββββββββββββββ
ββrs-232
RSβ232 Signals and Pinouts  βββββββββββββββββββββββββββββββββββββββββββββββββββ
β13  12  11  10  9   8   7   6   5   4   3   2   1β
βββΊ  Interface between data ββ 25  24  23  22  21  20  19  18  17  16  15  14ββ
terminal equipment (DTE/male)βββββββββββββββββββββββββββββββββββββββββββββββββ
and data communication equipment
[DCE/female]  employing  serial   βββββββββββββββββββββββββββββββββββββββββββββ
binary  data  interchange.        β 12ββsecondary carrier detect   [SCD]  DCE β
βββββββββββββββββββββββββββββββββββ€ 13ββsecondary clear to send    [SCS]  DCE β
β 1ββprotective ground  [PG, GND] β 14ββsecondary transmitted data [STD]  DTE β
β 2ββtransmitted data   [TD]  DTE β 15ββtransmit clock             [TC]   DCE β
β 3ββreceived data      [RD]  DCE β 16ββsecondary received data    [SRD]  DCE β
β 4ββrequest to send    [RTS] DTE β 17ββreceiver clock             [RC]   DCE β
β 5ββclear to send      [CTS] DCE β 18ββunassigned                            β
β 6ββdata set ready     [DSR] DCE β 19ββsecondary request to send  [SRS]  DTE β
β 7ββsignal ground      [SG]      β 20ββdata terminal ready        [DTR]  DTE β
β      (common return)            β 21ββsignal quality detector    [SQD]  DCE β
β 8ββcarrier detect     [CD]  DCE β 22ββring indicator             [RI]   DCE β
β 9ββpositive voltage   [-]       β 23ββdata rate select       [DRS]  DCE/DTE β
β10ββnegative voltage   [-]       β 24ββexternal clock             [XTC]  DTE β
β11ββunassigned                   β 25ββunassigned                            β
βββββββββββββββββββββββββββββββββββ΄ββββββββββββββββββββββββββββββββββββββββββββ
ββ.
ββcan
ββββββββ
β      β
β      ββ
β      ββ
β      β
β      β
β      β
β      β
β      β                                         βββββββ
ββββ¬β¬βββ                                         βββββββ
ββ                                            ββ€   ββ€
ββ    βββββββββββββββββ                       ββ   ββ
ββ   ββ΄βββββββββββββββ¬β                       ββ€   ββ
ββββββ€               β                         βββββ
ββββββ€            ββββ
β            β
ββββ         β
β         β
β         β
β         β
βββββββββββ
ββ.
ββββββββββββββββββββββββββββββββββββend of "here" docsββββββββββββββββββ*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Here-document\here-document.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
