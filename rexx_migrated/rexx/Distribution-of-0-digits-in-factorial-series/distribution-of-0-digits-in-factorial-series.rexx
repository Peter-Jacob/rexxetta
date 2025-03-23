/*�*REXX program computes the mean of the proportion of "0" digits a series of factorials.*/
parse arg newV1                                      /*�*obtain optional arguments from the CL*/
if newV1='' | newV1=","  then newV1= 100 1000 10000          /*�*not specified?  Then use the default.*/
newV2= words(newV1)                                      /*�*the number of ranges to be used here.*/
numeric digits 100                               /*�*increase dec. digs, but only to 100. */
big= word(newV1, newV2);  newV3= 1                           /*�*obtain the largest number in ranges. */
do i=1  for big  /*�*calculate biggest  !  using 100 digs.*/
newV3= newV3 * i         /*�*calculate the factorial of  BIG.     */
end   /*�*i*/
if pos('E', newV3)>0  then do                        /*�*In exponential format?  Then get EXP.*/
parse var newV3  'E'  x       /*�*parse the exponent from the number.  */
numeric digits    x+1     /*�*set the decimal digits to  X  plus 1.*/
end                       /*�* [↑]  the  +1  is for the dec. point.*/

title= ' mean proportion of zeros in the (decimal) factorial products for  N'
say '     N     │'center(title, 80)              /*�*display the title for the output.    */
say '───────────┼'center(""   , 80, '─')         /*�*   "     a   sep   "   "     "       */

do j=1  for newV2;  n= word(newV1, j)                  /*�*calculate some factorial ranges.     */
say center( commas(n), 11)'│' left(0dist(n), 75)...    /*�*show results for above range.*/
end   /*�*j*/

say '───────────┴'center(""   , 80, '─')         /*�*display a foot sep for the output.   */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
0dist:  procedure; parse arg z;        newV3= 1;         y= 0
do k=1  for z;    newV3= newV3 * k;     y= y   +   countstr(0, newV3) / length(newV3)
end   /*�*k*/
return y/z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Distribution-of-0-digits-in-factorial-series\distribution-of-0-digits-in-factorial-series.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
