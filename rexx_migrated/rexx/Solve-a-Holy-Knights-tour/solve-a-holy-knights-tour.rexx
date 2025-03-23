/*ª*REXX program solves the  holy knight's tour  problem for a (general)  NxN  chessboard.*/
blank=pos('//', space(arg(1), 0))\==0            /*ª*see if the pennies are to be shown.  */
parse arg  ops   '/'   cent                      /*ª*obtain the options and the pennies.  */
parse var  ops  N  sRank  sFile .                /*ª*boardsize, starting position, pennys.*/
if     N=='' |     N==","  then     N=8          /*ª*no boardsize specified?  Use default.*/
if sRank=='' | sRank==","  then sRank=N          /*ª*starting rank given?      "      "   */
if sFile=='' | sFile==","  then sFile=1          /*ª*    "    file   "         "      "   */
NN=N**2;  NxN='a ' N"x"N ' chessboard'           /*ª*file  [â†“]          [â†“]   r=rank      */
newV2.=;              do r=1  for N;  do f=1  for N;   newV2.r.f=.;    end /*ª*f*/;        end /*ª*r*/
/*ª*[â†‘]  create an empty  NxN chessboard.*/
cent=space( translate( cent, , ',') )            /*ª*allow use of comma (,) for separater.*/
cents=0                                          /*ª*number of pennies on the chessboard. */
do  while  cent\=''                       /*ª* [â†“]  possibly place the pennies.    */
parse var  cent   cr  cf  x  '/'  cent    /*ª*extract where to place the pennies.  */
if x=''   then x=1                        /*ª*if number not specified, use 1 penny.*/
if cr=''  then iterate                    /*ª*support the  "blanking"  option.     */
do cf=cf  for x   /*ª*now, place  X  pennies on chessboard.*/
newV2.cr.cf= 'Â¢'      /*ª*mark chessboard position with a penny*/
end   /*ª*cf*/      /*ª* [â†‘]  places X pennies on chessboard.*/
end   /*ª*while*/                           /*ª* [â†‘]  allows of the placing of  X  Â¢s*/
/*ª* [â†“]  traipse through the chessboard.*/
do r=1  for N;  do f=1  for N;  cents=cents + (newV2.r.f=='Â¢');   end /*ª*f*/;     end /*ª*r*/
/*ª* [â†‘]  count the number of pennies.   */
if cents\==0  then say cents   'pennies placed on chessboard.'
target=NN - cents                                /*ª*use this as the number of moves left.*/
Kr = '2 1 -1 -2 -2 -1  1  2'  /*ª*the legal "rank"  moves for a knight.*/
Kf = '1 2  2  1 -1 -2 -2 -1'  /*ª* "    "   "file"    "    "  "    "   */
kr.M=words(Kr)                                   /*ª*number of possible moves for a Knight*/
parse var Kr  Kr.1 Kr.2 Kr.3 Kr.4 Kr.5 Kr.6 Kr.7 Kr.8   /*ª*parse the legal moves by hand.*/
parse var Kf  Kf.1 Kf.2 Kf.3 Kf.4 Kf.5 Kf.6 Kf.7 Kf.8   /*ª*  "    "    "     "    "   "  */
beg= '-1-'                                       /*ª* [â†‘]   create the  NxN  chessboard.  */
if newV2.sRank.sFile ==.    then newV2.sRank.sFile=beg   /*ª*the knight's starting position.      */
if newV2.sRank.sFile\==beg  then do    sRank=1  for N   /*ª*find starting rank for the knight.*/
do sFile=1  for N   /*ª*  "     "     file  "   "     "   */
if newV2.sRank.sFile\==.  then iterate
newV2.sRank.sFile=beg   /*ª*the knight's starting position.   */
leave sRank         /*ª*we have a spot, so leave all this.*/
end   /*ª*sFile*/
end      /*ª*sRank*/
newV1= "holy knight's tour"                       /*ª*a handyâ”€dandy literal for the  SAYs. */
if \move(2,sRank,sFile)  &  \(N==1)  then say 'No'    newV1    "solution for"        NxN'.'
else say 'A solution for the'   newV1   "on"    NxN':'

/*ª*show chessboard with moves and coins.*/
newV3=left('', 9 * (n<18) );           say           /*ª*used for indentation of chessboard.  */
newV4=substr( copies("â”¼â”€â”€â”€", N), 2);   say  newV3 translate('â”Œ'newV4"â”", 'â”¬', "â”¼")
do   r=N  for N  by -1;       if r\==N      then say newV3 'â”œ'newV4"â”¤";     L=newV2.
do f=1  for N; newV5=newV2.r.f;     if newV5==target  then newV5='end';           L=L'â”‚'center(newV5,3)
end      /*ª*f*/
if blank then L=translate(L,,'Â¢')           /*ª*blank out the pennies on chessboard ?*/
say newV3  translate(L'â”‚', , .)                 /*ª*display  a  rank of the  chessboard. */
end        /*ª*r*/                            /*ª*19x19 chessboard can be shown 80 cols*/
say  newV3  translate('â””'newV4"â”˜", 'â”´', "â”¼")             /*ª*display the last rank of chessboard. */
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€*/
move: procedure expose newV2. Kr. Kf. target; parse arg newV6,rank,file /*ª*obtain move,rank,file.*/
do t=1  for Kr.M;   nr=rank+Kr.t;         nf=file+Kf.t  /*ª*position of the knight*/
if newV2.nr.nf==.  then do;                   newV2.nr.nf=newV6     /*ª*Empty? Knight can move*/
if newV6==target       then return 1 /*ª*is this the last move?*/
if move(newV6+1,nr,nf) then return 1 /*ª* "   "   "    "    "  */
newV2.nr.nf=.                        /*ª*undo the above move.  */
end                                 /*ª*try a different move. */
end   /*ª*t*/                                             /*ª* [â†‘]  all moves tried.*/
return 0                                                   /*ª*tour isn't possible.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Solve-a-Holy-Knights-tour\solve-a-holy-knights-tour.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
