/*ช*REXX program shuffles a deck of playing cards (with jokers)  using the  Knuth shuffle.*/
rank= 'A 2 3 4 5 6 7 8 9 10 J Q K'               /*ช*pips  of the various playing cards.  */
suit= 'โฃโ โฆโฅ'                                     /*ช*suit   "  "     "       "      "     */
parse arg seed .                                 /*ช*obtain optional argument from the CL.*/
if datatype(seed,'W')  then call random ,,seed   /*ช*maybe use for  RANDOM  repeatability.*/
say 'โโโโโโโโโโโโโโโโโโ getting a new deck out of the box ยทยทยท'
newV1.1= 'highJoker'                                 /*ช*good decks have a color joker, and a */
newV1.2= 'lowJoker'                                  /*ช*            ยทยทยท black & white joker. */
cards=2                                          /*ช*now, there're 2 cards are in the deck*/
do j     =1  for length(suit)
do k=1  for  words(rank);      cards=cards + 1
newV1.cards=substr(suit, j, 1)word(rank, k)
end  /*ช*k*/
end       /*ช*j*/
call show
say;      say 'โโโโโโโโโโโโโโโโโโ shuffling' cards "cards ยทยทยท"
do s=cards  by -1  to 2;  newV2=random(1,s);  parse value  newV1.newV2  newV1.s   with   newV1.s  newV1.newV2
/*ช*  [โ]  swap two cards in the deck.   */
end   /*ช*s*/
call show
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
show: newV3=;      do m=1  for cards;   newV3=newV3 newV1.m;   end  /*ช*m*/;         say newV3;           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuth-shuffle\knuth-shuffle-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
