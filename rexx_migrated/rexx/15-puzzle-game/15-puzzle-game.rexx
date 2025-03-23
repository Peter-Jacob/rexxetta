/*�*REXX pgm implements the 15─puzzle (AKA: Gem Puzzle, Boss Puzzle, Mystic Square, 14─15)*/
parse arg N seed .                               /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=4                      /*�*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*�*use repeatability seed for RANDOM BIF*/
nh= N**2;   newV1.=;    nn= nh - 1;    w= length(nn) /*�*define/initialize some handy values. */
newV3=                                               /*�*$: will hold the solution for testing*/
do i=1  for nn;  newV3= newV3  i                  /*�* [◄]  build a solution for testing.  */
end   /*�*i*/
done= newV3                                          /*�* [↓]  scramble the tiles in puzzle.  */
do j=1  for nn;  a= random(1, words(newV3) );    newV1.j= word(newV3, a);   newV3= delword(newV3, a, 1)
end   /*�*j*/
/*�*═══════════════════ play the 15─puzzle 'til done or quit.*/
do  until puzz==done & newV1.nh==''               /*�*perform moves until puzzle is solved.*/
call getmv                                    /*�*get user's move(s)  and  validate it.*/
if errMsg\==''  then do;  say sep errMsg;       iterate        /*�*possible error msg? */
end
call showGrid 0                               /*�*don't display puzzle, just find hole.*/
if wordpos(x, newV6)==0  then do;  say sep  'tile '     x     " can't be moved.";   iterate
end
newV1.hole= x;    newV1.tile=
call showGrid 0                               /*�*move specified tile ───► puzzle hole.*/
end   /*�*until*/           /*�*═════════════════════════════════════════════════════════*/

call showGrid 1;    say;     say sep  'Congratulations!   The'      nn"-puzzle is solved."
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
getmv: x= 0;   sep= copies('─', 8);     pad= left('', 1 + length(sep) )   /*�*pad=9 blanks*/
prompt= sep    'Please enter a tile number  or  numbers '     sep     " (or Quit)."
if queued()==0  then do;    say;    call showGrid 1;     say;      say prompt
end
parse pull x . 1 ox . 1 . zx;   upper x   /*�*obtain a number (or numbers) from CL.*/
if abbrev('QUIT', x, 1)  then do;   say;   say;    say sep  "quitting.";      exit
end
if words(zx)>0  then do;  parse var  zx    xq;     queue xq
end                  /*�* [↑]  Extra moves?  Stack for later. */
select                             /*�* [↓]  Check for possible errors/typos*/
when x==''              then errMsg= "nothing entered."
when \datatype(x, 'N')  then errMsg= "tile number isn't numeric: "        ox
when \datatype(x, 'W')  then errMsg= "tile number isn't an integer: "     ox
when x=0                then errMsg= "tile number can't be zero: "        ox
when x<0                then errMsg= "tile number can't be negative: "    ox
when x>nn               then errMsg= "tile number can't be greater than"  nn
otherwise                    errMsg=
end   /*�*select*/                   /*�* [↑]  verify the human entered data. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showGrid: parse arg show;       newV2.=;                      x= x/1;       newV4= 0;        puzz=
top= '╔'copies( copies("═", w)'╦', N);        top= left( top, length(top) -1)"╗"
bar= '╠'copies( copies("═", w)'╬', N);        bar= left( bar, length(bar) -1)"����ִ"
bot= '╚'copies( copies("═", w)'╩', N);        bot= left( bot, length(bot) -1)"╝"
if show  then say pad top

do   r=1  for N;     z= '║'
do c=1  for N;     newV4= newV4+1;     y= newV1.newV4;      puzz= puzz y;        newV2.r.c= y
newV5= right(newV1.newV4, w)"║";           z= z || newV5              /*�* [↓]  find hole*/
if newV1.newV4 == ''  then do;    hole= newV4;     holeRow= r;     holeCol= c;    end
if newV1.newV4 == x   then do;    tile= newV4;     tileRow= r;     tileCol= c;    end
end   /*�*c*/                                           /*�* [↑]  find  X. */
if show  then do;    say pad z;     if r\==N  then say pad bar;         end
end     /*�*r*/

rm=holeRow-1;   rp=holeRow+1;  cm=holeCol-1;  cp=holeCol+1   /*�*possible moves.*/
newV6=newV2.rm.holeCol  newV2.rp.holeCol   newV2.holeRow.cm   newV2.holeRow.cp   /*�* legal   moves.*/
if show  then say pad bot;                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\15-puzzle-game\15-puzzle-game.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
