/*�*REXX pgm shows a method to build/shuffle/deal 5 cards (using a 52─card deck)──►4 hands*/
box = build();   say ' box of cards:'   box      /*�*a brand new standard box of 52 cards.*/
deck= mix();     say 'shuffled deck:'   deck     /*�*obtain a randomly shuffled deck.     */
call deal  5, 4                                  /*�* ◄───────────────── 5 cards, 4 hands.*/
say;    say;     say right('[north]'   hand.1, 60)
say;     say '      [west]'    hand.4             right('[east]'   hand.2, 60)
say;     say right('[south]'   hand.3, 60)
say;    say;     say;    say 'remainder of deck: '        deck
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
build: newV3=;    ranks= "A 2 3 4 5 6 7 8 9 10 J Q K"                             /*�*ranks.  */
if 5=='f5'x  then suits= "h d c s"                                     /*�*EBCDIC? */
else suits= "♥ ♦ ♣ ♠"                                     /*�*ASCII.  */
do    s=1  for words(suits);    newV2=   word(suits, s)
do r=1  for words(ranks);    newV3= newV3 word(ranks, r)newV2   /*�*append a suit to rank*/
end   /*�*r*/
end      /*�*s*/;                 return newV3               /*�*jokers are not used. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
deal: parse arg newV1, hands;            hand.=      /*�*initially,  nullify all hands.  */
do   newV1                                 /*�*deal a hand to all the players. */
do player=1  for hands                   /*�*deal some cards to the players. */
hand.player= hand.player  word(deck, 1)  /*�*deal the top card to a player.  */
deck= subword(deck, 2)                   /*�*diminish deck, elide one card.  */
end   /*�*player*/
end      /*�*#cards*/;            return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mix: newV5=;      newV3=box;      newV1= words(newV3)            /*�*define three REXX variables.    */
do mixer=1  for newV1                      /*�*shuffle all the cards in deck.  */
newV4= random(1, newV1 + 1 - mixer)            /*�*each shuffle, random# decreases.*/
newV5= newV5  word(newV3, newV4)                            /*�*shuffled deck, 1 card at a time.*/
newV3= delword(newV3, newV4, 1)                         /*�*elide just─chosen card from deck*/
end   /*�*mixer*/;                return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Playing-cards\playing-cards-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
