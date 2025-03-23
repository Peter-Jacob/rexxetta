/*ª*REXX pgm draws a "3D" image of text representation;  any character except  /  and  \  */
newV3=7;                       newV1.1 =  '@@@@                        '
newV1.2 =  '@   @                       '
newV1.3 =  '@   @   @@@@  @   @  @   @  '
newV1.4 =  '@@@@    @      @ @    @ @   '
newV1.5 =  '@  @    @@@     @      @    '
newV1.6 =  '@   @   @      @ @    @ @   '
newV1.7 =  '@    @  @@@@  @   @  @   @  '
do j=1  for newV3;  x=left(strip(newV1.j),1)           /*ª* [â†“]  display the (above) text lines.*/
newV2.1 = changestr( " " ,   newV1.j,   '   '   )       ;      newV2.2 = newV2.1
newV2.1 = changestr(  x  ,   newV2.1,   '///'   )" "
newV2.2 = changestr(  x  ,   newV2.2,   '\\\'   )" "
newV2.1 = changestr( "/ ",   newV2.1,   '/\'    )
newV2.2 = changestr( "\ ",   newV2.2,   '\/'    )
do k=1  for 2;  say strip(left('',newV3-j)newV2.k,"T")   /*ª*the LEFT BIF does indentation.*/
end  /*ª*k*/                                /*ª* [â†‘]  display a line  and its shadow.*/
end       /*ª*j*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Write-language-name-in-3D-ASCII\write-language-name-in-3d-ascii-3.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
