/*�*REXX pgm computes and displays the probabilities of a two─player S─sided, N─dice game.*/
numeric digits 100                               /*�*increase/decrease to heart's desire. */
call game  9  4, 6  6   /*�*1st player:  9 dice,  4 sides;   2nd player:  6 dice,  6 sides*/
call game  5 10, 6  7   /*�* "     "     5   "   10   "       "     "     6   "    7   "  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
game: parse arg  w.1  s.1,   w.2  s.2            /*�*1st player(dice sides), 2nd player···*/
p.= 0
do   j=1  for 2;         newV1.j= prob(w.j, s.j)
do k=w.j  to w.j*s.j;  parse var  newV1.j   p.j.k  newV1.j;  end  /*�*k*/
end   /*�*j*/
low.= 0
do   j=w.1  to w.1*s.1
do k=0  for j;         low.j= low.j + p.2.k;           end  /*�*k*/
end   /*�*j*/
say '   Player  1  has '       w.1       " dice with "       s.1      ' sides each.'
say '   Player  2  has '       w.2       " dice with "       s.2      ' sides each.'
winP= 0
do   j=w.1  to w.1*s.1;  winP= winP   + p.1.j * low.j
end   /*�*j*/
say 'The probability for first player to win is '  format(winP*100,,digits()%2) "%."
say                                        /*�*                               ↑     */
return                                     /*�*show 1/2 of 100 dec. digits────┘     */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
prob: procedure; parse arg n,s,,newV3 newV4;     newV2.= 0;              pow= s**n
do j=1  for n;     newV3= newV3'DO _'j"=1 FOR" s';';   end  /*�*j*/
newV3= newV3'_=';                  do k=1  for n-1;   newV3= newV3"_"k'+'             ;   end  /*�*k*/
interpret  newV3'_'n";#."_'=#.'_"+1"copies(';END', k)
ns= n*s;                   do j=0  to ns;     p.j= newV2.j / pow;             end  /*�*j*/
do k=n  to ns;     newV4= newV4 p.k;                   end  /*�*k*/
return newV4   /*�* ◄──────────────── probability of 1st player to win, S─sided, N dice.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dice-game-probabilities\dice-game-probabilities-3.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
