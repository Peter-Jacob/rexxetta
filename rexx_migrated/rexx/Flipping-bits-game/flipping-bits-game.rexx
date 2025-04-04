/*ͺ*REXX program presents a  "flipping bit"  puzzle.  The user can solve via it via  C.L. */
parse arg  N u seed .                            /*ͺ*get optional arguments from the C.L. */
if N==''  |  N==","     then N=3                 /*ͺ*Size given?   Then use default of  3.*/
if u==''  |  u==","     then u=N                 /*ͺ*the number of bits initialized to ON.*/
if datatype(seed, 'W')  then call random ,,seed  /*ͺ*is there a seed (for repeatability?) */
col@= 'a b c d e f g h i j k l m n o p q r s t u v w x y z'     /*ͺ*literal for column id.*/
cols=space(col@, 0);        upper cols           /*ͺ*letters to be used for the columns.  */
newV1.=0;  newV2.=0                                      /*ͺ*set both arrays to  "off" characters.*/
tries=0                                          /*ͺ*number of player's attempts (so far).*/
do  while  show(0) < u                  /*ͺ* [β]   turn  "on"  U  number of bits.*/
r=random(1, N);      c=random(1, N)     /*ͺ*get a random  row  and  column.      */
newV1.r.c=1       ;      newV2.r.c=1            /*ͺ*set (both)  row and column  to ON.   */
end   /*ͺ*while*/                         /*ͺ* [β]  keep going 'til   U   bits set.*/
oz=z                                             /*ͺ*save the original array string.      */
call show 1, '   ββββtargetββββ£', , 1            /*ͺ*display the target for user to attain*/
do random(1,2); call flip 'R',random(1,N) /*ͺ*flip a   row    of  bits.            */
call flip 'C',random(1,N) /*ͺ*  "  "  column   "    "              */
end   /*ͺ*random*/                          /*ͺ* [β]  just perform  1  or  2  times. */
if z==oz  then call flip 'R', random(1, N)       /*ͺ*ensure it's not target we're flipping*/
do  until  z==oz;      call prompt        /*ͺ*prompt until they get it right.      */
call flip left(newV4, 1),  substr(newV4, 2)       /*ͺ*flip a user selected row or column.  */
call show 0                               /*ͺ*get image (Z) of the updated array.  */
end   /*ͺ*until*/
call show 1, '   ββββyour array'                 /*ͺ*display the array to the terminal.   */
say 'βββββββββCongrats!    You did it in'     tries     "tries."
exit tries                                       /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
halt:  say 'program was halted by user.';  exit  /*ͺ*the REXX program was halted by user. */
hdr:   aaa=arg(1);  if oo==1  then aaa=translate(aaa, "βββ", 'βββ');    say aaa;    return
isInt: return datatype( arg(1), 'W')             /*ͺ*returns   1   if  arg  is an integer.*/
isLet: return datatype( arg(1), 'M')             /*ͺ*returns   1   if  arg  is a letter.  */
terr:  if ok  then say  'βββββββββ ***error***:  illegal'  arg(1);        ok=0;     return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
flip: arg x,#;   do c=1  for N  while x=='R';  newV1.#.c = \newV1.#.c;  end  /*ͺ*c*/
do r=1  for N  while x=='C';  newV1.r.# = \newV1.r.#;  end  /*ͺ*r*/;         return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
prompt: if tries\==0  then  say 'βββββββββbit array after play: '         tries
signal on halt                           /*ͺ*another method for the player to quit*/
newV3='βββββββββPlease enter a    row number    or a    column letter,      or  Quit:'
call show 1, '   ββββyour array'         /*ͺ*display the array to the terminal.   */
do forever  until ok;       ok=1;     say;     say newV3;     pull newV4  newV5  .  1  aa
if abbrev('QUIT', newV4, 1)     then do;  say 'βββββββββquittingΒ·Β·Β·';  exit 0;  end
if newV4==''                    then do;  call show 1,"   ββββtargetββββ£",.,1; ok=0
call show 1,"   ββββyour array"
end                       /*ͺ* [β] reshow targ*/
if newV5 \== ''                 then call terr 'too many args entered:'   aa
if \isInt(newV4) & \isLet(newV4)    then call terr 'row/column: '             newV4
if  isLet(newV4)                then a=pos(newV4, cols)
if  isLet(newV4) & (a<1 | a>N | length(newV4)>1)  then call terr 'column: '   newV4
if  isLet(newV4)                then newV4='C'pos(newV4, cols)
if  isInt(newV4) & (newV4<1 | newV4>N)  then call terr 'row: '                    newV4
if  isInt(newV4)                then newV4='R' || (newV4/1)            /*ͺ*normalize number*/
end   /*ͺ*forever*/                                          /*ͺ*end of da checks*/
tries= tries + 1                                              /*ͺ*bump da counter.*/
return newV4                                                      /*ͺ*return response.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: newV6=0;              newV5=;            parse arg tell,tx,o,oo         /*ͺ*$βξεχΦ³num of ON bits*/
if tell  then do; say;     say '     '   subword(col@, 1, N)   "  column letter"
call hdr 'row β'copies('β', N+N+1)            /*ͺ*prepend col hdrs*/
end                                               /*ͺ* [β]  grid hdrs.*/
z=                                                              /*ͺ* [β] build grid.*/
do   r=1  for N                                               /*ͺ*show  grid rows.*/
do c=1  for N;  if o==.  then do;  z=z || newV2.r.c;  newV5=newV5 newV2.r.c;  newV6=newV6 + newV2.r.c;   end
else do;  z=z || newV1.r.c;  newV5=newV5 newV1.r.c;  newV6=newV6 + newV1.r.c;   end
end   /*ͺ*c*/                                                 /*ͺ*Β·Β·Β· and sum ONs.*/
if tx\==''  then tar.r=newV5 tx                                   /*ͺ*build da target?*/
if tell     then call hdr right(r, 2)   ' β'newV5   tx; newV5=        /*ͺ*show the grid?  */
end     /*ͺ*r*/                                                 /*ͺ*show a grid row.*/
if tell  then say;                     return newV6                 /*ͺ*show blank line?*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Flipping-bits-game\flipping-bits-game.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
