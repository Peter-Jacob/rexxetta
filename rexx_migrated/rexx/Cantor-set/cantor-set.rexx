/*ª*REXX program displays an ASCII diagram of a Canter Set as a set of (character) lines. */
w= linesize()                                    /*ª*obtain the width of the display term.*/
if w==0  then w= 81                              /*ª*Can't obtain width?  Use the default.*/
do lines=0;   newV1 = 3 ** lines  /*ª*calculate powers of three  (# lines).*/
if newV1>w  then leave            /*ª*Too large?  We passed the max value. */
newV2=newV1                           /*ª*this value of a widthâ”€ofâ”€line is OK. */
end   /*ª*lines*/               /*ª* [â†‘]  calculate a useable line width.*/
w= newV2                                             /*ª*use the (last) useable line width.   */
newV3= copies('â– ', newV2)                                /*ª*populate the display line with blocks*/
do j=0  until newV2==0            /*ª*show Cantor set as a line of chars.  */
if j>0  then do k=newV2+1  by  newV2+newV2  to w         /*ª*skip 1st line blanking*/
newV3= overlay( left('', newV2), newV3, k)  /*ª*blank parts of a line.*/
end   /*ª*j*/
say newV3                         /*ª*display a line of the Cantor Set.    */
newV2= newV2 % 3                      /*ª*the part (thirds) to be blanked out. */
end   /*ª*j*/                   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cantor-set\cantor-set.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
