/*ͺ*REXX program  finds and displays  "sets" (solutions)  for the   SET  puzzle   (game). */
parse arg game seed .                            /*ͺ*get optional # cards to deal and seed*/
if game=='' | game==","  then game=  9           /*ͺ*Not specified?  Then use the default.*/
if seed=='' | seed==","  then seed= 77           /*ͺ* "      "         "   "   "      "   */
call aGame 0                                     /*ͺ*with tell=0:    suppress the output. */
call aGame 1                                     /*ͺ*with tell=1:    display   "     "    */
exit sets                                        /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
aGame: parse arg tell;         good= game % 2    /*ͺ*enable/disable the showing of output.*/
/*ͺ* [β]  the GOOD var is the right #sets*/
do seed=seed  until good==sets  /*ͺ*generate deals until good  # of sets.*/
call random ,,seed              /*ͺ*repeatability for the RANDOM invokes.*/
call genFeatures                /*ͺ*generate various card game features. */
call genDeck                    /*ͺ*    "    a deck  (with  81  "cards").*/
call dealer   game              /*ͺ*deal a number of cards for the game. */
call findSets game%2            /*ͺ*find # of sets from the dealt cards. */
end   /*ͺ*until*/                 /*ͺ* [β]   when leaving, SETS is right #.*/
return                                    /*ͺ*return to invoker of this subroutine.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
dealer: call sey  'dealing'  game  "cards:", , . /*ͺ*shuffle and deal the cards.          */

do cards=1  until cards==game         /*ͺ*keep dealing until finished.         */
newV6= random(1, words(newV2) )              /*ͺ*pick   a card.                       */
newV2= delword(newV2, newV6, 1)                 /*ͺ*delete "   "                         */
newV3.cards= deck.newV6                       /*ͺ*add the card to the tableau.         */
call sey right('card' cards, 30) " " newV3.cards    /*ͺ*display a card to terminal.*/

do j=1  for words(newV3.cards)        /*ͺ* [β]  define cells for cards.        */
newV3.cards.j= word(newV3.cards, j)       /*ͺ*define  a  cell for  a card.         */
end   /*ͺ*j*/
end       /*ͺ*cards*/

return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
defFeatures: parse arg what,v;   newV6= words(v)     /*ͺ*obtain what is to be defined.        */

if newV6\==values  then do;  call sey 'error,'  what  "features Β¬=" values, ., .
exit -1
end             /*ͺ* [β]  check for typos and/or errors. */

do k=1  for words(values)         /*ͺ*define all the possible values.      */
call value what'.'k,  word(values, k)         /*ͺ*define  a  card feature. */
end   /*ͺ*k*/

return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
findSets: parse arg n;   call genPoss            /*ͺ*N:  the number of sets to be found.  */
call sey                               /*ͺ*find any sets that were generated [β]*/

do         j=1  for p              /*ͺ*P:  is the number of possible sets.  */
do     f=1  for features
do g=1  for groups;     newV1.j.f.g= word(newV5.j.f, g)
end   /*ͺ*g*/
end       /*ͺ*f*/

ok= 1                              /*ͺ*everything is peachyβkean (OK) so far*/

do g=1  for groups
newV6= newV1.j.1.g                    /*ͺ*build strings to hold possibilities. */
equ= 1                         /*ͺ* [β]  handles all the equal features.*/

do f=2  to features  while equ;     equ= equ  &  newV6==newV1.j.f.g
end   /*ͺ*f*/

dif= 1
newV4= newV1.j.1.g                   /*ͺ* [β]  handles all  unequal  features.*/
do f=2  to  features  while  \equ
dif= dif &  (wordpos(newV1.j.f.g, newV4)==0)
newV4= newV4  newV1.j.f.g  /*ͺ*append to string for next test*/
end   /*ͺ*f*/

ok=ok & (equ | dif)            /*ͺ*now, see if all are equal or unequal.*/
end   /*ͺ*g*/

if \ok  then iterate               /*ͺ*Is this set OK?   Nope, then skip it.*/
sets= sets + 1                     /*ͺ*bump the number of the sets found.   */
call sey  right('set'  sets":  ", 15)    newV5.j.1    sep   newV5.j.2    sep   newV5.j.3
end   /*ͺ*j*/

call sey  sets   'sets found.', .
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genDeck: newV7= 0;   newV2=                             /*ͺ*#:  cards in deck;  ##:  shuffle aid.*/

do         num=1  for values;         xnum = word(numbers,  num)
do      col=1  for values;         xcol = word(colors,   col)
do   sym=1  for values;         xsym = word(symbols,  sym)
do sha=1  for values;         xsha = word(shadings, sha)
newV7= newV7 + 1;  newV2= newV2 newV7;
deck.newV7= xnum  xcol  xsym  xsha          /*ͺ*create a card. */
end   /*ͺ*sha*/
end      /*ͺ*num*/
end        /*ͺ*sym*/
end           /*ͺ*col*/

return                                  /*ͺ*#:  the number of cards in the deck. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genFeatures: features= 3;  groups= 4;  values= 3 /*ͺ*define # features, groups, values.   */
numbers = 'one two three'           ;    call defFeatures 'number',  numbers
colors  = 'red green purple'        ;    call defFeatures 'color',   colors
symbols = 'oval squiggle diamond'   ;    call defFeatures 'symbol',  symbols
shadings= 'solid open striped'      ;    call defFeatures 'shading', shadings
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genPoss: p= 0;   sets= 0;   sep=' βββββ '        /*ͺ*define some REXX variables.          */
newV5.=
do       i=1    for game     /*ͺ* [β]  the  IFs  eliminate duplicates.*/
do    j=i+1  to  game
do k=j+1  to  game
p= p + 1;          newV5.p.1= newV3.i;       newV5.p.2= newV3.j;      newV5.p.3= newV3.k
end   /*ͺ*k*/
end      /*ͺ*j*/
end         /*ͺ*i*/            /*ͺ* [β]  generate the permutation list. */

return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sey:  if \tell  then  return                     /*ͺ*Β¬ tell?    Then suppress the output. */
if arg(2)==.  then say;      say arg(1);      if arg(3)==.  then say;         return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Set-puzzle\set-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
