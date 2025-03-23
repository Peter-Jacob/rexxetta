/*�*REXX pgm mimics a boggling card trick; separates cards into 3 piles based on color ···*/
parse arg trials newV2 shuffs seed .                 /*�*obtain optional arguments from the CL*/
if trials=='' | trials==","  then trials= 1000   /*�*Not specified?  Then use the default.*/
if      newV2=='' |      newV2==","  then      newV2=   52   /*�* "      "         "   "   "     "    */
if shuffs=='' | shuffs==","  then shuffs=  newV2%4   /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')   then call random ,,seed /*�*if integer, use this as a RANDOM seed*/
ok=0                                             /*�*the number of "expected" good trials.*/
do trials               /*�*perform a number of trials to be safe*/
call create             /*�*odd numbers≡RED,  even numbers≡BLACK.*/
call shuffle            /*�*shuffle the deck a number of times.  */
call deal               /*�*put cards into three piles of cards. */
call swap               /*�*swap rand # of cards in  R & B  piles*/
call count              /*�*count #blacks in B, #reds in R  piles*/
end   /*�*trials*/        /*�*#: is the number of cards in the deck*/
pc= (100*ok/trials)'%'                           /*�*calculate the  %  asserted correctly.*/
say "Correctness of the mathematician's assertion:"    pc   '  (out of'    commas(trials),
"trial"s(trials)')  using a deck of '     commas(newV2)                                  ,
" card"s(newV2)',  and doing '                commas(shuffs)         ' shuffle's(shuffs).
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
?:       return random(1, word( arg(1) newV2, 1) )   /*�*gen a random number from  1 ──► arg. */
commas:  parse arg newV3;  do j=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, j); end;   return newV3
create:  newV1.=; k=0; do j=1  by 4  for newV2; k=k+1; newV1.k= j; if k//13==0 then j=j+1; end; return
isRed:   return    arg(1) // 2                   /*�*if  arg(1)  is odd,  the card is RED.*/
s:       if arg(1)==1  then return arg(3);  return word( arg(2) 's', 1)    /*�*pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
count:   Rn=0;  Bn=0;              do j=1  for words(R);  Rn=Rn+   isRed(word(R,j)) ;  end
do k=1  for words(B);  Bn=Bn+ (\isRed(word(B,k)));  end
if Rn==Bn  then ok= ok+1;        return /*�*Was it a good trial?  Bump OK counter*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
deal:    R=;  B=;  D=;             do j=1  for newV2%2  by 2        /*�*deal all the cards.   */
next= j+1;   card= newV1.next    /*�*obtain the next card. */
if isRed(newV1.j)  then R=R card /*�*add to the  RED  pile?*/
else B=B card /*�* "   "  "  BLACK   "  */
D= D newV1.j                     /*�* "   "  " discard  "  */
end   /*�*j*/
return                                                 /*�*discard pile not used.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
shuffle:   do j=1  for shuffs;  x=?();    do until y\==x | newV2==1;   y=?();   end  /*�*until*/
parse value   newV1.x  newV1.y     with     newV1.y  newV1.x;  end  /*�*j*/;                 return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
swap:    $= min( words(R), words(B) );          Rc=;   Bc= /*�*ensure we can swap $ cards.*/
if $==0  then return                              /*�*A pile has no cards? return*/
do ?($)                 /*�*$:  is the number of swaps.*/
R?= ?( words(R) )       /*�*a random card in  RED pile.*/
B?= ?( words(B) )       /*�*"    "     "   " BLACK  "  */
/*�* "reds"  to be swapped.*/    Rc= Rc word(R, R?);  R= delword(R, R?, 1)  /*�*del card*/
/*�*"blacks"  "  "    "    */    Bc= Bc word(B, B?);  B= delword(B, B?, 1)  /*�* "    " */
end   /*�*?($)*/
R=R Bc;  B=B Rc;   return                         /*�*add swapped cards to piles.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mind-boggling-card-trick\mind-boggling-card-trick.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
