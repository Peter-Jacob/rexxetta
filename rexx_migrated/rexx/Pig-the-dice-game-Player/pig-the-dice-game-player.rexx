/*�*REXX program plays "pig the dice game"  (any number of CBLFs and/or silicons or HALs).*/
sw= linesize() - 1                               /*�*get the width of the terminal screen,*/
parse arg  hp  cp  win  die  newV9  .  '(' names ")" /*�*obtain optional arguments from the CL*/
/*�*names with blanks should use an  _   */
if newV9\==''  then  call  err  'too many arguments were specified: ' newV9
newV3  = 'number of human players'   ;         hp = scrutinize( hp, newV3 , 0,  0,   0)
newV4  = 'number of computer players';         cp = scrutinize( cp, newV4 , 0,  0,   2)
newV1 = 'score needed to win'       ;         win= scrutinize(win, newV1, 1, 1e6, 60)
newV2 = 'number of sides in die'    ;         die= scrutinize(die, newV2, 2, 999,  6)
if hp==0  &  cp==0   then cp= 2                  /*�*if both counts are zero, two HALs.   */
if hp==1  &  cp==0   then cp= 1                  /*�*if one human, then use   one HAL.    */
name.=                                           /*�*nullify all names  (to a blank).     */
L= 0                                             /*�*maximum length of a player name.     */
do i=1  for hp+cp                         /*�*get the player's names,  ...  maybe. */
if i>hp  then newV10= 'HAL_'i"_the_computer"   /*�*use this for default name.           */
else newV10= 'player_'i               /*�* "    "   "     "      "             */
name.i = translate( word( strip( word( names, i) ) newV10, 1), , '_')
L= max(L, length( name.i) )               /*�*use   L   for nice name formatting.  */
end   /*�*i*/                               /*�*underscores are changed ──► blanks.  */

hpn=hp;  if hpn==0   then hpn= 'no'              /*�*use normal English for the display.  */
cpn=cp;  if cpn==0   then cpn= 'no'              /*�* "     "      "     "   "     "      */

say 'Pig (the dice game) is being played with:'  /*�*the introduction to pig-the-dice-game*/

if cpn\==0  then  say  right(cpn, 9)     'computer player's(cp)
if hpn\==0  then  say  right(hpn, 9)     'human player's(hp)
newV7.=
say 'and the'         newV1         "is: "         win         '   (or greater).'
dieNames= 'ace deuce trey square nickle boxcar'  /*�*some slangy vernacular die─face names*/
newV8=0                                             /*�*note:  snake eyes is for two aces.   */
do i=1  for die                   /*�*assign the vernacular die─face names.*/
newV7.i= ' ['word(dieNames,i)"]"      /*�*pick a word from die─face name lists.*/
newV8= max(newV8, length(newV7.i) )         /*�*!w ──► maximum length die─face name. */
end   /*�*i*/
s.= 0                                            /*�*set all player's scores to zero.     */
newV8= newV8 + length(die) + 3                         /*�*pad the die number and die names.    */
newV10= copies('─', 9)                                /*�*eyecatcher (for the prompting text). */
newV5= 'just rolled a '                           /*�*a nice literal to have laying 'round.*/
newV6= 'and the inning'                           /*�*"   "     "     "   "     "      "   */
/*�*═══════════════════════════════════════════════════let's play some pig.*/
do game=1;     in.= 0;       call score       /*�*set each inning's score to 0; display*/

do j=1  for hp+cp;         say              /*�*let each player roll their dice.     */
say copies('─', sw)                         /*�*display a fence for da ole eyeballs. */
it= name.j
say it',  your total score (so far) in this pig game is: '        s.j"."

do  until  stopped                        /*�*keep prompting/rolling 'til stopped. */
r= random(1, die)                         /*�*get a random die face (number).      */
newV11= left(space(r newV7.r','),  newV8)             /*�*for color, use a die─face name.      */
in.j= in.j + r                            /*�*add die─face number to the inning.   */

if r==1  then  do;  say it newV5 newV11 || newV6 "is a bust.";  leave;   end
say it newV5 newV11 || newV6 "total is: "    in.j

stopped= what2do(j)                       /*�*determine or ask  to stop rolling.   */
if j>hp & stopped  then say ' and'      name.j      "elected to stop rolling."
end   /*�*until stopped*/

if r\==1     then s.j= s.j + in.j           /*�*if not a bust, then add to the inning*/
if s.j>=win  then leave game                /*�*we have a winner,  so the game ends. */
end     /*�*j*/                               /*�*that's the end of the players.       */
end       /*�*game*/

call score;    say;    say;    say;    say;          say center(''name.j "won! ", sw, '═')
say;    say;            exit      /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s: if arg(1)==1  then return arg(3);           return word(arg(2) 's',1)   /*�*pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
score:  say;           say copies('█', sw)       /*�*display a fence for da ole eyeballs. */
do k=1  for hp+cp                      /*�*display the scores  (as a recap).    */
say 'The score for '    left(name.k, L)     " is "     right(s.k, length(win) ).
end  /*�*k*/
say copies('█', sw);           return    /*�*display a fence for da ole eyeballs. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
scrutinize: parse arg newV12,what,min,max             /*�*?  is the number,  ... or maybe not. */
if newV12==''  |  newV12==','   then return arg(5)
if \datatype(newV12, 'N')  then call err what "isn't numeric: "    newV12;         newV12=newV12/1
if \datatype(newV12, 'W')  then call err what "isn't an integer: " newV12
if newV12==0  & min>0      then call err what "can't be zero."
if newV12<min              then call err what "can't be less than"     min': '  newV12
if newV12==0  & max>0      then call err what "can't be zero."
if newV12>max & max\==0    then call err what "can't be greater than"  max': '  newV12
return newV12
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
what2do: parse arg who                                 /*�*"who" is a human or a computer.*/
if j>hp & s.j+in.j>=win    then  return 1     /*�*an  easy  choice  for HAL.     */
if j>hp &     in.j>=win%4  then  return 1     /*�*a simple strategy for HAL.     */
if j>hp                    then  return 0     /*�*HAL says, keep truckin'!       */
say newV10 name.who', what do you want to do?        (a QUIT will stop the game),'
say newV10 'press  ENTER  to roll again,  or anything else to STOP rolling.'
pull action;      action=space(action)        /*�*remove any superfluous blanks. */
if \abbrev('QUIT', action, 1)  then return action\==''
say;    say;    say center(' quitting. ', sw, '─');    say;     say;      exit
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:     say;    say;    say center(' error! ', max(40, linesize() % 2), "*");     say
do j=1  for arg();    say arg(j);    say;    end;    say;    exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pig-the-dice-game-Player\pig-the-dice-game-player.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
