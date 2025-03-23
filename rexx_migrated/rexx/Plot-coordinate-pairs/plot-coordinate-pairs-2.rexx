/*�*REXX program plots X,Y   coördinate pairs  of  numbers  with plain (ASCII) characters.*/
x = 0      1       2       3       4       5        6        7        8        9
y = 2.7    2.8    31.4    38.1    58.0    76.2    100.5    130.0    149.3    180.0
newV1=
do j=1  for words(x)           /*�*build a list suitable for $PLOT subr.*/
newV1=newV1   word(x, j)','word(y, j)  /*�*add this X,Y coördinate to the $ list*/
end   /*�*j*/                    /*�*$≡ 0,2.7  1,2.8  2,31.4 3,38.1  ···  */
call '$PLOT'  newV1   '(LABELDatapoints'             /*�*invoke the REXX program:  $PLOT      */
exit rc                                          /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Plot-coordinate-pairs\plot-coordinate-pairs-2.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
