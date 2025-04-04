/*ͺ*REXX program deals cards for a specific  FreeCell solitaire  card game  (0 βββΊ 32767).*/
numeric digits 15                                /*ͺ*ensure enough digits for the random #*/
parse arg game cols .                            /*ͺ*obtain optional arguments from the CL*/
if game=='' | game==","  then game=1             /*ͺ*No game specified?  Then use default.*/
if cols=='' | cols==","  then cols=8             /*ͺ* " cols     "         "   "     "    */
state=game                                       /*ͺ*seed random # generator with game num*/
if 8=='f8'x  then suit= "cdhs"                   /*ͺ*EBCDIC?   Then use letters for suits.*/
else suit= "βξεχΦ²β¦β₯β "                   /*ͺ* ASCII?     "   "  symbols  "    "   */
rank= 'A23456789tJQK'                            /*ͺ*t  in the rank represents a ten (10).*/
pad=left('', 13)                                 /*ͺ*used for indentation for the tableau.*/
say center('tableau for FreeCell game' game, 50, "β")   /*ͺ*show title for FreeCell game #*/
say                                              /*ͺ* [β]  @  is an array of all 52 cards.*/
newV2=-1;  do   r=1  for length(rank)                /*ͺ*build the deck  first   by the rank. */
do s=1  for length(suit);       newV2=newV2+1   /*ͺ*  "    "    "  secondly  "  "  suit. */
newV1.newV2=substr(rank, r,1)substr(suit, s,1)  /*ͺ*build the $ array one card at at time*/
end   /*ͺ*s*/                             /*ͺ* [β]  first card is number  0 (zero).*/
end     /*ͺ*r*/                             /*ͺ* [β]  build deck per FreeCell rules. */
newV3=pad                                            /*ͺ*@: cards to be dealt, eight at a time*/
do cards=51  by -1  for 52                /*ͺ* [β]  deal the cards for the tableau.*/
newV4=rand() // (cards+1)                     /*ͺ*get next rand#;  card # is remainder.*/
newV3=newV3 newV1.newV4;                 newV1.newV4=newV1.cards      /*ͺ*swap two cards:  use random and last.*/
if words(newV3)==cols  then do;  say newV3; newV3=pad /*ͺ*deal FreeCell cards for the tableau. */
end
end   /*ͺ*cards*/                           /*ͺ*normally, 8 cards are dealt to a row.*/
/*ͺ* [β]  residual cards may exist.      */
if newV3\=''  then say newV3                             /*ͺ*Any residual cards in the tableau ?  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
rand:  state=(214013*state + 2531011) // 2**31;  return state % 2**16   /*ͺ*FreeCell rand#*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Deal-cards-for-FreeCell\deal-cards-for-freecell.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
