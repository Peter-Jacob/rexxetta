/*ͺ*REXX program does a  "perfect shuffle"  for a number of  even  numbered  decks.       */
parse arg X                                      /*ͺ*optional list of test cases from C.L.*/
if X=''  then X=8 24 52 100 1020 1024 10000      /*ͺ*Not specified?  Use default.*/
w=length(word(X, words(X)))                      /*ͺ*used for rightβaligning the numbers. */

do j=1  for words(X);  y=word(X,j)           /*ͺ*use numbers in the test suite (list).*/

do k=1  for y;       newV1.k=k;       end      /*ͺ*generate a deck to be shuffled (used)*/
do t=1  until eq();  call magic;  end      /*ͺ*shuffle until  before  equals  after.*/

say 'deck size:'    right(y,w)","       right(t,w)      'perfect shuffles.'
end     /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eq:           do ?=1  for y;    if newV1.?\==?  then return 0;    end;            return 1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
magic: z=1;                     h=y%2                        /*ͺ*H  is (halfβway) pointer.*/
do L=3  by 2  for h-1; z=z+1; newV2.L=newV1.z; end     /*ͺ*assign left half of deck.*/
do R=2  by 2  for h-1; h=h+1; newV2.R=newV1.h; end     /*ͺ*   "   right  "   "   "  */
do a=2        for y-2;        newV1.a=newV2.a; end     /*ͺ*reβassignβββΊoriginal deck*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-shuffle\perfect-shuffle-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
