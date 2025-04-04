/*ͺ*REXX program generates and displays a  rectangular  solvable maze  (of any size).     */
parse arg rows cols seed .                       /*ͺ*allow user to specify the maze size. */
if rows='' | rows==','  then rows= 19            /*ͺ*No rows given?  Then use the default.*/
if cols='' | cols==','  then cols= 19            /*ͺ* " cols   "  ?    "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*use a random  seed for repeatability.*/
ht=0;                        newV1.=0                /*ͺ*HT= # rows in grid;  @.: default cell*/
call makeRow  'β'copies("~β¬", cols - 1)'~β'      /*ͺ*construct the top edge of the maze.  */
/*ͺ* [β]  construct the maze's grid.     */
do    r=1  for rows;   newV6=;     newV2=;      hp= "|";              hj= 'β'
do c=1  for cols;   newV6= newV6 || hp'1';    newV2= newV2 || hj"~";      hj= 'βΌ';      hp= "β"
end   /*ͺ*c*/
call makeRow  newV6'β'       /*ͺ*construct the right edge of the cells*/
if r\==rows  then call makeRow newV2'β€'       /*ͺ*    "      "    "     "   "  "  maze.*/
end      /*ͺ*r*/                             /*ͺ* [β]  construct the maze's grid.     */

call makeRow  'β'copies("~β΄",  cols - 1)'~β'     /*ͺ*construct the bottom edge of the maze*/
r!= random(1, rows) *2;     c!= random(1, cols) *2;      newV1.r!.c!= 0   /*ͺ*choose 1st cell.*/
/*ͺ* [β]  traipse through the maze.      */
do forever;    n= hood(r!, c!);    if n==0  then if \fCell()  then leave  /*ͺ*Β¬freecell?*/
call newV8;        newV1.newV4.newV5= 0                      /*ͺ*get the (next) maze direction to go. */
ro= r!;        co= c!;     r!= newV4;    c!= newV5   /*ͺ*save original maze cell coordinates. */
newV3.zr= newV3.zr % 2;            newV3.zc= newV3.zc % 2      /*ͺ*get the maze row and cell directions.*/
rw= ro + newV3.zr;             cw= co + newV3.zc       /*ͺ*calculate the next row and column.   */
newV1.rw.cw= .                                     /*ͺ*mark the maze cell as being visited. */
end   /*ͺ*forever*/
/*ͺ* [β]  display maze to the terminal.  */
do     r=1  for ht;            newV6=
do c=1  for cols*2 + 1;    newV6= newV6 || newV1.r.c;    end  /*ͺ*c*/
if \(r//2)  then newV6= translate(newV6, '\', .)                   /*ͺ*trans to backslash*/
newV1.r= newV6                                                     /*ͺ*save the row in @.*/
end   /*ͺ*r*/

do newV7=1  for ht;           newV6= newV1.newV7           /*ͺ*display the maze to the terminal.    */
call makeNice                              /*ͺ*prettify cell corners and deadβends. */
newV6=  changestr( 1 ,  newV6   , 111     )        /*ͺ*ββββββthese four ββββββββββββββββββββ*/
newV6=  changestr( 0 ,  newV6   , 000     )        /*ͺ*βββββββββ statements are ββββββββββββ*/
newV6=  changestr( . ,  newV6   , "   "   )        /*ͺ*ββββββββββββββ used for preserving ββ*/
newV6=  changestr('~',  newV6   , "βββ"   )        /*ͺ*ββββββββββββββββββ the aspect ratio. */
say translate( newV6 , 'ββ' , "β|\10" )        /*ͺ*make it presentable for the screen.  */
end   /*ͺ*#*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@:       parse arg newV4,newV5;     return  newV1.newV4.newV5    /*ͺ*a fast way to reference a maze cell. */
makeRow: parse arg z; ht= ht+1;  do c=1  for length(z); newV1.ht.c=substr(z,c,1);  end; return
hood:    parse arg rh,ch;     return  @(rh+2,ch)  + @(rh-2,ch)  + @(rh,ch-2)  + @(rh,ch+2)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV8:         do forever;  newV3.= 0;   newV8= random(1, 4);     if newV8==1  then newV3.zc= -2     /*ͺ*north*/
if newV8==2  then newV3.zr=  2     /*ͺ* east*/
if newV8==3  then newV3.zc=  2     /*ͺ*south*/
if newV8==4  then newV3.zr= -2     /*ͺ* west*/
newV4= r! + newV3.zr;       newV5= c! + newV3.zc;        if newV1.newV4.newV5 == 1    then return
end   /*ͺ*forever*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fCell:     do     r=1  for rows;                rr= r + r
do c=1  for cols;                         cc= c + c
if hood(rr,cc)==1  then do;  r!= rr;  c!= cc;   newV1.r!.c!= 0;  return 1;  end
end   /*ͺ*c*/                       /*ͺ* [β]  r! and c!  are used by invoker.*/
end       /*ͺ*r*/;       return 0
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
makeNice: width= length(newV6);     old= newV7 - 1;     new= newV7 + 1;     oldnewV6= newV1.old;   newnewV6= newV1.new
if left(newV6, 2)=='β.'  then newV6= translate(newV6, "|", 'β')
if right(newV6,2)=='.β€'  then newV6= translate(newV6, "|", 'β€')

do  k=1  for  width  while newV7==1;         z= substr(newV6, k, 1) /*ͺ*maze top row.*/
if z\=='β¬'                  then iterate
if substr(newnewV6, k, 1)=='\'  then newV6= overlay("β", newV6, k)
end   /*ͺ*k*/

do  k=1  for  width  while newV7==ht;        z= substr(newV6, k, 1) /*ͺ*maze bot row.*/
if z\=='β΄'                  then iterate
if substr(oldnewV6, k, 1)=='\'  then newV6= overlay("β", newV6, k)
end   /*ͺ*k*/

do  k=3  to  width-2  by 2  while newV7//2;  z= substr(newV6, k, 1) /*ͺ*maze mid rows*/
if z\=='βΌ'   then iterate
le= substr(newV6   , k-1, 1)
ri= substr(newV6   , k+1, 1)
up= substr(oldnewV6, k  , 1)
dw= substr(newnewV6, k  , 1)
select
when le== .  & ri== .  & up=='β' & dw=="β"  then newV6= overlay('|', newV6, k)
when le=='~' & ri=="~" & up=='\' & dw=="\"  then newV6= overlay('β', newV6, k)
when le=='~' & ri=="~" & up=='\' & dw=="β"  then newV6= overlay('β¬', newV6, k)
when le=='~' & ri=="~" & up=='β' & dw=="\"  then newV6= overlay('β΄', newV6, k)
when le=='~' & ri== .  & up=='\' & dw=="\"  then newV6= overlay('β', newV6, k)
when le== .  & ri=="~" & up=='\' & dw=="\"  then newV6= overlay('β', newV6, k)
when le== .  & ri== .  & up=='β' & dw=="\"  then newV6= overlay('|', newV6, k)
when le== .  & ri== .  & up=='\' & dw=="β"  then newV6= overlay('|', newV6, k)
when le== .  & ri=="~" & up=='\' & dw=="β"  then newV6= overlay('β', newV6, k)
when le== .  & ri=="~" & up=='β' & dw=="\"  then newV6= overlay('β', newV6, k)
when le=='~' & ri== .  & up=='\' & dw=="β"  then newV6= overlay('β', newV6, k)
when le=='~' & ri== .  & up=='β' & dw=="\"  then newV6= overlay('β', newV6, k)
when le=='~' & ri== .  & up=='β' & dw=="β"  then newV6= overlay('β€', newV6, k)
when le== .  & ri=="~" & up=='β' & dw=="β"  then newV6= overlay('β', newV6, k)
otherwise   nop
end   /*ͺ*select*/
end          /*ͺ*k*/;                   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Maze-generation\maze-generation-1.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
