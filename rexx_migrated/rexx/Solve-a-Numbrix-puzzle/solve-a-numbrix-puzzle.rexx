/*ͺ*REXX program solves a  Numbrix (R) puzzle, it also displays the puzzle and solution.  */
maxR=   0;     maxC=   0;          maxX=   0;    /*ͺ*define  maxR,  maxC,  and  maxX.     */
minR= 9e9;     minC= 9e9;          minX= 9e9;    /*ͺ*   "    minR,  minC,   "   minX.     */
cells=  0                                        /*ͺ*the number of cells  (so far).       */
parse arg xxx                                    /*ͺ*get the cell definitions from the CL.*/
xxx=translate(xxx,  ',,,,,'  ,  "/\;:_")         /*ͺ*also allow other characters as comma.*/
newV1.=
do  while xxx\='';       parse var  xxx    r c   marks  ','  xxx
do  while marks\='';               newV5=newV1.r.c
parse var marks  x  marks
if datatype(x, 'N')  then x= abs(x) / 1                /*ͺ*normalize  βxβ  */
minR= min(minR, r);       minC= min(minC, c)           /*ͺ*find min R and C*/
maxR= max(maxR, r);       maxC= max(maxC, c)           /*ͺ*  "  max "  "  "*/
if x==1    then do;   newV2= r;   newV3= c                   /*ͺ*the START cell. */
end
if newV5\==''  then call err  "cell at"  r  c  'is already occupied with:'  newV5
newV1.r.c= x;       c=  c +1;           cells= cells + 1   /*ͺ*assign a mark.  */
if x==.              then iterate                      /*ͺ*is a hole?  Skip*/
if \datatype(x,'W')  then call err  'illegal marker specified:'    x
minX= min(minX, x);  maxX= max(maxX, x)                /*ͺ*min  &  max   X.*/
end   /*ͺ*while marks\='' */
end       /*ͺ*while xxx  \='' */
call show                                        /*ͺ* [β]  is used for making fast moves. */
Nr = '0  1   0  -1    -1   1   1  -1'            /*ͺ*possible  row     for the next move. */
Nc = '1  0  -1   0     1  -1   1  -1'            /*ͺ*   "      column   "   "    "    "   */
pMoves= words(Nr)   -   4                        /*ͺ*is this to be a Numbrix puzzle ?     */

do i=1  for pMoves;    Nr.i= word(Nr, i);    Nc.i= word(Nc, i)   /*ͺ*for fast moves. */
end   /*ͺ*i*/
say
if \next(2, newV2, newV3)  then call err   'No solution possible for this Numbrix puzzle.'
say 'A solution for the Numbrix puzzle exists.';          say;          call show
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:  say;   say '***error*** (from Numbrix puzzle): '    arg(1);       say;       exit 13
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
next: procedure expose newV1. Nr. Nc. cells pMoves;  parse arg newV6,r,c;       newV4= newV6 + 1
do t=1  for pMoves                                      /*ͺ* [β]  try some moves. */
parse value   r+Nr.t  c+Nc.t    with   nr  nc           /*ͺ*next move coΓΆrdinates.*/
if newV1.nr.nc==.  then do;                  newV1.nr.nc= newV6     /*ͺ*let's try this move.  */
if newV6==cells          then return 1  /*ͺ*is this the last move?*/
if next(newV4, nr, nc)  then return 1
newV1.nr.nc=.                           /*ͺ*undo the above move.  */
iterate                             /*ͺ*go & try another move.*/
end
if newV1.nr.nc==newV6  then do                                  /*ͺ*this a fillβin move ? */
if newV6==cells          then return 1  /*ͺ*this is the last move.*/
if next(newV4, nr, nc)  then return 1  /*ͺ*a fillβin move.       */
end
end   /*ͺ*t*/
return 0                                                  /*ͺ*this ain't working.   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: if maxR<1 | maxC<1  then call err  'no legal cell was specified.'
if minX<1           then call err  'no  1  was specified for the puzzle start'
w= max(2, length(cells) );      do   r=maxR  to minR  by -1;   newV5=
do c=minC  to maxC;          newV5= newV5  right(newV1.r.c, w)
end   /*ͺ*c*/
say newV5
end   /*ͺ*r*/
say;      return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Numbrix-puzzle\solve-a-numbrix-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
