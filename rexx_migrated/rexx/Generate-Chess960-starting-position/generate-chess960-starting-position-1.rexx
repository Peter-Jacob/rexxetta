/*ª*REXX program generates a random starting position  for the  Chess960  game. */
parse arg seed .                       /*ª*allow for (RANDOM BIF) repeatability.*/
if seed\==''  then call random ,,seed  /*ª*if SEED was specified,  use the seed.*/
newV1.=.                                   /*ª*define the first rank as being empty.*/
r1=random(1,6)                         /*ª*generate the first rook:  rank 1.    */
newV1.r1='R'                               /*ª*place the  first rook  on  rank1.    */
do  until  r2\==r1  &  r2\==r1-1  &  r2\==r1+1
r2=random(1,8)               /*ª*find placement for the 2nd rook.     */
end   /*ª*forever*/
newV1.r2='r'                               /*ª*place the second rook  on  rank 1.   */
k=random(min(r1, r2)+1, max(r1, r2)-1) /*ª*find a random position for the king. */
newV1.k='K'                                /*ª*place king between the two rooks.    */
do newV2=0      ; b1=random(1,8);  if newV1.b1\==.  then iterate;  c=b1//2
do forever; b2=random(1,8)       /*ª* c=color of bishop â–ºâ”€â”€â”˜        */
if newV1.b2\==. | b2==b1 | b2//2==c  then iterate /*ª*is a bad position?*/
leave newV2                    /*ª*found position for the 2 clergy*/
end   /*ª*forever*/          /*ª* [â†‘]  find a place for the 1st bishop*/
end     /*ª* _ */              /*ª* [â†‘]    "  "   "    "   "  2nd    "  */
newV1.b1='B'                               /*ª*place the  1st  bishop on  rank 1.   */
newV1.b2='b'                               /*ª*  "    "   2nd     "    "    "  "    */
/*ª*place the two knights on rank 1.     */
do  until newV1.newV2='N';  newV2=random(1,8);   if newV1.newV2\==.  then iterate; newV1.newV2='N';   end
do  until newV1.newV3='n';  newV3=random(1,8);   if newV1.newV3\==.  then iterate; newV1.newV3='n';   end
newV2=                                     /*ª*only the queen is left to be placed. */
do i=1  for 8;  newV2=newV2 || newV1.i;   end   /*ª*construct the output: first rank only*/
say translate(translate(newV2, 'q', .))    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-Chess960-starting-position\generate-chess960-starting-position-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
