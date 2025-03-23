/*ª*REXX program constructs & displays Floyd's triangle for any number of rows in base 16.*/
parse arg N .;  if N=='' | N==","  then N=6      /*ª*Not specified?  Then use the default.*/
mx=N * (N+1) % 2  -  N                           /*ª*calculate maximum value of any value.*/
say 'displaying a '    N    " row Floyd's triangle in base 16:"  /*ª*show triangle header.*/
say
newV1=1;  do     r=1  for N;     i=0;         newV2=     /*ª*construct Floyd's triangle row by row*/
do newV1=newV1  for r;     i=i+1               /*ª*start to construct a row of triangle.*/
newV2=newV2 right( d2x(newV1), length( d2x(mx+i))) /*ª*build a row of the Floyd's triangle. */
end   /*ª*#*/
say substr(newV2, 2)                           /*ª*remove 1st leading blank in the line.*/
end       /*ª*r*/                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Floyds-triangle\floyds-triangle-3.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
