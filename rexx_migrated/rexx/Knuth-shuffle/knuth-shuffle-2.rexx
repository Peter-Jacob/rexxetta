/*ช*REXX program shuffles a deck of playing cards (with jokers)  using the  Knuth shuffle.*/
rank = 'ace deuce trey 4 5 6 7 8 9 10 jack queen king'         /*ช*use pip names for cards*/
suit = 'club spade diamond heart'                              /*ช* "  suit  "    "    "  */
say 'โโโโโโโโโโโโโโโโโโ getting a new deck out of the box ยทยทยท'
newV1.1= '  color joker'                             /*ช*good decks have a color joker, and a */
newV1.2= '    b&w joker'                             /*ช*            ยทยทยท black & white joker. */
cards=2                                          /*ช*now, there're 2 cards are in the deck*/
do j     =1  for words(suit)
do k=1  for words(rank);       cards=cards+1    /*ช*bump the card counter. */
newV1.cards=right(word(suit,j),7)  word(rank,k)     /*ช*assign a card name.    */
end  /*ช*k*/
end       /*ช*j*/

call show 'ace'                                  /*ช*inserts blank when an  ACE  is found.*/
say;  say 'โโโโโโโโโโโโโโโโโโ shuffling' cards "cards ยทยทยท"

do s=cards  by -1  to 2;   newV2=random(1,s);   newV3=newV1.newV2;   newV1.newV2=newV1.s;    newV1.s=newV3
end   /*ช*s*/                            /*ช* [โ]  swap two cards in the deck.    */
call show
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
show: parse arg break;    say                    /*ช*get separator card, show blank line. */
do m=1  for cards                        /*ช* [โ]  traipse through the card deck. */
if pos(break,newV1.m)\==0  then say          /*ช*show a blank to read cards easier.   */
say 'card'  right(m, 2)    'โโโโบ'   newV1.m  /*ช*display a particular card from deck. */
end   /*ช*m*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knuth-shuffle\knuth-shuffle-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
