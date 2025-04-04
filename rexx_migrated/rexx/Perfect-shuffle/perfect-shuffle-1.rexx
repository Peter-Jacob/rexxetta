/*ͺ*REXX program performs a  "perfect shuffle"  for a number of  even numbered  decks.    */
parse arg X                                      /*ͺ*optional list of test cases from C.L.*/
if X=''  then X=8 24 52 100 1020 1024 10000      /*ͺ*Not specified?  Then use the default.*/
w=length(word(X, words(X)))                      /*ͺ*used for rightβaligning the numbers. */

do j=1  for words(X);  y=word(X,j)           /*ͺ*use numbers in the test suite (list).*/

do k=1  for y;       newV1.k=k;      end /*ͺ*k*/ /*ͺ*generate a deck to be used (shuffled)*/
do t=1  until eq();  call magic; end /*ͺ*t*/ /*ͺ*shuffle until  before  equals  after.*/

say 'deck size:'    right(y,w)","       right(t,w)      'perfect shuffles.'
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eq:    do ?=1  for y;   if newV1.?\==?  then return 0;   end;           return 1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
magic: z=0                                       /*ͺ*set the  Z  pointer  (used as index).*/
h=y%2                                     /*ͺ*get the halfβway (midpoint) pointer. */
do s=1  for h;  z=z+1;  h=h+1    /*ͺ*traipse through the card deck pips.  */
newV2.z=newV1.s;        z=z+1            /*ͺ*assign left half; then bump pointer. */
newV2.z=newV1.h                          /*ͺ*   "   right  "                      */
end   /*ͺ*s*/                      /*ͺ*perform a perfect shuffle of the deck*/

do r=1  for y;  newV1.r=newV2.r;  end    /*ͺ*reβassign to the original card deck. */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-shuffle\perfect-shuffle-1.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
