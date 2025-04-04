/*ช*REXX program runs and displays the Conway's game of life, it stops after  N  repeats. */
signal on halt                                   /*ช*handle a  cell growth  interruptus.  */
parse arg peeps  '(' rows  cols  empty  life!  clearScreen  repeats  generations .
rows =        p(rows               3)     /*ช*the maximum number of cell  rows.    */
cols =        p(cols               3)     /*ช* "     "       "    "   "  columns.  */
emp = pickChar(empty        'blank')     /*ช*an empty cell character  (glyph).    */
clearScr =        p(clearScreen        0)     /*ช* "1"   indicates to clear the screen.*/
life! = pickChar(life!            'โผ')     /*ช*the gylph kinda looks like an amoeba.*/
reps =        p(repeats            2)     /*ช*stop pgm  if there are  two  repeats.*/
generations =        p(generations      100)     /*ช*the number of  generations  allowed. */
sw= max(linesize() - 1,  cols)                   /*ช*usable screen width for the display. */
newV1= 0;        newV4.= emp                         /*ช*the universe is new,  ยทยทยท and barren.*/
gens=abs(generations)                            /*ช*used for a  programming  convenience.*/
x= space(peeps); upper x                         /*ช*elide superfluous spaces; uppercase. */
if x==''         then x= "BLINKER"               /*ช*if nothing specified,  use  BLINKER. */
if x=='BLINKER'  then x= "2,1 2,2 2,3"
if x=='OCTAGON'  then x= "1,5 1,6 2,4 2,7 3,3 3,8 4,2 4,9 5,2 5,9 6,3 6,8 7,4 7,7 8,5 8,6"
call assign.                                     /*ช*assign the initial state of all cells*/
call showCells                                   /*ช*show the  initial state of the cells.*/
do life=1  for gens;      call assign@      /*ช*construct  next  generation of cells.*/
if generations>0 | life==gens  then call showCells    /*ช*should cells be displayed? */
end   /*ช*life*/                              /*ช* [โ]  cell colony grows, lives, dies.*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
showCells: if clearScr  then 'CLS'               /*ช*  โโโโ  change 'command' for your OS.*/
call showRows                         /*ช*show the rows in the proper order.   */
say right(copies('โ', sw)  life, sw)  /*ช*show a fence between the generations.*/
if newV8==''  then exit                   /*ช*if there's no life, then stop the run*/
if newV5.newV8    then newV1= newV1 + 1       /*ช*we detected a repeated cell pattern. */
newV5.newV8= 1                                /*ช*existence  state and compare  later. */
if reps\==0 & newV1<=reps then return /*ช*so far, so good,   regarding repeats.*/
say
say center('"Life" repeated itself' reps "times, simulation has ended.",sw,'โ')
exit                                  /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
$:         parse arg newV2,newV3;                    return newV4.newV2.newV3==life!
assign$:   do r=1  for rows;   do c=1  for cols;   newV4.r.c= newV6.r.c;                                    end;    end;       return
assign.:   do while x\==''; parse var x r "," c x; newV4.r.c=life!; rows=max(rows,r); cols=max(cols,c); end; life=0; newV5.=0; return
assignnewV7:   newV7=newV4.r.c; n=neighbors(); if newV7==emp then do;if n==3 then newV7=life!; end; else if n<2 | n>3 then newV7=emp; newV6.r.c=newV7; return
assign@:   newV6.=emp;      do r=1  for rows;  do c=1  for cols;  call assignnewV7;  end;  end;            call assign$;       return
halt:      say;         say "REXX program  (Conway's Life)  halted.";    say;      exit 0
neighbors: return $(r-1,c-1)  +  $(r-1,c)  +  $(r-1,c+1)  +  $(r,c-1)  +  $(r,c+1)  +  $(r+1,c-1)  +  $(r+1,c)  +  $(r+1,c+1)
p:         return word(arg(1), 1)
pickChar:  newV8=p(arg(1)); arg u .; if u=='BLANK' then newV8=" "; L=length(newV8); if L==3 then newV8=d2c(newV8); if L==2 then newV8=x2c(newV8);  return newV8
showRows:  newV8=; do r=rows by -1 for rows; z=; do c=1 for cols; z=z||newV4.r.c; end; z=strip(z,'T',emp); say z; newV8=newV8||z; end; return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Conways-Game-of-Life\conways-game-of-life-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
