/*ͺ*REXX pgm implements the 15βpuzzle (AKA: Gem Puzzle, Boss Puzzle, Mystic Square, 14β15)*/
parse arg N seed .                               /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N=4                      /*ͺ*Not specified?  Then use the default.*/
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*use repeatability seed for RANDOM BIF*/
nh= N**2;   newV1.=;    nn= nh - 1;    w= length(nn) /*ͺ*define/initialize some handy values. */
newV3=                                               /*ͺ*$: will hold the solution for testing*/
do i=1  for nn;  newV3= newV3  i                  /*ͺ* [β]  build a solution for testing.  */
end   /*ͺ*i*/
done= newV3                                          /*ͺ* [β]  scramble the tiles in puzzle.  */
do j=1  for nn;  a= random(1, words(newV3) );    newV1.j= word(newV3, a);   newV3= delword(newV3, a, 1)
end   /*ͺ*j*/
/*ͺ*βββββββββββββββββββ play the 15βpuzzle 'til done or quit.*/
do  until puzz==done & newV1.nh==''               /*ͺ*perform moves until puzzle is solved.*/
call getmv                                    /*ͺ*get user's move(s)  and  validate it.*/
if errMsg\==''  then do;  say sep errMsg;       iterate        /*ͺ*possible error msg? */
end
call showGrid 0                               /*ͺ*don't display puzzle, just find hole.*/
if wordpos(x, newV6)==0  then do;  say sep  'tile '     x     " can't be moved.";   iterate
end
newV1.hole= x;    newV1.tile=
call showGrid 0                               /*ͺ*move specified tile ββββΊ puzzle hole.*/
end   /*ͺ*until*/           /*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/

call showGrid 1;    say;     say sep  'Congratulations!   The'      nn"-puzzle is solved."
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
getmv: x= 0;   sep= copies('β', 8);     pad= left('', 1 + length(sep) )   /*ͺ*pad=9 blanks*/
prompt= sep    'Please enter a tile number  or  numbers '     sep     " (or Quit)."
if queued()==0  then do;    say;    call showGrid 1;     say;      say prompt
end
parse pull x . 1 ox . 1 . zx;   upper x   /*ͺ*obtain a number (or numbers) from CL.*/
if abbrev('QUIT', x, 1)  then do;   say;   say;    say sep  "quitting.";      exit
end
if words(zx)>0  then do;  parse var  zx    xq;     queue xq
end                  /*ͺ* [β]  Extra moves?  Stack for later. */
select                             /*ͺ* [β]  Check for possible errors/typos*/
when x==''              then errMsg= "nothing entered."
when \datatype(x, 'N')  then errMsg= "tile number isn't numeric: "        ox
when \datatype(x, 'W')  then errMsg= "tile number isn't an integer: "     ox
when x=0                then errMsg= "tile number can't be zero: "        ox
when x<0                then errMsg= "tile number can't be negative: "    ox
when x>nn               then errMsg= "tile number can't be greater than"  nn
otherwise                    errMsg=
end   /*ͺ*select*/                   /*ͺ* [β]  verify the human entered data. */
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showGrid: parse arg show;       newV2.=;                      x= x/1;       newV4= 0;        puzz=
top= 'β'copies( copies("β", w)'β¦', N);        top= left( top, length(top) -1)"β"
bar= 'β 'copies( copies("β", w)'β¬', N);        bar= left( bar, length(bar) -1)"βξεχΦ΄"
bot= 'β'copies( copies("β", w)'β©', N);        bot= left( bot, length(bot) -1)"β"
if show  then say pad top

do   r=1  for N;     z= 'β'
do c=1  for N;     newV4= newV4+1;     y= newV1.newV4;      puzz= puzz y;        newV2.r.c= y
newV5= right(newV1.newV4, w)"β";           z= z || newV5              /*ͺ* [β]  find hole*/
if newV1.newV4 == ''  then do;    hole= newV4;     holeRow= r;     holeCol= c;    end
if newV1.newV4 == x   then do;    tile= newV4;     tileRow= r;     tileCol= c;    end
end   /*ͺ*c*/                                           /*ͺ* [β]  find  X. */
if show  then do;    say pad z;     if r\==N  then say pad bar;         end
end     /*ͺ*r*/

rm=holeRow-1;   rp=holeRow+1;  cm=holeCol-1;  cp=holeCol+1   /*ͺ*possible moves.*/
newV6=newV2.rm.holeCol  newV2.rp.holeCol   newV2.holeRow.cm   newV2.holeRow.cp   /*ͺ* legal   moves.*/
if show  then say pad bot;                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\15-puzzle-game\15-puzzle-game.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
