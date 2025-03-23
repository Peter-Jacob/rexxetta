/*�*REXX program solves a  Numbrix (R) puzzle, it also displays the puzzle and solution.  */
maxR=   0;     maxC=   0;          maxX=   0;    /*�*define  maxR,  maxC,  and  maxX.     */
minR= 9e9;     minC= 9e9;          minX= 9e9;    /*�*   "    minR,  minC,   "   minX.     */
cells=  0                                        /*�*the number of cells  (so far).       */
parse arg xxx                                    /*�*get the cell definitions from the CL.*/
xxx=translate(xxx,  ',,,,,'  ,  "/\;:_")         /*�*also allow other characters as comma.*/
newV1.=
do  while xxx\='';       parse var  xxx    r c   marks  ','  xxx
do  while marks\='';               newV5=newV1.r.c
parse var marks  x  marks
if datatype(x, 'N')  then x= abs(x) / 1                /*�*normalize  │x│  */
minR= min(minR, r);       minC= min(minC, c)           /*�*find min R and C*/
maxR= max(maxR, r);       maxC= max(maxC, c)           /*�*  "  max "  "  "*/
if x==1    then do;   newV2= r;   newV3= c                   /*�*the START cell. */
end
if newV5\==''  then call err  "cell at"  r  c  'is already occupied with:'  newV5
newV1.r.c= x;       c=  c +1;           cells= cells + 1   /*�*assign a mark.  */
if x==.              then iterate                      /*�*is a hole?  Skip*/
if \datatype(x,'W')  then call err  'illegal marker specified:'    x
minX= min(minX, x);  maxX= max(maxX, x)                /*�*min  &  max   X.*/
end   /*�*while marks\='' */
end       /*�*while xxx  \='' */
call show                                        /*�* [↓]  is used for making fast moves. */
Nr = '0  1   0  -1    -1   1   1  -1'            /*�*possible  row     for the next move. */
Nc = '1  0  -1   0     1  -1   1  -1'            /*�*   "      column   "   "    "    "   */
pMoves= words(Nr)   -   4                        /*�*is this to be a Numbrix puzzle ?     */

do i=1  for pMoves;    Nr.i= word(Nr, i);    Nc.i= word(Nc, i)   /*�*for fast moves. */
end   /*�*i*/
say
if \next(2, newV2, newV3)  then call err   'No solution possible for this Numbrix puzzle.'
say 'A solution for the Numbrix puzzle exists.';          say;          call show
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
err:  say;   say '***error*** (from Numbrix puzzle): '    arg(1);       say;       exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
next: procedure expose newV1. Nr. Nc. cells pMoves;  parse arg newV6,r,c;       newV4= newV6 + 1
do t=1  for pMoves                                      /*�* [↓]  try some moves. */
parse value   r+Nr.t  c+Nc.t    with   nr  nc           /*�*next move coördinates.*/
if newV1.nr.nc==.  then do;                  newV1.nr.nc= newV6     /*�*let's try this move.  */
if newV6==cells          then return 1  /*�*is this the last move?*/
if next(newV4, nr, nc)  then return 1
newV1.nr.nc=.                           /*�*undo the above move.  */
iterate                             /*�*go & try another move.*/
end
if newV1.nr.nc==newV6  then do                                  /*�*this a fill─in move ? */
if newV6==cells          then return 1  /*�*this is the last move.*/
if next(newV4, nr, nc)  then return 1  /*�*a fill─in move.       */
end
end   /*�*t*/
return 0                                                  /*�*this ain't working.   */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: if maxR<1 | maxC<1  then call err  'no legal cell was specified.'
if minX<1           then call err  'no  1  was specified for the puzzle start'
w= max(2, length(cells) );      do   r=maxR  to minR  by -1;   newV5=
do c=minC  to maxC;          newV5= newV5  right(newV1.r.c, w)
end   /*�*c*/
say newV5
end   /*�*r*/
say;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Numbrix-puzzle\solve-a-numbrix-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
