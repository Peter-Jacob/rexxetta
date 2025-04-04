/*ͺ*REXX program generates a  chess position (random pieces & positions)  in a FEN format.*/
parse arg seed CBs .                             /*ͺ*obtain optional arguments from the CL*/
if datatype(seed,'W')  then call random ,,seed   /*ͺ*SEED given for RANDOM repeatability? */
if CBs=='' | CBs==","  then CBs=1                /*ͺ*CBs:  number of generated ChessBoards*/
/*ͺ* [β]  maybe display any # of boards. */
do boards=1  for abs(CBs)                  /*ͺ* [β]  maybe display separator & title*/
if sign(CBs)\==CBs  then do;   say;   say center(' board' boards" ", 79, 'β');   end
newV1.=.; newV2.=newV1.                                /*ͺ*initialize the chessboard to be empty*/
do p=1  for random(2, 32)      /*ͺ*generate a random number of chessmen.*/
if p<3  then call piece 'k'    /*ͺ*a   king   of each color.            */
else call piece substr('bnpqr', random(1, 5), 1)
end  /*ͺ*p*/                     /*ͺ* [β]  place a piece on the chessboard*/
call cb                                    /*ͺ*display the ChessBoard  and  its FEN.*/
end          /*ͺ*boards*/                    /*ͺ* [β]  CB β‘  β    β                   */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cb: fen=;  do   r=8  for 8  by -1;  newV3=                       /*ͺ*the board rank  (so far).*/
do f=8  for 8  by -1;  newV3= newV3  ||  newV1.r.f          /*ͺ*append the board file.   */
end   /*ͺ*f*/
say newV3                                             /*ͺ*display the board rank.  */
do e=8  for 8  by -1;  newV3= changestr( copies(., e),  newV3, e)    /*ͺ* . β‘ filler.*/
end   /*ͺ*e*/
fen= fen  ||  newV3  ||  left('/', r\==1)             /*ͺ*append / if not 1st rank.*/
end     /*ͺ*r*/                                     /*ͺ* [β]  append $ str to FEN*/
say                                                      /*ͺ*display a blank sep. line*/
say 'FEN='fen   "w - - 0 1"                              /*ͺ*ForsythβEdwards Notation.*/
return                                                   /*ͺ* [β]  display chessboard.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
piece: parse arg x;    if p//2  then upper x;   arg ux           /*ͺ*use white if  odd  P.*/
if CBs<0 & p>2  then if random(1)  then upper x           /*ͺ*CBs>0?  Use balanced.*/
/*ͺ*[β]  # isn't changed.*/
do newV4=0  by 0;  r= random(1, 8);   f= random(1, 8)       /*ͺ*random rank and file.*/
if newV1.r.f\==.   then iterate                             /*ͺ*is position occupied?*/
if (x=='p'  & r==1)  |  (x=="P"  & r==8)  then iterate  /*ͺ*any promoting pawn?  */
/*ͺ*[β]  skip these pawns*/
if ux=='K'  then do    rr=r-1 for 3                     /*ͺ*[β]  neighbor β‘ king?*/
do ff=f-1 for 3;  if newV2.rr.ff=='K'  then iterate newV4   /*ͺ*king?*/
end   /*ͺ*rr*/                        /*ͺ*[β]  neighbor β‘ king?*/
end      /*ͺ*ff*/                        /*ͺ*[β]  we're all done. */
newV1.r.f=  x                                               /*ͺ*put random piece.    */
newV2.r.f= ux;  return                                      /*ͺ* "     "     "  upper*/
end   /*ͺ*#*/                                             /*ͺ*#: isn't incremented.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-random-chess-position\generate-random-chess-position.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
