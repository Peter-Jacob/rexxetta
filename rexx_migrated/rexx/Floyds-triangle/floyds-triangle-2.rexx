/*�*REXX program constructs & displays  Floyd's triangle for any number of specified rows.*/
parse arg N .;    if N=='' | N==","  then N= 5   /*�*Not specified?  Then use the default.*/
mx= N * (N+1) % 2  - N                           /*�*calculate the maximum of any value.  */
say 'displaying a '  N  " row Floyd's triangle:" /*�*show the header for Floyd's triangle.*/
say                                              /*�*display a blank line below the title.*/
newV1=1;    do    r=1  for N;           i= 0;     newV2= /*�*construct Floyd's triangle row by row*/
do newV1=newV1  for r;           i= i + 1     /*�*start to construct a row of triangle.*/
newV2= newV2 right(newV1, length( mx+i ) )        /*�*build a row of the Floyd's triangle. */
end   /*�*#*/                           /*�*calculate the max length on the fly. */
say substr(newV2, 2)                         /*�*remove 1st leading blank in the line.*/
end      /*�*r*/                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyds-triangle\floyds-triangle-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
