/*�*REXX program  finds and displays  "sets" (solutions)  for the   SET  puzzle   (game). */
parse arg game seed .                            /*�*get optional # cards to deal and seed*/
if game=='' | game==","  then game=  9           /*�*Not specified?  Then use the default.*/
if seed=='' | seed==","  then seed= 77           /*�* "      "         "   "   "      "   */
call aGame 0                                     /*�*with tell=0:    suppress the output. */
call aGame 1                                     /*�*with tell=1:    display   "     "    */
exit sets                                        /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
aGame: parse arg tell;         good= game % 2    /*�*enable/disable the showing of output.*/
/*�* [↑]  the GOOD var is the right #sets*/
do seed=seed  until good==sets  /*�*generate deals until good  # of sets.*/
call random ,,seed              /*�*repeatability for the RANDOM invokes.*/
call genFeatures                /*�*generate various card game features. */
call genDeck                    /*�*    "    a deck  (with  81  "cards").*/
call dealer   game              /*�*deal a number of cards for the game. */
call findSets game%2            /*�*find # of sets from the dealt cards. */
end   /*�*until*/                 /*�* [↓]   when leaving, SETS is right #.*/
return                                    /*�*return to invoker of this subroutine.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dealer: call sey  'dealing'  game  "cards:", , . /*�*shuffle and deal the cards.          */

do cards=1  until cards==game         /*�*keep dealing until finished.         */
newV6= random(1, words(newV2) )              /*�*pick   a card.                       */
newV2= delword(newV2, newV6, 1)                 /*�*delete "   "                         */
newV3.cards= deck.newV6                       /*�*add the card to the tableau.         */
call sey right('card' cards, 30) " " newV3.cards    /*�*display a card to terminal.*/

do j=1  for words(newV3.cards)        /*�* [↓]  define cells for cards.        */
newV3.cards.j= word(newV3.cards, j)       /*�*define  a  cell for  a card.         */
end   /*�*j*/
end       /*�*cards*/

return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
defFeatures: parse arg what,v;   newV6= words(v)     /*�*obtain what is to be defined.        */

if newV6\==values  then do;  call sey 'error,'  what  "features ¬=" values, ., .
exit -1
end             /*�* [↑]  check for typos and/or errors. */

do k=1  for words(values)         /*�*define all the possible values.      */
call value what'.'k,  word(values, k)         /*�*define  a  card feature. */
end   /*�*k*/

return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
findSets: parse arg n;   call genPoss            /*�*N:  the number of sets to be found.  */
call sey                               /*�*find any sets that were generated [↑]*/

do         j=1  for p              /*�*P:  is the number of possible sets.  */
do     f=1  for features
do g=1  for groups;     newV1.j.f.g= word(newV5.j.f, g)
end   /*�*g*/
end       /*�*f*/

ok= 1                              /*�*everything is peachy─kean (OK) so far*/

do g=1  for groups
newV6= newV1.j.1.g                    /*�*build strings to hold possibilities. */
equ= 1                         /*�* [↓]  handles all the equal features.*/

do f=2  to features  while equ;     equ= equ  &  newV6==newV1.j.f.g
end   /*�*f*/

dif= 1
newV4= newV1.j.1.g                   /*�* [↓]  handles all  unequal  features.*/
do f=2  to  features  while  \equ
dif= dif &  (wordpos(newV1.j.f.g, newV4)==0)
newV4= newV4  newV1.j.f.g  /*�*append to string for next test*/
end   /*�*f*/

ok=ok & (equ | dif)            /*�*now, see if all are equal or unequal.*/
end   /*�*g*/

if \ok  then iterate               /*�*Is this set OK?   Nope, then skip it.*/
sets= sets + 1                     /*�*bump the number of the sets found.   */
call sey  right('set'  sets":  ", 15)    newV5.j.1    sep   newV5.j.2    sep   newV5.j.3
end   /*�*j*/

call sey  sets   'sets found.', .
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genDeck: newV7= 0;   newV2=                             /*�*#:  cards in deck;  ##:  shuffle aid.*/

do         num=1  for values;         xnum = word(numbers,  num)
do      col=1  for values;         xcol = word(colors,   col)
do   sym=1  for values;         xsym = word(symbols,  sym)
do sha=1  for values;         xsha = word(shadings, sha)
newV7= newV7 + 1;  newV2= newV2 newV7;
deck.newV7= xnum  xcol  xsym  xsha          /*�*create a card. */
end   /*�*sha*/
end      /*�*num*/
end        /*�*sym*/
end           /*�*col*/

return                                  /*�*#:  the number of cards in the deck. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genFeatures: features= 3;  groups= 4;  values= 3 /*�*define # features, groups, values.   */
numbers = 'one two three'           ;    call defFeatures 'number',  numbers
colors  = 'red green purple'        ;    call defFeatures 'color',   colors
symbols = 'oval squiggle diamond'   ;    call defFeatures 'symbol',  symbols
shadings= 'solid open striped'      ;    call defFeatures 'shading', shadings
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genPoss: p= 0;   sets= 0;   sep=' ───── '        /*�*define some REXX variables.          */
newV5.=
do       i=1    for game     /*�* [↓]  the  IFs  eliminate duplicates.*/
do    j=i+1  to  game
do k=j+1  to  game
p= p + 1;          newV5.p.1= newV3.i;       newV5.p.2= newV3.j;      newV5.p.3= newV3.k
end   /*�*k*/
end      /*�*j*/
end         /*�*i*/            /*�* [↑]  generate the permutation list. */

return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sey:  if \tell  then  return                     /*�*¬ tell?    Then suppress the output. */
if arg(2)==.  then say;      say arg(1);      if arg(3)==.  then say;         return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Set-puzzle\set-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
