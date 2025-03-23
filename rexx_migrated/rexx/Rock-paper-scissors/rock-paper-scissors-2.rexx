/*ª*REXX pgm plays rockâ”€paperâ”€scissorsâ”€lizardâ”€Spock with human; tracks human usage trend. */
newV3= 'â”€â”€â”€â”€â”€â”€â”€â”€';   err=newV3 "***error***";    newV1.=0    /*ª*some constants for this REXX program.*/
prompt=newV3 'Please enter one of:   Rock  Paper  SCissors  Lizard  SPock  (Vulcan)     (or Quit)'
newV2.p='paper'           ; newV2.s="scissors"        ; newV2.r='rock'          ; newV2.L="lizard"      ; newV2.v='Spock'              /*ª*names of the thingys*/
t.p= newV2.r newV2.v          ; t.s= newV2.p newV2.L          ; t.r= newV2.s newV2.L        ; t.L= newV2.p newV2.v      ; t.v= newV2.r newV2.s             /*ª*thingys beats stuff.*/
w.p= newV2.L newV2.s          ; w.s= newV2.v newV2.r          ; w.r= newV2.v newV2.p        ; w.L= newV2.r newV2.s      ; w.v= newV2.L newV2.p             /*ª*stuff beats thingys.*/
b.p='covers disproves'; b.s="cuts decapitates"; b.r='breaks crushes'; b.L="eats poisons"; b.v='vaporizes smashes'  /*ª*how the choice wins.*/
whom.1= newV3 'the computer wins. ' newV3;     whom.2= newV3 "you win! " newV3;       win= words(t. p)

do forever;   say;   say prompt;     say       /*ª*prompt CBLF; then get a response.    */
c= word(newV2.p newV2.s newV2.r newV2.L newV2.v, random(1, 5) )    /*ª*the computer's first choice/pick.    */
m= max(newV1.r, newV1.p, newV1.s, newV1.L, newV1.v)                /*ª*used in examining CBLF's history.    */
if newV1.p==m  then c= word(w.p, random(1, 2) )    /*ª*emulate JC's  The Amazing Karnac.    */
if newV1.s==m  then c= word(w.s, random(1, 2) )    /*ª*   "     "     "     "       "       */
if newV1.r==m  then c= word(w.r, random(1, 2) )    /*ª*   "     "     "     "       "       */
if newV1.L==m  then c= word(w.L, random(1, 2) )    /*ª*   "     "     "     "       "       */
if newV1.v==m  then c= word(w.v, random(1, 2) )    /*ª*   "     "     "     "       "       */
c1= left(c, 1)                                 /*ª*C1  is used for faster comparing.    */
parse pull u;            a= strip(u)           /*ª*obtain the CBLF's choice/pick.       */
upper a c1  ;           a1= left(a, 1)         /*ª*uppercase the choices, get 1st char. */
ok=0                                           /*ª*indicate answer isn't  OK  (so far). */
select                                    /*ª* [â†“]  process the CBLF's choice/pick.*/
when words(u)==0               then say err    'nothing entered.'
when words(u)>1                then say err    'too many choices: '    u
when abbrev('QUIT',    a)      then do; say newV3  'quitting.';   exit;   end
when abbrev('LIZARD',  a)   |,
abbrev('ROCK',    a)   |,
abbrev('PAPER',   a)   |,
abbrev('VULCAN',  a)   |,
abbrev('SPOCK',   a,2) |,
abbrev('SCISSORS',a,2)    then ok=1  /*ª*it's a valid choice for the human.   */
otherwise                  say err   'you entered a bad choice: '   u
end   /*ª*select*/

if \ok          then iterate                   /*ª*answer Â¬OK?  Then get another choice.*/
newV1.a1= newV1.a1 + 1                                 /*ª*keep a history of the CBLF's choices.*/
say newV3 'computer chose: '  c
if a1==c1  then say newV3  'draw.'                 /*ª*Oh rats!  The contest ended up a draw*/
else do who=1  for 2                /*ª*either the computer or the CBLF won. */
if who==2  then parse value  a1 c1   with   c1 a1
do j=1  for win                                  /*ª*see who won.  */
if newV2.a1 \== word(t.c1, j)  then iterate          /*ª*not this 'un. */
say whom.who  newV2.c1  word(b.c1, j)  newV2.a1          /*ª*notify winner.*/
leave                                            /*ª*leave  J loop.*/
end   /*ª*j*/
end        /*ª*who*/
end   /*ª*forever*/                              /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rock-paper-scissors\rock-paper-scissors-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
