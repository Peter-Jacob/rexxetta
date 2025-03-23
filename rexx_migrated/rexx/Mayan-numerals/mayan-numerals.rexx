/*ª*REXX program converts decimal numbers to the Mayan numbering system (with cartouches).*/
parse arg newV1                                      /*ª*obtain optional arguments from the CL*/
if newV1=''  then newV1= 4005  8017  326205  886205,     /*ª*Not specified?  Then use the default.*/
172037122592320200101           /*ª*Morse code for MAYAN; egg is a blank.*/

do j=1  for words(newV1)                           /*ª*convert each of the numbers specified*/
newV2= word(newV1, j)                                  /*ª*extract a number from (possible) list*/
say
say  center('converting the decimal number '     newV2     " to a Mayan number:", 90,  'â”€')
say
call newV1MAYAN   newV2   '(overlap)'                  /*ª*invoke the  $MAYAN (REXX) subroutine.*/
say
end   /*ª*j*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mayan-numerals\mayan-numerals.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
