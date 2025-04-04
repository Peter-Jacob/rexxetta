/*ͺ*REXX program solves a  Numbrix (R) puzzle, it also displays the puzzle and solution.  */
maxR=0;    maxC=0;    maxX=0;     minR=9e9;      minC=9e9;    minX=9e9;    cells=0;    newV1.=
parse arg xxx;        PZ='Hidato puzzle'         /*ͺ*get the cell definitions from the CL.*/
xxx=translate(xxx, , "/\;:_", ',')               /*ͺ*also allow other characters as comma.*/

do  while xxx\='';  parse var  xxx    r c   marks  ','  xxx
do  while marks\='';          newV5=newV1.r.c
parse var marks  x  marks
if datatype(x,'N')  then do;  x=x/1                     /*ͺ*normalize X*/
if x<0  then PZ= 'Numbrix puzzle'
x=abs(x)                  /*ͺ*use  βxβ   */
end
minR=min(minR,r);  maxR=max(maxR,r); minC=min(minC,c); maxC=max(maxC,c)
if x==1   then do;  newV2=r;  newV3=c;  end              /*ͺ*the START cell. */
if newV5\=='' then call err "cell at" r c 'is already occupied with:'  newV5
newV1.r.c=x;   c=c+1;    cells=cells+1                 /*ͺ*assign a mark.  */
if x==.              then iterate                  /*ͺ*is a hole?  Skip*/
if \datatype(x,'W')  then call err 'illegal marker specified:' x
minX=min(minX,x);    maxX=max(maxX,x)              /*ͺ*min and max  X. */
end   /*ͺ*while marksΒ¬='' */
end       /*ͺ*while xxx  Β¬='' */
call show                                        /*ͺ* [β]  is used for making fast moves. */
Nr = '0  1   0  -1    -1   1   1  -1'            /*ͺ*possible  row     for the next move. */
Nc = '1  0  -1   0     1  -1   1  -1'            /*ͺ*   "      column   "   "    "    "   */
pMoves=words(Nr) -4*(left(PZ,1)=='N')            /*ͺ*is this to be a Numbrix puzzle ?     */
do i=1  for pMoves;   Nr.i=word(Nr,i);   Nc.i=word(Nc,i);   end     /*ͺ*for fast moves. */
if \next(2,newV2,newV3)  then call err  'No solution possible for this'   PZ    "puzzle."
say 'A solution for the'   PZ    "exists.";      say;                     call show
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:  say;    say '***error*** (from' PZ"): "    arg(1);        say;          exit 13
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
next: procedure expose newV1. Nr. Nc. cells pMoves;  parse arg newV6,r,c;   newV4=newV6+1
do t=1  for pMoves                                   /*ͺ* [β]  try some moves. */
parse value  r+Nr.t c+Nc.t  with nr nc               /*ͺ*next move coΓΆrdinates.*/
if newV1.nr.nc==.  then do;                newV1.nr.nc=newV6     /*ͺ*let's try this move.  */
if newV6==cells        then leave    /*ͺ*is this the last move?*/
if next(newV4,nr,nc)  then return 1
newV1.nr.nc=.                        /*ͺ*undo the above move.  */
iterate                          /*ͺ*go & try another move.*/
end
if newV1.nr.nc==newV6  then do                               /*ͺ*this a fill-in move ? */
if newV6==cells        then return 1 /*ͺ*this is the last move.*/
if next(newV4,nr,nc)  then return 1 /*ͺ*a fill-in move.       */
end
end   /*ͺ*t*/
return 0                                                  /*ͺ*this ain't working.   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: if maxR<1 | maxC<1  then call err  'no legal cell was specified.'
if minX<1           then call err  'no  1  was specified for the puzzle start'
w=max(2,length(cells));  do    r=maxR  to minR  by -1; newV5=
do c=minC  to maxC;        newV5=newV5 right(newV1.r.c,w); end /*ͺ*c*/
say newV5
end   /*ͺ*r*/
say;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Hidato-puzzle\solve-a-hidato-puzzle.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
