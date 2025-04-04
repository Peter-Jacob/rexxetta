/*ͺ*REXX program solves the  holy knight's tour  problem for a (general)  NxN  chessboard.*/
blank=pos('//', space(arg(1), 0))\==0            /*ͺ*see if the pennies are to be shown.  */
parse arg  ops   '/'   cent                      /*ͺ*obtain the options and the pennies.  */
parse var  ops  N  sRank  sFile .                /*ͺ*boardsize, starting position, pennys.*/
if     N=='' |     N==","  then     N=8          /*ͺ*no boardsize specified?  Use default.*/
if sRank=='' | sRank==","  then sRank=N          /*ͺ*starting rank given?      "      "   */
if sFile=='' | sFile==","  then sFile=1          /*ͺ*    "    file   "         "      "   */
NN=N**2;  NxN='a ' N"x"N ' chessboard'           /*ͺ*file  [β]          [β]   r=rank      */
newV2.=;              do r=1  for N;  do f=1  for N;   newV2.r.f=.;    end /*ͺ*f*/;        end /*ͺ*r*/
/*ͺ*[β]  create an empty  NxN chessboard.*/
cent=space( translate( cent, , ',') )            /*ͺ*allow use of comma (,) for separater.*/
cents=0                                          /*ͺ*number of pennies on the chessboard. */
do  while  cent\=''                       /*ͺ* [β]  possibly place the pennies.    */
parse var  cent   cr  cf  x  '/'  cent    /*ͺ*extract where to place the pennies.  */
if x=''   then x=1                        /*ͺ*if number not specified, use 1 penny.*/
if cr=''  then iterate                    /*ͺ*support the  "blanking"  option.     */
do cf=cf  for x   /*ͺ*now, place  X  pennies on chessboard.*/
newV2.cr.cf= 'Β’'      /*ͺ*mark chessboard position with a penny*/
end   /*ͺ*cf*/      /*ͺ* [β]  places X pennies on chessboard.*/
end   /*ͺ*while*/                           /*ͺ* [β]  allows of the placing of  X  Β’s*/
/*ͺ* [β]  traipse through the chessboard.*/
do r=1  for N;  do f=1  for N;  cents=cents + (newV2.r.f=='Β’');   end /*ͺ*f*/;     end /*ͺ*r*/
/*ͺ* [β]  count the number of pennies.   */
if cents\==0  then say cents   'pennies placed on chessboard.'
target=NN - cents                                /*ͺ*use this as the number of moves left.*/
Kr = '2 1 -1 -2 -2 -1  1  2'  /*ͺ*the legal "rank"  moves for a knight.*/
Kf = '1 2  2  1 -1 -2 -2 -1'  /*ͺ* "    "   "file"    "    "  "    "   */
kr.M=words(Kr)                                   /*ͺ*number of possible moves for a Knight*/
parse var Kr  Kr.1 Kr.2 Kr.3 Kr.4 Kr.5 Kr.6 Kr.7 Kr.8   /*ͺ*parse the legal moves by hand.*/
parse var Kf  Kf.1 Kf.2 Kf.3 Kf.4 Kf.5 Kf.6 Kf.7 Kf.8   /*ͺ*  "    "    "     "    "   "  */
beg= '-1-'                                       /*ͺ* [β]   create the  NxN  chessboard.  */
if newV2.sRank.sFile ==.    then newV2.sRank.sFile=beg   /*ͺ*the knight's starting position.      */
if newV2.sRank.sFile\==beg  then do    sRank=1  for N   /*ͺ*find starting rank for the knight.*/
do sFile=1  for N   /*ͺ*  "     "     file  "   "     "   */
if newV2.sRank.sFile\==.  then iterate
newV2.sRank.sFile=beg   /*ͺ*the knight's starting position.   */
leave sRank         /*ͺ*we have a spot, so leave all this.*/
end   /*ͺ*sFile*/
end      /*ͺ*sRank*/
newV1= "holy knight's tour"                       /*ͺ*a handyβdandy literal for the  SAYs. */
if \move(2,sRank,sFile)  &  \(N==1)  then say 'No'    newV1    "solution for"        NxN'.'
else say 'A solution for the'   newV1   "on"    NxN':'

/*ͺ*show chessboard with moves and coins.*/
newV3=left('', 9 * (n<18) );           say           /*ͺ*used for indentation of chessboard.  */
newV4=substr( copies("βΌβββ", N), 2);   say  newV3 translate('β'newV4"β", 'β¬', "βΌ")
do   r=N  for N  by -1;       if r\==N      then say newV3 'β'newV4"β€";     L=newV2.
do f=1  for N; newV5=newV2.r.f;     if newV5==target  then newV5='end';           L=L'β'center(newV5,3)
end      /*ͺ*f*/
if blank then L=translate(L,,'Β’')           /*ͺ*blank out the pennies on chessboard ?*/
say newV3  translate(L'β', , .)                 /*ͺ*display  a  rank of the  chessboard. */
end        /*ͺ*r*/                            /*ͺ*19x19 chessboard can be shown 80 cols*/
say  newV3  translate('β'newV4"β", 'β΄', "βΌ")             /*ͺ*display the last rank of chessboard. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
move: procedure expose newV2. Kr. Kf. target; parse arg newV6,rank,file /*ͺ*obtain move,rank,file.*/
do t=1  for Kr.M;   nr=rank+Kr.t;         nf=file+Kf.t  /*ͺ*position of the knight*/
if newV2.nr.nf==.  then do;                   newV2.nr.nf=newV6     /*ͺ*Empty? Knight can move*/
if newV6==target       then return 1 /*ͺ*is this the last move?*/
if move(newV6+1,nr,nf) then return 1 /*ͺ* "   "   "    "    "  */
newV2.nr.nf=.                        /*ͺ*undo the above move.  */
end                                 /*ͺ*try a different move. */
end   /*ͺ*t*/                                             /*ͺ* [β]  all moves tried.*/
return 0                                                   /*ͺ*tour isn't possible.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Holy-Knights-tour\solve-a-holy-knights-tour.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
