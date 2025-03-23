/*�*REXX program solves the  holy knight's tour  problem for a (general)  NxN  chessboard.*/
blank=pos('//', space(arg(1), 0))\==0            /*�*see if the pennies are to be shown.  */
parse arg  ops   '/'   cent                      /*�*obtain the options and the pennies.  */
parse var  ops  N  sRank  sFile .                /*�*boardsize, starting position, pennys.*/
if     N=='' |     N==","  then     N=8          /*�*no boardsize specified?  Use default.*/
if sRank=='' | sRank==","  then sRank=N          /*�*starting rank given?      "      "   */
if sFile=='' | sFile==","  then sFile=1          /*�*    "    file   "         "      "   */
NN=N**2;  NxN='a ' N"x"N ' chessboard'           /*�*file  [↓]          [↓]   r=rank      */
newV2.=;              do r=1  for N;  do f=1  for N;   newV2.r.f=.;    end /*�*f*/;        end /*�*r*/
/*�*[↑]  create an empty  NxN chessboard.*/
cent=space( translate( cent, , ',') )            /*�*allow use of comma (,) for separater.*/
cents=0                                          /*�*number of pennies on the chessboard. */
do  while  cent\=''                       /*�* [↓]  possibly place the pennies.    */
parse var  cent   cr  cf  x  '/'  cent    /*�*extract where to place the pennies.  */
if x=''   then x=1                        /*�*if number not specified, use 1 penny.*/
if cr=''  then iterate                    /*�*support the  "blanking"  option.     */
do cf=cf  for x   /*�*now, place  X  pennies on chessboard.*/
newV2.cr.cf= '¢'      /*�*mark chessboard position with a penny*/
end   /*�*cf*/      /*�* [↑]  places X pennies on chessboard.*/
end   /*�*while*/                           /*�* [↑]  allows of the placing of  X  ¢s*/
/*�* [↓]  traipse through the chessboard.*/
do r=1  for N;  do f=1  for N;  cents=cents + (newV2.r.f=='¢');   end /*�*f*/;     end /*�*r*/
/*�* [↑]  count the number of pennies.   */
if cents\==0  then say cents   'pennies placed on chessboard.'
target=NN - cents                                /*�*use this as the number of moves left.*/
Kr = '2 1 -1 -2 -2 -1  1  2'  /*�*the legal "rank"  moves for a knight.*/
Kf = '1 2  2  1 -1 -2 -2 -1'  /*�* "    "   "file"    "    "  "    "   */
kr.M=words(Kr)                                   /*�*number of possible moves for a Knight*/
parse var Kr  Kr.1 Kr.2 Kr.3 Kr.4 Kr.5 Kr.6 Kr.7 Kr.8   /*�*parse the legal moves by hand.*/
parse var Kf  Kf.1 Kf.2 Kf.3 Kf.4 Kf.5 Kf.6 Kf.7 Kf.8   /*�*  "    "    "     "    "   "  */
beg= '-1-'                                       /*�* [↑]   create the  NxN  chessboard.  */
if newV2.sRank.sFile ==.    then newV2.sRank.sFile=beg   /*�*the knight's starting position.      */
if newV2.sRank.sFile\==beg  then do    sRank=1  for N   /*�*find starting rank for the knight.*/
do sFile=1  for N   /*�*  "     "     file  "   "     "   */
if newV2.sRank.sFile\==.  then iterate
newV2.sRank.sFile=beg   /*�*the knight's starting position.   */
leave sRank         /*�*we have a spot, so leave all this.*/
end   /*�*sFile*/
end      /*�*sRank*/
newV1= "holy knight's tour"                       /*�*a handy─dandy literal for the  SAYs. */
if \move(2,sRank,sFile)  &  \(N==1)  then say 'No'    newV1    "solution for"        NxN'.'
else say 'A solution for the'   newV1   "on"    NxN':'

/*�*show chessboard with moves and coins.*/
newV3=left('', 9 * (n<18) );           say           /*�*used for indentation of chessboard.  */
newV4=substr( copies("┼───", N), 2);   say  newV3 translate('┌'newV4"┐", '┬', "┼")
do   r=N  for N  by -1;       if r\==N      then say newV3 '├'newV4"┤";     L=newV2.
do f=1  for N; newV5=newV2.r.f;     if newV5==target  then newV5='end';           L=L'│'center(newV5,3)
end      /*�*f*/
if blank then L=translate(L,,'¢')           /*�*blank out the pennies on chessboard ?*/
say newV3  translate(L'│', , .)                 /*�*display  a  rank of the  chessboard. */
end        /*�*r*/                            /*�*19x19 chessboard can be shown 80 cols*/
say  newV3  translate('└'newV4"┘", '┴', "┼")             /*�*display the last rank of chessboard. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
move: procedure expose newV2. Kr. Kf. target; parse arg newV6,rank,file /*�*obtain move,rank,file.*/
do t=1  for Kr.M;   nr=rank+Kr.t;         nf=file+Kf.t  /*�*position of the knight*/
if newV2.nr.nf==.  then do;                   newV2.nr.nf=newV6     /*�*Empty? Knight can move*/
if newV6==target       then return 1 /*�*is this the last move?*/
if move(newV6+1,nr,nf) then return 1 /*�* "   "   "    "    "  */
newV2.nr.nf=.                        /*�*undo the above move.  */
end                                 /*�*try a different move. */
end   /*�*t*/                                             /*�* [↑]  all moves tried.*/
return 0                                                   /*�*tour isn't possible.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Holy-Knights-tour\solve-a-holy-knights-tour.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
