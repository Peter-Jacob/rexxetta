/*ª*REXX program plays rockâ”€paperâ”€scissors with a human;  tracks what human tends to use. */
newV3= 'â”€â”€â”€â”€â”€â”€â”€â”€';  err=newV3 "***error***";    newV1.=0     /*ª*some constants for this program.     */
prompt= newV3 'Please enter one of:     Rock   Paper   Scissors      (or Quit)'
newV2.p= 'paper' ;  newV2.s= "scissors";   newV2.r= 'rock'   /*ª*list of the choices in this program. */
t.p= newV2.r     ;  t.s= newV2.p       ;   t.r= newV2.s      /*ª*thingys that beats  stuff.           */
w.p= newV2.s     ;  w.s= newV2.r       ;   w.r= newV2.p      /*ª*stuff     "    "   thingys.          */
b.p= 'covers';  b.s= "cuts"    ;   b.r= 'breaks' /*ª*verbs:   how the choice wins.        */

do forever;     say;      say prompt;     say  /*ª*prompt the CBLF; then get a response.*/
c= word(newV2.p newV2.s newV2.r,      random(1, 3) )       /*ª*choose the computer's first pick.    */
m= max(newV1.r, newV1.p, newV1.s);    c= w.r               /*ª*prepare to examine the choice history*/
if newV1.p==m  then c= w.p                         /*ª*emulate JC's:  The Amazing Karnac.   */
if newV1.s==m  then c= w.s                         /*ª*   "     "      "     "       "      */
c1= left(c, 1)                                 /*ª*C1  is used for faster comparing.    */
parse pull u;             a= strip(u)          /*ª*get the CBLF's choice/pick (answer). */
upper a c1  ;            a1= left(a, 1)        /*ª*uppercase choices, get 1st character.*/
ok= 0                                          /*ª*indicate answer isn't OK  (so far).  */
select                                    /*ª*process/verify the  CBLF's  choice.  */
when words(u)==0           then           say  err   'nothing entered'
when words(u)>1            then say  err   'too many choices: '  u
when abbrev('QUIT',    a)  then do;  say newV3 "quitting.";      exit;    end
when abbrev('ROCK',    a) |,
abbrev('PAPER',   a) |,
abbrev('SCISSORS',a)  then ok=1      /*ª*Yes?  This is a valid answer by CBLF.*/
otherwise                  say err  'you entered a bad choice: '    u
end   /*ª*select*/

if \ok          then iterate                   /*ª*answer Â¬OK?  Then get another choice.*/
newV1.a1= newV1.a1 + 1                                 /*ª*keep a history of the CBLF's choices.*/
say newV3  'computer chose: '    c
if   a1==  c1  then do;  say newV3  'draw.';   iterate;  end
if newV2.a1==t.c1  then say  newV3  'the computer wins. '    newV3  newV2.c1  b.c1  newV2.a1
else say  newV3  'you win! '              newV3  newV2.a1  b.a1  newV2.c1
end   /*ª*forever*/                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rock-paper-scissors\rock-paper-scissors-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
