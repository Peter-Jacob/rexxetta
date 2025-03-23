/*�*REXX program plays  (with a human)  the     tic─tac─toe     game  on an   NxN   grid. */
newV3= copies('─', 9)                                /*�*eyecatcher for error messages, prompt*/
oops   = newV3  '***error*** '                       /*�*literal for when an error happens.   */
single = '│─┼';    jam= "║";    bar= '═';     junc= "╬";         dbl=jam || bar || junc
sw     = linesize() - 1                          /*�*obtain width of the terminal (less 1)*/
parse arg N hm cm .,newV1.                           /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=3;   oN=N              /*�*N  not specified?   Then use default.*/
N = abs(N)                                  /*�*if N < 0.  then computer goes first. */
NN = N*N                                     /*�*calculate the   square of  N.        */
middle = NN % 2   +   N % 2                      /*�*    "      "    middle  "  the grid. */
if N<2  then do;  say oops  'tic─tac─toe grid is too small: '    N;     exit 13;    end
pad= left('', sw % NN)                           /*�*display padding:  6x6  in 80 columns.*/
if hm==''  then hm= "X";                         /*�*define the marker for  a   human.    */
if cm==''  then cm= "O"                          /*�*   "    "     "    "  the  computer. */
hm= aChar(hm, 'human')           /*�*determine if the marker is legitimate*/
cm= aChar(cm, 'computer')        /*�*    "      "  "     "    "      "    */
parse upper value  hm  cm     with     uh  uc    /*�*use uppercase values is markers:  X x*/
if uh==uc  then cm= word('O X', 1 + (uh=="O") )  /*�*The human wants Hal's marker?  Swap. */
if oN<0  then call Hmove middle                  /*�*Hal moves first? Then choose middling*/
else call showGrid                      /*�*showGrid also checks for wins & draws*/

/*�*tic─tac─toe game───►*/     do  forever         /*�*'til the cows come home  (or  QUIT). */
/*�*tic─tac─toe game───►*/     call CBLF           /*�*process carbon─based lifeform's move.*/
/*�*tic─tac─toe game───►*/     call Hal            /*�*determine Hal's  (the computer) move.*/
/*�*tic─tac─toe game───►*/     end   /*�*forever*/   /*�*showGrid subroutine does wins & draws*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
aChar: parse arg x,whoseX;  L=length(x)                               /*�*process markers.*/
if L==1                        then return testB(     x  )     /*�*1 char,  as is. */
if L==2 & datatype(x, 'X')     then return testB( x2c(x) )     /*�*2 chars, hex.   */
if L==3 & datatype(x, 'W') & ,                                 /*�*3 chars, decimal*/
x>=0 & x<256                then return testB( d2c(x) )     /*�*···and in range.*/
say oops  'illegal character or character code for'    whoseX    "marker: "    x
exit 13                                   /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
CBLF:  prompt='Please enter a cell number to place your next marker ['hm"]     (or Quit):"

do forever;                 say newV3 prompt
parse pull  x 1 ux 1 ox;    upper ux    /*�*get versions of answer;  uppercase ux*/
if datatype(ox, 'W')  then ox=ox / 1    /*�*normalize cell number:  +0007 ───► 7 */
/*�*(division by unity normalizes a num.)*/
select                                /*�*perform some validations of X (cell#)*/
when abbrev('QUIT',ux,1)  then call tell 'quitting.'
when x=''                 then iterate                    /*�*Nada?  Try again.*/
when words(x)\==1         then say oops "too many" cell#  'specified:'   x
when \datatype(x, 'N')    then say oops "cell number isn't numeric: "        x
when \datatype(x, 'W')    then say oops "cell number isn't an integer: "     x
when x=0                  then say oops "cell number can't be zero: "        x
when x<0                  then say oops "cell number can't be negative: "    x
when x>NN                 then say oops "cell number can't exceed "          NN
when newV1.ox\==''            then say oops "cell number is already occupied: "  x
otherwise                 leave  /*�*forever*/
end   /*�*select*/

