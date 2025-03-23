/*�*REXX program generates all random starting positions for the Chess960 game. */
parse arg seed .                       /*�*allow for (RANDOM BIF) repeatability.*/
if seed\==''  then call random ,,seed  /*�*if SEED was specified,  use the seed.*/
x.=0;  newV2=0;  rg='random generations: ' /*�*initialize game placeholder; # games.*/
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
do t=1                                 /*�* [↓]  display every 1,000 generations*/   /*�*▒*/
if t//1000==0  then say  right(t,9)   rg     newV2     " unique starting positions."   /*�*▒*/
newV1.=.                                   /*�*define the first rank as being empty.*/   /*�*▒*/
r1=random(1,6)                         /*�*generate the first rook:  rank 1.    */   /*�*▒*/
newV1.r1='R'                               /*�*place the  first rook  on  rank1.    */   /*�*▒*/
do  until  r2\==r1  &  r2\==r1-1  &  r2\==r1+1                           /*�*▒*/
r2=random(1,8)               /*�*find placement for the 2nd rook.     */   /*�*▒*/
end   /*�*forever*/                                                        /*�*▒*/
newV1.r2='r'                               /*�*place the second rook  on  rank 1.   */   /*�*▒*/
k=random(min(r1, r2)+1, max(r1, r2)-1) /*�*find a random position for the king. */   /*�*▒*/
newV1.k='K'                                /*�*place king between the two rooks.    */   /*�*▒*/
do newV3=0      ; b1=random(1,8);  if newV1.b1\==.  then iterate;  c=b1//2       /*�*▒*/
do forever; b2=random(1,8)       /*�* c=color of bishop ►──┘        */   /*�*▒*/
if newV1.b2\==. | b2==b1 | b2//2==c  then iterate /*�*is a bad position?*/   /*�*▒*/
leave newV3                    /*�*found position for the 2 clergy*/         /*�*▒*/
end   /*�*forever*/          /*�* [↑]  find a place for the 1st bishop*/   /*�*▒*/
end     /*�* _ */              /*�* [↑]    "  "   "    "   "  2nd    "  */   /*�*▒*/
newV1.b1='B'                               /*�*place the  1st  bishop on  rank 1.   */   /*�*▒*/
newV1.b2='b'                               /*�*  "    "   2nd     "    "    "  "    */   /*�*▒*/
/*�*place the two knights on rank 1.     */   /*�*▒*/
do  until newV1.newV3='N';  newV3=random(1,8);   if newV1.newV3\==.  then iterate; newV1.newV3='N';   end   /*�*▒*/
do  until newV1.newV4='n';  newV4=random(1,8);   if newV1.newV4\==.  then iterate; newV1.newV4='n';   end   /*�*▒*/
newV3=                                     /*�*only the queen is left to be placed. */   /*�*▒*/
do i=1  for 8;  newV3=newV3 || newV1.i;   end   /*�*construct the output: first rank only*/   /*�*▒*/
upper newV3                                /*�*uppercase all the chess pieces.      */   /*�*▒*/
if x.newV3  then iterate                   /*�*This position found before?  Skip it.*/   /*�*▒*/
x.newV3=1                                  /*�*define this position as being found. */   /*�*▒*/
newV2=newV2+1                                  /*�*bump the # of unique positions found,*/   /*�*▒*/
if newV2==960  then leave                                                              /*�*▒*/
end   /*�*t ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/

say newV2 'unique starting positions found after '   t   "generations."
/*�*stick a fork in it,  we're all done. */         /*�**/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-Chess960-starting-position\generate-chess960-starting-position-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
