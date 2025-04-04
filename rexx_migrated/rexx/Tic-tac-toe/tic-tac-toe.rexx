/*ͺ*REXX program plays  (with a human)  the     ticβtacβtoe     game  on an   NxN   grid. */
newV3= copies('β', 9)                                /*ͺ*eyecatcher for error messages, prompt*/
oops   = newV3  '***error*** '                       /*ͺ*literal for when an error happens.   */
single = 'βββΌ';    jam= "β";    bar= 'β';     junc= "β¬";         dbl=jam || bar || junc
sw     = linesize() - 1                          /*ͺ*obtain width of the terminal (less 1)*/
parse arg N hm cm .,newV1.                           /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N=3;   oN=N              /*ͺ*N  not specified?   Then use default.*/
N = abs(N)                                  /*ͺ*if N < 0.  then computer goes first. */
NN = N*N                                     /*ͺ*calculate the   square of  N.        */
middle = NN % 2   +   N % 2                      /*ͺ*    "      "    middle  "  the grid. */
if N<2  then do;  say oops  'ticβtacβtoe grid is too small: '    N;     exit 13;    end
pad= left('', sw % NN)                           /*ͺ*display padding:  6x6  in 80 columns.*/
if hm==''  then hm= "X";                         /*ͺ*define the marker for  a   human.    */
if cm==''  then cm= "O"                          /*ͺ*   "    "     "    "  the  computer. */
hm= aChar(hm, 'human')           /*ͺ*determine if the marker is legitimate*/
cm= aChar(cm, 'computer')        /*ͺ*    "      "  "     "    "      "    */
parse upper value  hm  cm     with     uh  uc    /*ͺ*use uppercase values is markers:  X x*/
if uh==uc  then cm= word('O X', 1 + (uh=="O") )  /*ͺ*The human wants Hal's marker?  Swap. */
if oN<0  then call Hmove middle                  /*ͺ*Hal moves first? Then choose middling*/
else call showGrid                      /*ͺ*showGrid also checks for wins & draws*/

/*ͺ*ticβtacβtoe gameββββΊ*/     do  forever         /*ͺ*'til the cows come home  (or  QUIT). */
/*ͺ*ticβtacβtoe gameββββΊ*/     call CBLF           /*ͺ*process carbonβbased lifeform's move.*/
/*ͺ*ticβtacβtoe gameββββΊ*/     call Hal            /*ͺ*determine Hal's  (the computer) move.*/
/*ͺ*ticβtacβtoe gameββββΊ*/     end   /*ͺ*forever*/   /*ͺ*showGrid subroutine does wins & draws*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
aChar: parse arg x,whoseX;  L=length(x)                               /*ͺ*process markers.*/
if L==1                        then return testB(     x  )     /*ͺ*1 char,  as is. */
if L==2 & datatype(x, 'X')     then return testB( x2c(x) )     /*ͺ*2 chars, hex.   */
if L==3 & datatype(x, 'W') & ,                                 /*ͺ*3 chars, decimal*/
x>=0 & x<256                then return testB( d2c(x) )     /*ͺ*Β·Β·Β·and in range.*/
say oops  'illegal character or character code for'    whoseX    "marker: "    x
exit 13                                   /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
CBLF:  prompt='Please enter a cell number to place your next marker ['hm"]     (or Quit):"

do forever;                 say newV3 prompt
parse pull  x 1 ux 1 ox;    upper ux    /*ͺ*get versions of answer;  uppercase ux*/
if datatype(ox, 'W')  then ox=ox / 1    /*ͺ*normalize cell number:  +0007 ββββΊ 7 */
/*ͺ*(division by unity normalizes a num.)*/
select                                /*ͺ*perform some validations of X (cell#)*/
when abbrev('QUIT',ux,1)  then call tell 'quitting.'
when x=''                 then iterate                    /*ͺ*Nada?  Try again.*/
when words(x)\==1         then say oops "too many" cell#  'specified:'   x
when \datatype(x, 'N')    then say oops "cell number isn't numeric: "        x
when \datatype(x, 'W')    then say oops "cell number isn't an integer: "     x
when x=0                  then say oops "cell number can't be zero: "        x
when x<0                  then say oops "cell number can't be negative: "    x
when x>NN                 then say oops "cell number can't exceed "          NN
when newV1.ox\==''            then say oops "cell number is already occupied: "  x
otherwise                 leave  /*ͺ*forever*/
end   /*ͺ*select*/

