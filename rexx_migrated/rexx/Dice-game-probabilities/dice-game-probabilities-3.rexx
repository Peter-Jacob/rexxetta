/*ͺ*REXX pgm computes and displays the probabilities of a twoβplayer Sβsided, Nβdice game.*/
numeric digits 100                               /*ͺ*increase/decrease to heart's desire. */
call game  9  4, 6  6   /*ͺ*1st player:  9 dice,  4 sides;   2nd player:  6 dice,  6 sides*/
call game  5 10, 6  7   /*ͺ* "     "     5   "   10   "       "     "     6   "    7   "  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
game: parse arg  w.1  s.1,   w.2  s.2            /*ͺ*1st player(dice sides), 2nd playerΒ·Β·Β·*/
p.= 0
do   j=1  for 2;         newV1.j= prob(w.j, s.j)
do k=w.j  to w.j*s.j;  parse var  newV1.j   p.j.k  newV1.j;  end  /*ͺ*k*/
end   /*ͺ*j*/
low.= 0
do   j=w.1  to w.1*s.1
do k=0  for j;         low.j= low.j + p.2.k;           end  /*ͺ*k*/
end   /*ͺ*j*/
say '   Player  1  has '       w.1       " dice with "       s.1      ' sides each.'
say '   Player  2  has '       w.2       " dice with "       s.2      ' sides each.'
winP= 0
do   j=w.1  to w.1*s.1;  winP= winP   + p.1.j * low.j
end   /*ͺ*j*/
say 'The probability for first player to win is '  format(winP*100,,digits()%2) "%."
say                                        /*ͺ*                               β     */
return                                     /*ͺ*show 1/2 of 100 dec. digitsβββββ     */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
prob: procedure; parse arg n,s,,newV3 newV4;     newV2.= 0;              pow= s**n
do j=1  for n;     newV3= newV3'DO _'j"=1 FOR" s';';   end  /*ͺ*j*/
newV3= newV3'_=';                  do k=1  for n-1;   newV3= newV3"_"k'+'             ;   end  /*ͺ*k*/
interpret  newV3'_'n";#."_'=#.'_"+1"copies(';END', k)
ns= n*s;                   do j=0  to ns;     p.j= newV2.j / pow;             end  /*ͺ*j*/
do k=n  to ns;     newV4= newV4 p.k;                   end  /*ͺ*k*/
return newV4   /*ͺ* βββββββββββββββββ probability of 1st player to win, Sβsided, N dice.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dice-game-probabilities\dice-game-probabilities-3.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
