/*�*REXX program does a  "perfect shuffle"  for a number of  even  numbered  decks.       */
parse arg X                                      /*�*optional list of test cases from C.L.*/
if X=''  then X=8 24 52 100 1020 1024 10000      /*�*Not specified?  Use default.*/
w=length(word(X, words(X)))                      /*�*used for right─aligning the numbers. */

do j=1  for words(X);  y=word(X,j)           /*�*use numbers in the test suite (list).*/

do k=1  for y;       newV1.k=k;       end      /*�*generate a deck to be shuffled (used)*/
do t=1  until eq();  call magic;  end      /*�*shuffle until  before  equals  after.*/

say 'deck size:'    right(y,w)","       right(t,w)      'perfect shuffles.'
end     /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eq:           do ?=1  for y;    if newV1.?\==?  then return 0;    end;            return 1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
magic: z=1;                     h=y%2                        /*�*H  is (half─way) pointer.*/
do L=3  by 2  for h-1; z=z+1; newV2.L=newV1.z; end     /*�*assign left half of deck.*/
do R=2  by 2  for h-1; h=h+1; newV2.R=newV1.h; end     /*�*   "   right  "   "   "  */
do a=2        for y-2;        newV1.a=newV2.a; end     /*�*re─assign──►original deck*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-shuffle\perfect-shuffle-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