end     /*�*forever*/
/*�* [↓]  OX is a normalized version of X*/
newV1.ox= hm                                  /*�*place a marker for the human (CLBF). */
call showGrid                             /*�*and display the  tic─tac─toe  grid.  */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Hal:           select                                        /*�*Hal tries various moves. */
when win(cm, N-1)   then call Hmove , ec      /*�*is this the winning move?*/
when win(hm, N-1)   then call Hmove , ec      /*�* "   "   a blocking   "  */
when newV1.middle== ''  then call Hmove middle    /*�*pick the  center  cell.  */
when newV1.N.N  ==  ''  then call Hmove , N N     /*�*bottom right corner cell.*/
when newV1.N.1  ==  ''  then call Hmove , N 1     /*�*   "    left    "     "  */
when newV1.1.N  ==  ''  then call Hmove , 1 N     /*�*  top  right    "     "  */
when newV1.1.1  ==  ''  then call Hmove , 1 1     /*�*   "    left    "     "  */
otherwise                call Hmove , ac      /*�*pick a blank cell in grid*/
end   /*�*select*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Hmove: parse arg Hplace,dr dc;     if Hplace==''  then Hplace = (dr - 1)*N    +  dc
newV1.Hplace= cm                                          /*�*place computer's marker. */
say;  say  newV3   'computer places a marker  ['cm"]  at cell number  "    Hplace
call showGrid
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showGrid: newV4= 0;              cW= 5;     cH= 3;       open= 0 /*�*cell width,  cell height.*/
do   r=1  for N                                   /*�*construct array of cells.*/
do c=1  for N;  newV4= newV4 + 1;  newV1.r.c= newV1.newV4;  open= open  |  newV1.newV4==''
end   /*�*c*/
end     /*�*r*/                                     /*�* [↑]  OPEN≡a cell is open*/
say                                                   /*�* [↑]  create grid coörds.*/
z= 0;         do     j=1  for  N                      /*�* [↓]  show grids&markers.*/
do   t=1  for cH;    newV4=;  newV2=         /*�*MK is a marker in a cell.*/
do k=1  for  N;    if t==2  then z= z + 1;        mk=;     c#=
if t==2  then do;  mk= newV1.z;      c#= z      /*�*c# is cell number*/
end
newV4= newV4   ||  jam  ||  center(mk, cW)
newV2= newV2  ||  jam  ||  center(c#, cW)
end   /*�*k*/
say pad  substr(newV4, 2)  pad  translate( substr(newV2, 2),  single, dbl)
end     /*�*t*/                                 /*�* [↑]  show a line*/
if j==N  then leave
newV4=
do b=1  for  N;       newV4= newV4  ||  junc  ||  copies(bar, cW)
end   /*�*b*/                                  /*�* [↑]  a grid part*/
say   pad  substr(newV4, 2)  pad  translate( substr(newV4,  2),  single, dbl)
end        /*�*j*/
say
if win(hm)  then  call tell  'You  ('hm")  won"copies('!',random(1, 5) )
if win(cm)  then  call tell  'The computer  ('cm")  won."
if \open    then  call tell  'This tic─tac─toe game is a draw   (a cat scratch).'
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell:  do 4; say; end;     say center(' 'arg(1)" ", sw, '─');      do 5; say; end;    exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
testB: parse arg bx; if bx\==' '  then return bx /*�*test if the  marker  isn't  a  blank.*/
say oops   'character code for'      whoseX      "marker can't be a blank."
exit 13                                   /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
win:   parse arg wm,w;        if w==''  then w= N        /*�* [↓]  see if there is a win. */
ac=                                               /*�* [↓]  EC ≡ means Empty Cell. */
do   r=1  for N;  newV4= 0;  ec=                 /*�*see if any  rows are a winner*/
do c=1  for N;  newV4= newV4 + (newV1.r.c==wm)         /*�*count the # of markers in col*/
if newV1.r.c==''              then ec= r c     /*�*Cell empty?  Then remember it*/
end   /*�*c*/                                /*�* [↓]  AC≡means available cell*/
if ec\==''                  then ac=ec       /*�*Found an empty?  Then use it.*/
if newV4==N | (newV4>=w & ec\=='')  then return 1==1 /*�*a winner has been determined.*/
end     /*�*r*/                                /*�*w=N-1?  Checking for near win*/

do   c=1  for N;  newV4= 0;  ec=                 /*�*see if any  cols are a winner*/
do r=1  for N;  newV4= newV4 + (newV1.r.c==wm)         /*�*count the # of markers in row*/
if newV1.r.c==''              then ec= r c     /*�*Cell empty?  Then remember it*/
end   /*�*r*/
if ec\==''                  then ac= ec      /*�*Found an empty? Then remember*/
if newV4==N | (newV4>=w & ec\=='')  then return 1==1 /*�*a winner has been determined.*/
end     /*�*c*/
newV4= 0;  ec=                 /*�*EC≡location of an empty cell.*/
do d=1  for N;    newV4= newV4 + (newV1.d.d==wm)         /*�*A winning descending diag. ? */
if newV1.d.d==''                then ec= d d     /*�*Empty cell?  Then note cell #*/
end     /*�*d*/

if newV4==N  |  (newV4>=w  &  ec\=='')   then return 1==1 /*�*a winner has been determined.*/
newV4= 0;  r= 1
do c=N  for N  by -1;   newV4=newV4 + (newV1.r.c==wm)    /*�*A winning ascending diagonal?*/
if newV1.r.c==''                then ec= r c     /*�*Empty cell?  Then note cell #*/
r= r + 1                                     /*�*bump the counter for the rows*/
end     /*�*c*/

if newV4==N  |  (newV4>=w  &  ec\=='')   then return 1==1 /*�*a winner has been determined.*/
return 0==1                                       /*�*no winner "    "       "     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tic-tac-toe\tic-tac-toe.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
