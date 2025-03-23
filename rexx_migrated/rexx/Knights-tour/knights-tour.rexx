/*�*REXX program solves the  knight's tour  problem   for a  (general)   NxN   chessboard.*/
parse arg  N  sRank sFile .                      /*�*obtain optional arguments from the CL*/
if     N=='' |     N==","  then     N=8          /*�*No boardsize specified?  Use default.*/
if sRank=='' | sRank==","  then sRank=N          /*�*No starting rank given?   "      "   */
if sFile=='' | sFile==","  then sFile=1          /*�* "     "    file   "      "      "   */
NN=N**2;            NxN='a ' N"x"N ' chessboard' /*�*file [↓]           [↓]   r=rank      */
newV2.=;    do r=1  for N;  do f=1  for N;  newV2.r.f=.;  end  /*�*f*/;   end  /*�*r*/
beg= '-1-'                                       /*�*[↑]  create an empty  NxN chessboard.*/
Kr =  '2  1 -1 -2  -2 -1  1  2'   /*�*the legal "rank"  moves for a knight.*/
Kf =  '1  2  2  1  -1 -2 -2 -1'   /*�* "    "   "file"    "    "  "    "   */
kr.M=words(Kr)                                   /*�*number of possible moves for a Knight*/
parse var  Kr  Kr.1 Kr.2 Kr.3 Kr.4 Kr.5 Kr.6 Kr.7 Kr.8   /*�*parse the legal moves by hand*/
parse var  Kf  Kf.1 Kf.2 Kf.3 Kf.4 Kf.5 Kf.6 Kf.7 Kf.8   /*�*  "    "    "     "    "   " */
newV2.sRank.sFile= beg                               /*�*the knight's starting position.      */
newV1= "knight's tour"                             /*�*a handy-dandy literal for the  SAYs. */
if \move(2, sRank, sFile)  &  \(N==1)  then say 'No'   newV1   "solution for"         NxN'.'
else say 'A solution for the'   newV1   "on"   NxN':'
newV3=left('', 9 * (n<18) )                          /*�*used for indentation of chessboard.  */
newV4=substr(copies("┼───",N),2);   say;   say  newV3 translate('┌'newV4"┐", '┬', "┼")   /*�*a square.*/
/*�* [↓]  build a display for chessboard.*/
do   r=N  for N  by -1;    if r\==N  then say newV3 '├'newV4"┤";        L=newV2.
do f=1  for N; newV5=newV2.r.f;  if newV5==NN  then newV5='end';  L=L'│'center(newV5, 3)  /*�*is "end"?*/
end   /*�*f*/                               /*�*done with   rank   of the chessboard.*/
say newV3 translate(L'│', , .)                  /*�*display a     "     "  "       "     */
end     /*�*r*/                               /*�*19x19 chessboard can be shown 80 cols*/

say  newV3  translate('└'newV4"┘", '┴', "┼")             /*�*show the last rank of the chessboard.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
move: procedure expose newV2. Kr. Kf. NN;    parse arg newV6,rank,file  /*�*obtain move,rank,file.*/
do t=1  for Kr.M;   nr=rank+Kr.t;       nf=file+Kf.t   /*�*position of the knight*/
if newV2.nr.nf==.  then do;                 newV2.nr.nf=newV6      /*�*Empty? Knight can move*/
if newV6==NN            then return 1  /*�*is this the last move?*/
if move(newV6+1,nr,nf)  then return 1  /*�* "   "   "    "    "  */
newV2.nr.nf=.                          /*�*undo the above move.  */
end                                /*�*try different move.   */
end   /*�*t*/                                            /*�* [↑]  all moves tried.*/
return 0                                                  /*�*tour is not possible. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Knights-tour\knights-tour.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
