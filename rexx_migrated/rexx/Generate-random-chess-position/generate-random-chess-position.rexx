/*�*REXX program generates a  chess position (random pieces & positions)  in a FEN format.*/
parse arg seed CBs .                             /*�*obtain optional arguments from the CL*/
if datatype(seed,'W')  then call random ,,seed   /*�*SEED given for RANDOM repeatability? */
if CBs=='' | CBs==","  then CBs=1                /*�*CBs:  number of generated ChessBoards*/
/*�* [↓]  maybe display any # of boards. */
do boards=1  for abs(CBs)                  /*�* [↓]  maybe display separator & title*/
if sign(CBs)\==CBs  then do;   say;   say center(' board' boards" ", 79, '▒');   end
newV1.=.; newV2.=newV1.                                /*�*initialize the chessboard to be empty*/
do p=1  for random(2, 32)      /*�*generate a random number of chessmen.*/
if p<3  then call piece 'k'    /*�*a   king   of each color.            */
else call piece substr('bnpqr', random(1, 5), 1)
end  /*�*p*/                     /*�* [↑]  place a piece on the chessboard*/
call cb                                    /*�*display the ChessBoard  and  its FEN.*/
end          /*�*boards*/                    /*�* [↑]  CB ≡  ─    ─                   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cb: fen=;  do   r=8  for 8  by -1;  newV3=                       /*�*the board rank  (so far).*/
do f=8  for 8  by -1;  newV3= newV3  ||  newV1.r.f          /*�*append the board file.   */
end   /*�*f*/
say newV3                                             /*�*display the board rank.  */
do e=8  for 8  by -1;  newV3= changestr( copies(., e),  newV3, e)    /*�* . ≡ filler.*/
end   /*�*e*/
fen= fen  ||  newV3  ||  left('/', r\==1)             /*�*append / if not 1st rank.*/
end     /*�*r*/                                     /*�* [↑]  append $ str to FEN*/
say                                                      /*�*display a blank sep. line*/
say 'FEN='fen   "w - - 0 1"                              /*�*Forsyth─Edwards Notation.*/
return                                                   /*�* [↑]  display chessboard.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
piece: parse arg x;    if p//2  then upper x;   arg ux           /*�*use white if  odd  P.*/
if CBs<0 & p>2  then if random(1)  then upper x           /*�*CBs>0?  Use balanced.*/
/*�*[↓]  # isn't changed.*/
do newV4=0  by 0;  r= random(1, 8);   f= random(1, 8)       /*�*random rank and file.*/
if newV1.r.f\==.   then iterate                             /*�*is position occupied?*/
if (x=='p'  & r==1)  |  (x=="P"  & r==8)  then iterate  /*�*any promoting pawn?  */
/*�*[↑]  skip these pawns*/
if ux=='K'  then do    rr=r-1 for 3                     /*�*[↓]  neighbor ≡ king?*/
do ff=f-1 for 3;  if newV2.rr.ff=='K'  then iterate newV4   /*�*king?*/
end   /*�*rr*/                        /*�*[↑]  neighbor ≡ king?*/
end      /*�*ff*/                        /*�*[↑]  we're all done. */
newV1.r.f=  x                                               /*�*put random piece.    */
newV2.r.f= ux;  return                                      /*�* "     "     "  upper*/
end   /*�*#*/                                             /*�*#: isn't incremented.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Generate-random-chess-position\generate-random-chess-position.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
