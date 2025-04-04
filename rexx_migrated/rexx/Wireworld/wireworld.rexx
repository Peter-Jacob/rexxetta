/*ͺ*REXX program  displays a   wire world   Cartesian grid   of  fourβstate  cells.       */
parse arg  iFID .  '('  generations  rows  cols  bare  head  tail  wire  clearScreen  reps
if iFID==''  then iFID= "WIREWORLD.TXT"          /*ͺ*should default input file  be used?  */
bla = 'BLANK'                            /*ͺ*the "name" for a blank.              */
generations = p(generations     100   )          /*ͺ*number generations that are allowed. */
rows = p(rows            3     )          /*ͺ*the number of cell  rows.            */
cols = p(cols            3     )          /*ͺ* "     "    "   "   columns.         */
bare = pickChar(bare     bla   )          /*ͺ*character used to show an empty cell.*/
clearScreen = p(clearScreen     0     )          /*ͺ*1    means to clear the screen.      */
head = pickChar(head     'H'   )          /*ͺ*pick the character for the  head.    */
tail = pickChar(tail     't'   )          /*ͺ*  "   "      "      "   "   tail.    */
wire = pickChar(wire     .     )          /*ͺ*  "   "      "      "   "   wire.    */
reps = p(reps            2     )          /*ͺ*stop program  if there are 2 repeats.*/
fents= max(cols, linesize() - 1)                 /*ͺ*the fence width used after displaying*/
newV1= 0;     newV4.= bare;   gens= abs(generations) /*ͺ*at start, universe is new and barren.*/
/*ͺ* [β]     read the input file.        */
do r=1  while lines(iFID)\==0             /*ͺ*keep reading until the  EndβOfβFile. */
q= strip( linein(iFID), 'T')              /*ͺ*get a line from input file.          */
L= length(q);      cols= max(cols, L)     /*ͺ*calculate maximum number of columns. */
do c=1  for L;  newV4.r.c= substr(q, c, 1) /*ͺ*assign the cells for the   R   row.  */
end   /*ͺ*c*/
end      /*ͺ*r*/
newV5.= 0;                      signal on halt       /*ͺ*initial state of cells;  handle halt.*/
rows= r - 1;   life= 0;     call showCells       /*ͺ*display initial state of the cells.  */
/*ͺ*watch cells evolve, 4 possible states*/
do   life=1  for gens;    newV6.= bare             /*ͺ*perform for the number of generations*/
do   r=1  for rows                          /*ͺ*process each of the rows.            */
do c=1  for cols;    newV8= newV4.r.c;    newV7= newV8   /*ͺ*   "      "   "  "  columns.         */
select                          /*ͺ*determine the type of cell.          */
when newV8==head  then newV7= tail
when newV8==tail  then newV7= wire
when newV8==wire  then do;  newV9= hood();   if newV9==1 | newV9==2  then newV7= head;   end
otherwise     nop
end   /*ͺ*select*/
newV6.r.c= newV7                                 /*ͺ*possible assign a  cell  a new state.*/
end             /*ͺ*c*/
end               /*ͺ*r*/

call assign$                                   /*ͺ*assign alternate cells βββΊ real world*/
if generations>0 | life==gens  then call showCells
end   /*ͺ*life*/
/*ͺ*stop watching the universe (or life).*/
halt: if life-1\==gens  then say 'The  βββWireworldβββ  program was interrupted by user.'
done: exit 0                                     /*ͺ*stick a fork in it,  we are all done.*/
/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
$:         parse arg newV2,newV3;                  return  newV4.newV2.newV3==head
assign$:   do r=1  for rows;   do c=1  for cols;   newV4.r.c= newV6.r.c;   end;   end;      return
hood:      return  $(r-1,c-1)  + $(r-1,c)  + $(r-1,c+1)  + $(r,c-1)  + $(r,c+1)  + $(r+1,c-1)  + $(r+1,c)  + $(r+1,c+1)
p:         return word(arg(1), 1)                           /*ͺ*pick the 1st word in list.*/
pickChar:  parse arg newV10 .;arg U .;L=length(newV10);if U==bla then newV10=' '; if L==3 then newV10=d2c(newV10);if L==2 then newV10=x2c(newV10);return newV10
showRows:  newV10=;  do r=1  for rows; z=;  do c=1 for cols; z= z||newV4.r.c; end;  z= strip(z,'T'); say z; newV10= newV10||z; end; return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showCells: if clearScreen  then 'CLS'                       /*ͺ*βββchange CLS for the host*/
call showRows                                    /*ͺ*show rows in proper order.*/
say right( copies('β', fents)life, fents)        /*ͺ*display a title for cells.*/
if newV10==''                   then signal done      /*ͺ*No life?   Then stop run. */
if newV5.newV10                     then newV1= newV1 + 1 /*ͺ*detected repeated pattern.*/
newV5.newV10= 1                                           /*ͺ*it is now an extant state.*/
if reps\==0 & newV1<=reps  then return           /*ͺ*so far, so good,  no reps.*/
say '"Wireworld" repeated itself'    reps    "times,  the program is stopping."
signal done                                      /*ͺ*jump to this pgm's "exit".*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Wireworld\wireworld.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
