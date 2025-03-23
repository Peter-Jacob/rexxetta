/*�*REXX program shows a "hello world" window (and another to show how to close)*/
parse upper version newV2 .;     newV1= newV2=='REXX/PERSONAL' | newV2=='REXX/PC'
if ¬newV1  then call ser  "This isn't PC/REXX"     /*�*this isn't  PC/REXX ?  */
rxWin=fcnPkg('rxwindow')                             /*�*is the function around?*/

if rxWin¬==1  then do 1;     'RXWINDOW  /q'
if fcnPkg('rxwindow')==1 then leave   /*�*the function is OK.*/
say 'error loading RXWINDOW !';     exit 13
end

top=1;         normal=31;       border=30;   curpos=cursor()
width=40;      height=11;       line.=;      line.1= 'Goodbye, World!'
w=wnewV3open(2, 3, height+2, width, normal);     call wnewV3border  w,,,,,border
helpLine= 'press the  ESC  key to quit.'
helpW=wnewV3open(2, 50, 3, length(helpLine)+4, normal)
call wnewV3border helpw,,,,,border;  call wnewV3put helpW, 2, 3, helpLine
call wnewV3hide w, 'n'
do k=0  to height-1
newV3=top+k;      call wnewV3put w, k+2, 3, line.newV3, width-4
end   /*�*k*/
call wnewV3unhide w
do forever;   if inKey()=='1b'x  then leave;  end
/*�*   ↑                     */
call wnewV3close  w                                    /*�*   └──◄ the  ESCape  key.*/
call wnewV3close  helpw
if rxWin¬==1  then 'RXUNLOAD rxwindow'
parse var curPos row  col
call      cursor row, col
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hello-world-Graphical\hello-world-graphical-2.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
