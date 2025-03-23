/*�*REXX program  generates and displays  a  rectangular  solvable maze  (of any size).   */
parse arg rows cols seed .                       /*�*allow user to specify the maze size. */
if rows='' | rows==","  then rows= 19            /*�*No rows given?  Then use the default.*/
if cols='' | cols==","  then cols= 19            /*�* " cols   "  ?    "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*�*use a random  seed for repeatability.*/
ht=0;                        newV1.=0                /*�*HT= # rows in grid;  @.: default cell*/
call makeRow '┌'copies("─┬", cols-1)'─┐'         /*�*construct the  top edge  of the maze.*/

do    r=1  for rows;   newV6=;     newV2=;      hp= "|";              hj= '├'
do c=1  for cols;   newV6= newV6 || hp'1';    newV2= newV2 || hj"─";      hj= '┼';      hp= "│"
end   /*�*c*/
call makeRow  newV6'│'       /*�*construct the right edge of the cells*/
if r\==rows  then call makeRow newV2'┤'       /*�*    "      "    "     "   "  "  maze.*/
end      /*�*r*/                             /*�* [↑]  construct the maze's grid.     */

call makeRow '└'copies("─┴", cols-1)'─┘'         /*�*construct the bottom edge of the maze*/
r!= random(1, rows)*2;    c!= random(1, cols)*2;     newV1.r!.c!= 0   /*�*choose the 1st cell.*/
/*�* [↓]  traipse through the maze.      */
do forever;        n= hood(r!, c!)             /*�*number of free maze cells.           */
if n==0  then if \fCell()  then leave          /*�*if no free maze cells left, then done*/
call newV7;            newV1.newV4.newV5= 0                  /*�*get the (next) maze direction to go. */
ro= r!;            co= c!;    r!= newV4;   c!= newV5 /*�*save the original cell coordinates.  */
newV3.zr= newV3.zr % 2;    newV3.zc= newV3.zc % 2              /*�*get the maze row and cell directions.*/
rw= ro + newV3.zr;     cw= co + newV3.zc               /*�*calculate the next maze row and col. */
newV1.rw.cw=.                                      /*�*mark the maze cell as being visited. */
end   /*�*forever*/
/*�* [↓]  display maze to the terminal.  */
do     r=1  for ht;           newV6=
do c=1  for cols*2 + 1;   newV6= newV6 || newV1.r.c;   end  /*�*c*/
if \(r//2)  then newV6= translate(newV6, '\',.) /*�*translate a  period  to a  backslash.*/
newV6=  changestr( 1 ,  newV6  , 111   )        /*�*──────these four ────────────────────*/
newV6=  changestr( 0 ,  newV6  , 000   )        /*�*───────── statements are ────────────*/
newV6=  changestr( . ,  newV6  , "   " )        /*�*────────────── used for preserving ──*/
newV6=  changestr('─',  newV6  , "───" )        /*�*────────────────── the aspect ratio. */
say translate( newV6 , '│' , "|\10")        /*�*make it presentable for the screen.  */
end   /*�*r*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:       parse arg newV4,newV5;     return  newV1.newV4.newV5    /*�*a fast way to reference a maze cell. */
makeRow: parse arg z; ht= ht+1;  do c=1  for length(z); newV1.ht.c=substr(z,c,1);  end; return
hood:    parse arg rh,ch;     return  @(rh+2,ch)  + @(rh-2,ch)  + @(rh,ch-2)  + @(rh,ch+2)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV7:         do forever;  newV3.= 0;   newV7= random(1, 4);     if newV7==1  then newV3.zc= -2     /*�*north*/
if newV7==2  then newV3.zr=  2     /*�* east*/
if newV7==3  then newV3.zc=  2     /*�*south*/
if newV7==4  then newV3.zr= -2     /*�* west*/
newV4= r! + newV3.zr;       newV5= c! + newV3.zc;        if newV1.newV4.newV5 == 1    then return
end   /*�*forever*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fCell:     do     r=1  for rows;                rr= r + r
do c=1  for cols;                         cc= c + c
if hood(rr,cc)==1  then do;  r!= rr;  c!= cc;   newV1.r!.c!= 0;  return 1;  end
end   /*�*c*/                       /*�* [↑]  r! and c!  are used by invoker.*/
end       /*�*r*/;       return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Maze-generation\maze-generation-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