end     /*ͺ*forever*/
/*ͺ* [β]  OX is a normalized version of X*/
newV1.ox= hm                                  /*ͺ*place a marker for the human (CLBF). */
call showGrid                             /*ͺ*and display the  ticβtacβtoe  grid.  */
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Hal:           select                                        /*ͺ*Hal tries various moves. */
when win(cm, N-1)   then call Hmove , ec      /*ͺ*is this the winning move?*/
when win(hm, N-1)   then call Hmove , ec      /*ͺ* "   "   a blocking   "  */
when newV1.middle== ''  then call Hmove middle    /*ͺ*pick the  center  cell.  */
when newV1.N.N  ==  ''  then call Hmove , N N     /*ͺ*bottom right corner cell.*/
when newV1.N.1  ==  ''  then call Hmove , N 1     /*ͺ*   "    left    "     "  */
when newV1.1.N  ==  ''  then call Hmove , 1 N     /*ͺ*  top  right    "     "  */
when newV1.1.1  ==  ''  then call Hmove , 1 1     /*ͺ*   "    left    "     "  */
otherwise                call Hmove , ac      /*ͺ*pick a blank cell in grid*/
end   /*ͺ*select*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Hmove: parse arg Hplace,dr dc;     if Hplace==''  then Hplace = (dr - 1)*N    +  dc
newV1.Hplace= cm                                          /*ͺ*place computer's marker. */
say;  say  newV3   'computer places a marker  ['cm"]  at cell number  "    Hplace
call showGrid
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showGrid: newV4= 0;              cW= 5;     cH= 3;       open= 0 /*ͺ*cell width,  cell height.*/
do   r=1  for N                                   /*ͺ*construct array of cells.*/
do c=1  for N;  newV4= newV4 + 1;  newV1.r.c= newV1.newV4;  open= open  |  newV1.newV4==''
end   /*ͺ*c*/
end     /*ͺ*r*/                                     /*ͺ* [β]  OPENβ‘a cell is open*/
say                                                   /*ͺ* [β]  create grid coΓΆrds.*/
z= 0;         do     j=1  for  N                      /*ͺ* [β]  show grids&markers.*/
do   t=1  for cH;    newV4=;  newV2=         /*ͺ*MK is a marker in a cell.*/
do k=1  for  N;    if t==2  then z= z + 1;        mk=;     c#=
if t==2  then do;  mk= newV1.z;      c#= z      /*ͺ*c# is cell number*/
end
newV4= newV4   ||  jam  ||  center(mk, cW)
newV2= newV2  ||  jam  ||  center(c#, cW)
end   /*ͺ*k*/
say pad  substr(newV4, 2)  pad  translate( substr(newV2, 2),  single, dbl)
end     /*ͺ*t*/                                 /*ͺ* [β]  show a line*/
if j==N  then leave
newV4=
do b=1  for  N;       newV4= newV4  ||  junc  ||  copies(bar, cW)
end   /*ͺ*b*/                                  /*ͺ* [β]  a grid part*/
say   pad  substr(newV4, 2)  pad  translate( substr(newV4,  2),  single, dbl)
end        /*ͺ*j*/
say
if win(hm)  then  call tell  'You  ('hm")  won"copies('!',random(1, 5) )
if win(cm)  then  call tell  'The computer  ('cm")  won."
if \open    then  call tell  'This ticβtacβtoe game is a draw   (a cat scratch).'
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell:  do 4; say; end;     say center(' 'arg(1)" ", sw, 'β');      do 5; say; end;    exit
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
testB: parse arg bx; if bx\==' '  then return bx /*ͺ*test if the  marker  isn't  a  blank.*/
say oops   'character code for'      whoseX      "marker can't be a blank."
exit 13                                   /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
win:   parse arg wm,w;        if w==''  then w= N        /*ͺ* [β]  see if there is a win. */
ac=                                               /*ͺ* [β]  EC β‘ means Empty Cell. */
do   r=1  for N;  newV4= 0;  ec=                 /*ͺ*see if any  rows are a winner*/
do c=1  for N;  newV4= newV4 + (newV1.r.c==wm)         /*ͺ*count the # of markers in col*/
if newV1.r.c==''              then ec= r c     /*ͺ*Cell empty?  Then remember it*/
end   /*ͺ*c*/                                /*ͺ* [β]  ACβ‘means available cell*/
if ec\==''                  then ac=ec       /*ͺ*Found an empty?  Then use it.*/
if newV4==N | (newV4>=w & ec\=='')  then return 1==1 /*ͺ*a winner has been determined.*/
end     /*ͺ*r*/                                /*ͺ*w=N-1?  Checking for near win*/

do   c=1  for N;  newV4= 0;  ec=                 /*ͺ*see if any  cols are a winner*/
do r=1  for N;  newV4= newV4 + (newV1.r.c==wm)         /*ͺ*count the # of markers in row*/
if newV1.r.c==''              then ec= r c     /*ͺ*Cell empty?  Then remember it*/
end   /*ͺ*r*/
if ec\==''                  then ac= ec      /*ͺ*Found an empty? Then remember*/
if newV4==N | (newV4>=w & ec\=='')  then return 1==1 /*ͺ*a winner has been determined.*/
end     /*ͺ*c*/
newV4= 0;  ec=                 /*ͺ*ECβ‘location of an empty cell.*/
do d=1  for N;    newV4= newV4 + (newV1.d.d==wm)         /*ͺ*A winning descending diag. ? */
if newV1.d.d==''                then ec= d d     /*ͺ*Empty cell?  Then note cell #*/
end     /*ͺ*d*/

if newV4==N  |  (newV4>=w  &  ec\=='')   then return 1==1 /*ͺ*a winner has been determined.*/
newV4= 0;  r= 1
do c=N  for N  by -1;   newV4=newV4 + (newV1.r.c==wm)    /*ͺ*A winning ascending diagonal?*/
if newV1.r.c==''                then ec= r c     /*ͺ*Empty cell?  Then note cell #*/
r= r + 1                                     /*ͺ*bump the counter for the rows*/
end     /*ͺ*c*/

if newV4==N  |  (newV4>=w  &  ec\=='')   then return 1==1 /*ͺ*a winner has been determined.*/
return 0==1                                       /*ͺ*no winner "    "       "     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tic-tac-toe\tic-tac-toe.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
