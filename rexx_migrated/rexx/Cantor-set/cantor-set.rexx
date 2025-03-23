/*�*REXX program displays an ASCII diagram of a Canter Set as a set of (character) lines. */
w= linesize()                                    /*�*obtain the width of the display term.*/
if w==0  then w= 81                              /*�*Can't obtain width?  Use the default.*/
do lines=0;   newV1 = 3 ** lines  /*�*calculate powers of three  (# lines).*/
if newV1>w  then leave            /*�*Too large?  We passed the max value. */
newV2=newV1                           /*�*this value of a width─of─line is OK. */
end   /*�*lines*/               /*�* [↑]  calculate a useable line width.*/
w= newV2                                             /*�*use the (last) useable line width.   */
newV3= copies('■', newV2)                                /*�*populate the display line with blocks*/
do j=0  until newV2==0            /*�*show Cantor set as a line of chars.  */
if j>0  then do k=newV2+1  by  newV2+newV2  to w         /*�*skip 1st line blanking*/
newV3= overlay( left('', newV2), newV3, k)  /*�*blank parts of a line.*/
end   /*�*j*/
say newV3                         /*�*display a line of the Cantor Set.    */
newV2= newV2 % 3                      /*�*the part (thirds) to be blanked out. */
end   /*�*j*/                   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cantor-set\cantor-set.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
