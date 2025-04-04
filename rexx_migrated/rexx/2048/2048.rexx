/*ͺ*REXX program lets a user play the  2048  game on an  NxN  grid  (default is 4x4 grid).*/
parse arg N win seed .                           /*ͺ*obtain optional arguments from the CL*/
if   N=='' |   N==","  then    N=     4          /*ͺ*Not specified?  Then use the default.*/
if win=='' | win==","  then  win= 2**11          /*ͺ* "      "         "   "   "      "   */
if datatype(seed, 'W') then call random ,,seed   /*ͺ*Specified?  Then use seed for RANDOM.*/
L= length(win) + 2                               /*ͺ*L:  used for displaying the grid #'s.*/
eye=copies("β", 8);  pad=left('', length(eye)+2) /*ͺ*eye catchers; and perusable perusing.*/
b= ' '                                           /*ͺ*comfortable readable name for a blank*/
newV1= 'CLS'                                      /*ͺ*hardcoded command to clear the screen*/
prompt= eye "Please enter a direction  (Up, Down, Right, Left)       βββorβββ    Quit:"
move= 1;     moves= 0;      score= 0;      ok= 1 /*ͺ*simulation that a move was performed.*/
newV2.= b                                            /*ͺ*define all grid elements to a blank. */
do  until any(win);  if ok  then call put;   ok= 1;   say;    call showGrid
say;  say prompt;   parse pull a x . 1 d 2 1 way xx   /*ͺ*show prompt; obtain answer.*/
if datatype(a, 'U')     then newV1           /*ͺ*if uppercase, then clear the screen. */
if a==''  then do;  ok= 0                   /*ͺ*the user entered blank(s) or nothing.*/
say copies(eye, 5)   'moves:'   moves    eye     "score:"   score
iterate                 /*ͺ* [β]  display # of moves & the score.*/
end
upper d a x                                 /*ͺ*uppercase contents of three variables*/
if x\==''               then call err  "too many arguments entered: "   xx
if abbrev('QUIT',a,1)   then do;  say;  say eye  "quitting the game".;  exit 1;   end
good=abbrev('UP',a,1) | abbrev("DOWN",a,1) | abbrev('RIGHT',a,1) | abbrev("LEFT",a,1)
if \good                then call err  "invalid direction: "       way
if \ok  then  iterate;       moves= moves + 1;                call mov
end   /*ͺ*until*/
say
say translate(eye  "Congrats!!  You've won the"  win  'game!' eye,"β",'β')  "score:" score
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
@:   procedure expose newV2.;  parse arg row,col;                return newV2.row.col
any: arg ?; do r=1  for N; do c=1  for N;  if newV2.r.c==?  then return 1; end; end;  return 0
err: say;   say eye  '***error*** '   arg(1);       say;                  ok=0;   return
onewV6c: newV4=;  do k=1  for N; newV4=newV4 word(newV2.k.c .,1); end;  newV5=space(translate(newV4,,.))==''; return newV4
onewV6r: newV4=;  do k=1  for N; newV4=newV4 word(newV2.r.k .,1); end;  newV5=space(translate(newV4,,.))==''; return newV4
put: if \any(b) then call err ,"game over, no more moves."; if move then call two; return
row: if r==0 | r>N  then return copies('β', L);                    return center(newV2.r.c, L)
ten: if random(9)==4  then return 4;   return 2  /*ͺ*10% of the time,  use 4 instead of 2.*/
two:   do  until newV2.p.q==b;  p= random(1,N);  q= random(1,N);  end;   newV2.p.q= ten();  return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
showGrid:     do    r=0  for N+2;    newV6= 'β';                 newV3= "β "
do c=1  for N;      newV6= newV6  ||  row()'β';     newV3= newV3  ||  copies("β", L)'β¬'
end   /*ͺ*c*/
if r==0  then newV6= 'β'translate( substr(newV6, 2, length(newV6) - 2),  "β¦",  'β')"β"
if r >N  then newV6= 'β'translate( substr(newV6, 2, length(newV6) - 2),  "β©",  'β')"β"
say pad newV6
if r<N & r>0  then say pad substr(newV3, 1, length(newV3) - 1)"βξεχΦ·"
end      /*ͺ*r*/;        return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
mov: move= 0;    if d=='R'  then call moveLR N, 1, -1    /*ͺ*move (slide) numbers    βΊ    */
if d=='L'  then call moveLR 1, N, +1    /*ͺ*  "     "       "       β    */
if d=='U'  then call moveUD 1, N, +1    /*ͺ*  "     "       "       β    */
if d=='D'  then call moveUD N, 1, -1    /*ͺ*  "     "       "       β    */
if \move  then call err 'moving '    way    " doesn't change anything.";       return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
moveLR: parse arg start, sTo, newV7                                   /*ͺ*slide   β   or   βΊ  */
do   r=1  for N;    old= onewV6r();      if newV5  then iterate /*ͺ*is this row blank?  */
do N-1;           call packLR                         /*ͺ*pack    β  or   βΊ   */
end        /*ͺ*N-1*/                                    /*ͺ* [β]  get new tiles.*/
new= onewV6r();              move= move | (old\==new)       /*ͺ*indicate tiles moved*/
do c=start  for N-1  by newV7  while newV2.r.c\==b          /*ͺ*slide   β  or   βΊ   */
if newV2.r.c\==@(r,c+newV7)  then iterate                   /*ͺ*not a duplicate ?   */
newV2.r.c= newV2.r.c * 2;    score= score + newV2.r.c           /*ͺ*double;  bump score */
c= c + newV7        ;    newV2.r.c= b;         move= 1      /*ͺ*bump C; blank dup 2.*/
end      /*ͺ*c*/                                      /*ͺ* [β]  indicate move.*/
call packLR                                             /*ͺ*pack    β  or    βΊ  */
end          /*ͺ*r*/;                        return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
moveUD: parse arg start, Sto, newV7                                   /*ͺ*slide   β   or   β  */
do   c=1  for N;    old= onewV6c();      if newV5  then iterate /*ͺ*is this col blank?  */
do N-1;           call packUD                         /*ͺ*pack  up or down.   */
end        /*ͺ*N-1*/                                    /*ͺ* [β]  get new tiles.*/
new= onewV6c();              move= move | (old\==new)       /*ͺ*indicate tiles moved*/
do r=start  for N-1  by newV7  while newV2.r.c\==b          /*ͺ*slide   β   or   β  */
if newV2.r.c\==@(r+newV7,c)  then iterate                   /*ͺ*not a duplicate ?   */
newV2.r.c= newV2.r.c * 2;    score= score + newV2.r.c           /*ͺ*double;  bump score */
r= r + newV7        ;    newV2.r.c= b;         move= 1      /*ͺ*bump R; blank dup 2.*/
end      /*ͺ*r*/                                      /*ͺ* [β]  indicate move.*/
call packUD                                             /*ͺ*pack    β   or   β  */
end          /*ͺ*c*/;                        return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
packLR:   do c=start  for N-1  by newV7;   if newV2.r.c\==b  then iterate /*ͺ*Not a blank?  Skip. */
do s=c  to sTo  by newV7;     newV2.r.s= @(r, s + newV7)         /*ͺ*slide   β   or   βΊ  */
end   /*ͺ*s*/;              newV2.r.sTo= b                 /*ͺ*handle the last one.*/
end      /*ͺ*c*/;                            return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
packUD:   do r=start  for N-1  by newV7;   if newV2.r.c\==b  then iterate /*ͺ*Not a blank?  Skip. */
do s=r  to sTo  by newV7;     newV2.s.c= @(s + newV7, c)         /*ͺ*slide   β   or   β  */
end   /*ͺ*s*/;              newV2.sTo.c= b                 /*ͺ*handle the last one.*/
end      /*ͺ*r*/;                            return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\2048\2048.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
