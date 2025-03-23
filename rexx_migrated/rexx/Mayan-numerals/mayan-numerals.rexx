/*�*REXX program converts decimal numbers to the Mayan numbering system (with cartouches).*/
parse arg newV1                                      /*�*obtain optional arguments from the CL*/
if newV1=''  then newV1= 4005  8017  326205  886205,     /*�*Not specified?  Then use the default.*/
172037122592320200101           /*�*Morse code for MAYAN; egg is a blank.*/

do j=1  for words(newV1)                           /*�*convert each of the numbers specified*/
newV2= word(newV1, j)                                  /*�*extract a number from (possible) list*/
say
say  center('converting the decimal number '     newV2     " to a Mayan number:", 90,  '─')
say
call newV1MAYAN   newV2   '(overlap)'                  /*�*invoke the  $MAYAN (REXX) subroutine.*/
say
end   /*�*j*/                                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mayan-numerals\mayan-numerals.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
