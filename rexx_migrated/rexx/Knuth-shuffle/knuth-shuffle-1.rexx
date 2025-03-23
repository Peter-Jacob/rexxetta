/*�*REXX program shuffles a deck of playing cards (with jokers)  using the  Knuth shuffle.*/
rank= 'A 2 3 4 5 6 7 8 9 10 J Q K'               /*�*pips  of the various playing cards.  */
suit= '♣♠♦♥'                                     /*�*suit   "  "     "       "      "     */
parse arg seed .                                 /*�*obtain optional argument from the CL.*/
if datatype(seed,'W')  then call random ,,seed   /*�*maybe use for  RANDOM  repeatability.*/
say '══════════════════ getting a new deck out of the box ···'
newV1.1= 'highJoker'                                 /*�*good decks have a color joker, and a */
newV1.2= 'lowJoker'                                  /*�*            ··· black & white joker. */
cards=2                                          /*�*now, there're 2 cards are in the deck*/
do j     =1  for length(suit)
do k=1  for  words(rank);      cards=cards + 1
newV1.cards=substr(suit, j, 1)word(rank, k)
end  /*�*k*/
end       /*�*j*/
call show
say;      say '══════════════════ shuffling' cards "cards ···"
do s=cards  by -1  to 2;  newV2=random(1,s);  parse value  newV1.newV2  newV1.s   with   newV1.s  newV1.newV2
/*�*  [↑]  swap two cards in the deck.   */
end   /*�*s*/
call show
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: newV3=;      do m=1  for cards;   newV3=newV3 newV1.m;   end  /*�*m*/;         say newV3;           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuth-shuffle\knuth-shuffle-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
