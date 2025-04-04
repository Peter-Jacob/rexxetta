/*ͺ*REXX program  calculates and displays the   fusc   (or  Stern's Diatomic)   sequence. */
parse arg st newV3 xw .                              /*ͺ*obtain optional arguments from the CL*/
if st=='' | st==","  then st=   0                /*ͺ*Not specified?  Then use the default.*/
if  newV3=='' |  newV3==","  then  newV3= 256                /*ͺ* "      "         "   "   "     "    */
if xw=='' | xw==","  then xw=   0                /*ͺ* "      "         "   "   "     "    */
list= xw<1                                       /*ͺ*boolean value:  LIST  to show numbers*/
newV1.=;        newV1.0= 0;       newV1.1= 1                 /*ͺ*assign array default; assign low vals*/
mL= 0                                            /*ͺ*the maximum length (digits)  so far. */
newV4=                                               /*ͺ* "  list of  fusc  numbers    "  "   */
do j=0  for newV3                                 /*ͺ*process a bunch of integers from zero*/
if j>1  then if j//2  then do;  newV5= (j-1) % 2;   p= (j+1) % 2;   newV1.j= newV1.newV5 + newV1.p;   end
else do;  newV5= j % 2;                       newV1.j= newV1.newV5;         end
if list  then if j>=st  then newV4= newV4 commas(newV1.j)                      /*ͺ*add it to a list*/
else nop                                   /*ͺ*NOPβ‘placeholder.*/
else do;   if length(newV1.j)<=mL  then iterate               /*ͺ*still too small.*/
mL= length(newV1.j)                                /*ͺ*found increase. */
if mL==1  then say 'βββindexβββ   βββfusc numberβββ'
say right( commas(j), 9)     right( commas(newV1.j), 14)
if mL==xw  then leave     /*ͺ*Found max length?  Then stop looking.*/
end                             /*ͺ* [β]  display fusc #s of maximum len.*/
end   /*ͺ*j*/
/*ͺ*$   has a superfluous leading blank. */
if newV4==''  then exit 0                            /*ͺ*display a horizontal list of fusc #s.*/
row= -1                                          /*ͺ*output will be starting ar row  zero.*/
newV2= 0                                            /*ͺ*initialize with the zeroth entry (=0)*/
do k=2  for newV3;       y= word(newV4, k)        /*ͺ*start processing with the 2nd number.*/
if y==1  then do;  row= row + 1           /*ͺ*Is it unity?    Then bump row number.*/
say 'row('row")="  newV2  /*ͺ*display the row that was just created*/
newV2= 1                  /*ͺ*initialize a new row with 1  (unity).*/
end
else newV2= newV2  y                   /*ͺ*Not unity?   Just append it to a row.*/
end   /*ͺ*k*/

if newV2\==''  then say "row("row+1')='  newV2         /*ͺ*display any residual data in the row.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV6;  do newV5=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, newV5); end;   return newV6
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fusc-sequence\fusc-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
