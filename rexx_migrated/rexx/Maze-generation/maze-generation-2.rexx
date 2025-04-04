/*ͺ*REXX program  generates and displays  a  rectangular  solvable maze  (of any size).   */
parse arg rows cols seed .                       /*ͺ*allow user to specify the maze size. */
if rows='' | rows==","  then rows= 19            /*ͺ*No rows given?  Then use the default.*/
if cols='' | cols==","  then cols= 19            /*ͺ* " cols   "  ?    "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*use a random  seed for repeatability.*/
ht=0;                        newV1.=0                /*ͺ*HT= # rows in grid;  @.: default cell*/
call makeRow 'β'copies("ββ¬", cols-1)'ββ'         /*ͺ*construct the  top edge  of the maze.*/

do    r=1  for rows;   newV6=;     newV2=;      hp= "|";              hj= 'β'
do c=1  for cols;   newV6= newV6 || hp'1';    newV2= newV2 || hj"β";      hj= 'βΌ';      hp= "β"
end   /*ͺ*c*/
call makeRow  newV6'β'       /*ͺ*construct the right edge of the cells*/
if r\==rows  then call makeRow newV2'β€'       /*ͺ*    "      "    "     "   "  "  maze.*/
end      /*ͺ*r*/                             /*ͺ* [β]  construct the maze's grid.     */

call makeRow 'β'copies("ββ΄", cols-1)'ββ'         /*ͺ*construct the bottom edge of the maze*/
r!= random(1, rows)*2;    c!= random(1, cols)*2;     newV1.r!.c!= 0   /*ͺ*choose the 1st cell.*/
/*ͺ* [β]  traipse through the maze.      */
do forever;        n= hood(r!, c!)             /*ͺ*number of free maze cells.           */
if n==0  then if \fCell()  then leave          /*ͺ*if no free maze cells left, then done*/
call newV7;            newV1.newV4.newV5= 0                  /*ͺ*get the (next) maze direction to go. */
ro= r!;            co= c!;    r!= newV4;   c!= newV5 /*ͺ*save the original cell coordinates.  */
newV3.zr= newV3.zr % 2;    newV3.zc= newV3.zc % 2              /*ͺ*get the maze row and cell directions.*/
rw= ro + newV3.zr;     cw= co + newV3.zc               /*ͺ*calculate the next maze row and col. */
newV1.rw.cw=.                                      /*ͺ*mark the maze cell as being visited. */
end   /*ͺ*forever*/
/*ͺ* [β]  display maze to the terminal.  */
do     r=1  for ht;           newV6=
do c=1  for cols*2 + 1;   newV6= newV6 || newV1.r.c;   end  /*ͺ*c*/
if \(r//2)  then newV6= translate(newV6, '\',.) /*ͺ*translate a  period  to a  backslash.*/
newV6=  changestr( 1 ,  newV6  , 111   )        /*ͺ*ββββββthese four ββββββββββββββββββββ*/
newV6=  changestr( 0 ,  newV6  , 000   )        /*ͺ*βββββββββ statements are ββββββββββββ*/
newV6=  changestr( . ,  newV6  , "   " )        /*ͺ*ββββββββββββββ used for preserving ββ*/
newV6=  changestr('β',  newV6  , "βββ" )        /*ͺ*ββββββββββββββββββ the aspect ratio. */
say translate( newV6 , 'β' , "|\10")        /*ͺ*make it presentable for the screen.  */
end   /*ͺ*r*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@:       parse arg newV4,newV5;     return  newV1.newV4.newV5    /*ͺ*a fast way to reference a maze cell. */
makeRow: parse arg z; ht= ht+1;  do c=1  for length(z); newV1.ht.c=substr(z,c,1);  end; return
hood:    parse arg rh,ch;     return  @(rh+2,ch)  + @(rh-2,ch)  + @(rh,ch-2)  + @(rh,ch+2)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV7:         do forever;  newV3.= 0;   newV7= random(1, 4);     if newV7==1  then newV3.zc= -2     /*ͺ*north*/
if newV7==2  then newV3.zr=  2     /*ͺ* east*/
if newV7==3  then newV3.zc=  2     /*ͺ*south*/
if newV7==4  then newV3.zr= -2     /*ͺ* west*/
newV4= r! + newV3.zr;       newV5= c! + newV3.zc;        if newV1.newV4.newV5 == 1    then return
end   /*ͺ*forever*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fCell:     do     r=1  for rows;                rr= r + r
do c=1  for cols;                         cc= c + c
if hood(rr,cc)==1  then do;  r!= rr;  c!= cc;   newV1.r!.c!= 0;  return 1;  end
end   /*ͺ*c*/                       /*ͺ* [β]  r! and c!  are used by invoker.*/
end       /*ͺ*r*/;       return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Maze-generation\maze-generation-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
