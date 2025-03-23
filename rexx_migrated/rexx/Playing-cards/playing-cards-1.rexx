/*ª* REXX ***************************************************************
* 1) Build ordered Card deck
* 2) Create shuffled stack
* 3) Deal 5 cards to 4 players each
* 4) show what cards have been dealt and what's left on the stack
* 05.07.2012 Walter Pachl
**********************************************************************/
colors='S H C D'
ranks ='A 2 3 4 5 6 7 8 9 T J Q K'
i=0
cards=''
ss=''
Do c=1 To 4
Do r=1 To 13
i=i+1
card.i=word(colors,c)word(ranks,r)
cards=cards card.i
End
End
n=52                                   /*ª* number of cards on deck    */
Do si=1 To 51                          /*ª* pick 51 cards              */
x=random(0,n-1)+1                    /*ª* take card x (in 1...n)     */
s.si=card.x                          /*ª* card on shuffled stack     */
ss=ss s.si                           /*ª* string of shuffled stack   */
card.x=card.n                        /*ª* replace card taken         */
n=n-1                                /*ª* decrement nr of cards      */
End
s.52=card.1                            /*ª* pick the last card left    */
ss=ss s.52                             /*ª* add it to the string       */
Say 'Ordered deck:'
Say '  'subword(cards,1,26)
Say '  'subword(cards,27,52)
Say 'Shuffled stack:'
Say '  'subword(ss,1,26)
Say '  'subword(ss,27,52)
si=52
deck.=''
Do ci=1 To 5                           /*ª* 5 cards each               */
Do pli=1 To 4                        /*ª* 4 players                  */
deck.pli.ci=s.si                   /*ª* take top of shuffled deck  */
si=si-1                            /*ª* decrement number           */
deck.pli=deck.pli deck.pli.ci      /*ª* pli's cards as string      */
End
End
Do pli=1 To 4                          /*ª* show the 4 dealt ...       */
Say pli':' deck.pli
End
Say 'Left on shuffled stack:'
Say '  'subword(ss,1,26)               /*ª* and what's left on stack   */
Say '  'subword(ss,27,6)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Playing-cards\playing-cards-1.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
