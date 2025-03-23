/*�*REXX program analyzes an  N-card  poker hand, and displays what the poker hand is,    */
/*�*──────────────────────────────────────────── poker hands may contain up to two jokers.*/
parse arg iFID .;       if iFID=='' | iFID==","  then iFID= 'POKERHAJ.DAT'
/*�* [↓] read  the poker hands dealt.    */
do  while lines(iFID)\==0;      ox= linein(iFID);         if ox=''  then iterate
say right(ox, max(30, length(ox) ) )       ' ◄─── '       analyze(ox)
end   /*�*while*/                            /*�* [↑]  analyze/validate the poker hand*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
analyze: procedure; arg x ';',mc;       hand=translate(x, '♥♦����ֳ♠1', "HDCSA,");    flush= 0
kinds= 0;    suit.= 0;    pairs= 0;     newV1.= 0;         run= copies(0 ,13);       pips= run
if mc==''  then mc= 5;    n= words(hand)         /*�*N   is the number of cards in hand.  */
if n\==mc  then return  'invalid number of cards, must be' mc
/*�* [↓]  the PIP can be  1 or 2  chars. */
do j=1  for n;     newV2= word(hand, j)           /*�*obtain a card from the dealt hand.   */
pip= left(newV2, length(newV2) - 1);  ws= right(newV2, 1) /*�*obtain card's pip; obtain card's suit*/
if pip==10   then pip= 'T'                    /*�*allow alternate form for a  TEN  pip.*/
if abbrev('JOKER', newV2, 1)  then newV2= "JK"        /*�*allow altername forms of JOKER names.*/
newV1.newV2= newV1.newV2 + 1                                  /*�*bump the card counter for this hand. */
newV3= pos(pip, 123456789TJQK)                    /*�*obtain the pip index for the card.   */
if newV2=='JK'  then do;  if newV1.j>2  then return 'invalid, too many jokers'
iterate
end
if pos(ws, "♥����ֳ♦♠")==0  then return 'invalid suit in card:'     newV2
if newV3==0                then return 'invalid pip in card:'      newV2
if newV1.newV2\==1             then return 'invalid, duplicate card:'  newV2
suit.ws= suit.ws + 1                          /*�*count the suits for a possible flush.*/
flush= max(flush, suit.ws)                  /*�*count number of cards in the suits.  */
run= overlay(., run, newV3)                   /*�*convert runs to a series of periods. */
newV2= substr(pips, newV3, 1) + 1               /*�*obtain the number of the pip in hand.*/
pips= overlay(newV2, pips, newV3)                  /*�*convert the pip to legitimate number.*/
kinds= max(kinds, newV2)                        /*�*convert certain pips to their number.*/
end   /*�*i*/                                   /*�* [↑]  keep track of  N─of─a─kind.    */

run= run || left(run, 1)                         /*�*An  ace  can be  high  ─or─  low.    */
jok= newV1.jk;   kinds= kinds+jok;  flush= flush+jok /*�*N─of─a─kind;  adjustments for jokers.*/
straight= pos(..... , run)\==0           |,      /*�*does the RUN contain a straight?     */
(pos(....  , run)\==0 & jok>=1) |,      /*�*  "   "   "     "    "     "         */
(pos(..0.. , run)\==0 & jok>=1) |,      /*�*  "   "   "     "    "     "         */
(pos(...0. , run)\==0 & jok>=1) |,      /*�*  "   "   "     "    "     "         */
(pos(.0... , run)\==0 & jok>=1) |,      /*�*  "   "   "     "    "     "         */
(pos(...   , run)\==0 & jok>=2) |,      /*�*  "   "   "     "    "     "         */
(pos(..0.  , run)\==0 & jok>=2) |,      /*�*  "   "   "     "    "     "         */
(pos(.0..  , run)\==0 & jok>=2) |,      /*�*  "   "   "     "    "     "         */
(pos(.00.. , run)\==0 & jok>=2) |,      /*�*  "   "   "     "    "     "         */
(pos(..00. , run)\==0 & jok>=2) |,      /*�*  "   "   "     "    "     "         */
(pos(.0.0. , run)\==0 & jok>=2)         /*�*  "   "   "     "    "     "         */
pairs= countstr(2, pips)                         /*�*count number of pairs  (2s in PIPS). */
if jok\==0  then pairs= pairs - 1                /*�*adjust number of pairs with jokers.  */
if kinds>=5             then return  'five-of-a-kind'
if flush>=5 & straight  then return  'straight-flush'
if kinds>=4             then return  'four-of-a-kind'
if kinds>=3 & pairs>=1  then return  'full-house'
if flush>=5             then return  'flush'
if            straight  then return  'straight'
if kinds>=3             then return  'three-of-a-kind'
if kinds==2 & pairs==2  then return  'two-pair'
if kinds==2             then return  'one-pair'
return  'high-card'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Poker-hand-analyser\poker-hand-analyser-4.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
