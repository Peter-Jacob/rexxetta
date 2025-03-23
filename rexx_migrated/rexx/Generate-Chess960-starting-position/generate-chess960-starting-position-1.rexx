/*�*REXX program generates a random starting position  for the  Chess960  game. */
parse arg seed .                       /*�*allow for (RANDOM BIF) repeatability.*/
if seed\==''  then call random ,,seed  /*�*if SEED was specified,  use the seed.*/
newV1.=.                                   /*�*define the first rank as being empty.*/
r1=random(1,6)                         /*�*generate the first rook:  rank 1.    */
newV1.r1='R'                               /*�*place the  first rook  on  rank1.    */
do  until  r2\==r1  &  r2\==r1-1  &  r2\==r1+1
r2=random(1,8)               /*�*find placement for the 2nd rook.     */
end   /*�*forever*/
newV1.r2='r'                               /*�*place the second rook  on  rank 1.   */
k=random(min(r1, r2)+1, max(r1, r2)-1) /*�*find a random position for the king. */
newV1.k='K'                                /*�*place king between the two rooks.    */
do newV2=0      ; b1=random(1,8);  if newV1.b1\==.  then iterate;  c=b1//2
do forever; b2=random(1,8)       /*�* c=color of bishop ►──┘        */
if newV1.b2\==. | b2==b1 | b2//2==c  then iterate /*�*is a bad position?*/
leave newV2                    /*�*found position for the 2 clergy*/
end   /*�*forever*/          /*�* [↑]  find a place for the 1st bishop*/
end     /*�* _ */              /*�* [↑]    "  "   "    "   "  2nd    "  */
newV1.b1='B'                               /*�*place the  1st  bishop on  rank 1.   */
newV1.b2='b'                               /*�*  "    "   2nd     "    "    "  "    */
/*�*place the two knights on rank 1.     */
do  until newV1.newV2='N';  newV2=random(1,8);   if newV1.newV2\==.  then iterate; newV1.newV2='N';   end
do  until newV1.newV3='n';  newV3=random(1,8);   if newV1.newV3\==.  then iterate; newV1.newV3='n';   end
newV2=                                     /*�*only the queen is left to be placed. */
do i=1  for 8;  newV2=newV2 || newV1.i;   end   /*�*construct the output: first rank only*/
say translate(translate(newV2, 'q', .))    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-Chess960-starting-position\generate-chess960-starting-position-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
