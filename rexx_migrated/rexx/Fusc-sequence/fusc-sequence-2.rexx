/*�*REXX program  calculates and displays the   fusc   (or  Stern's Diatomic)   sequence. */
parse arg st newV3 xw .                              /*�*obtain optional arguments from the CL*/
if st=='' | st==","  then st=   0                /*�*Not specified?  Then use the default.*/
if  newV3=='' |  newV3==","  then  newV3= 256                /*�* "      "         "   "   "     "    */
if xw=='' | xw==","  then xw=   0                /*�* "      "         "   "   "     "    */
list= xw<1                                       /*�*boolean value:  LIST  to show numbers*/
newV1.=;        newV1.0= 0;       newV1.1= 1                 /*�*assign array default; assign low vals*/
mL= 0                                            /*�*the maximum length (digits)  so far. */
newV4=                                               /*�* "  list of  fusc  numbers    "  "   */
do j=0  for newV3                                 /*�*process a bunch of integers from zero*/
if j>1  then if j//2  then do;  newV5= (j-1) % 2;   p= (j+1) % 2;   newV1.j= newV1.newV5 + newV1.p;   end
else do;  newV5= j % 2;                       newV1.j= newV1.newV5;         end
if list  then if j>=st  then newV4= newV4 commas(newV1.j)                      /*�*add it to a list*/
else nop                                   /*�*NOP≡placeholder.*/
else do;   if length(newV1.j)<=mL  then iterate               /*�*still too small.*/
mL= length(newV1.j)                                /*�*found increase. */
if mL==1  then say '═══index═══   ═══fusc number═══'
say right( commas(j), 9)     right( commas(newV1.j), 14)
if mL==xw  then leave     /*�*Found max length?  Then stop looking.*/
end                             /*�* [↑]  display fusc #s of maximum len.*/
end   /*�*j*/
/*�*$   has a superfluous leading blank. */
if newV4==''  then exit 0                            /*�*display a horizontal list of fusc #s.*/
row= -1                                          /*�*output will be starting ar row  zero.*/
newV2= 0                                            /*�*initialize with the zeroth entry (=0)*/
do k=2  for newV3;       y= word(newV4, k)        /*�*start processing with the 2nd number.*/
if y==1  then do;  row= row + 1           /*�*Is it unity?    Then bump row number.*/
say 'row('row")="  newV2  /*�*display the row that was just created*/
newV2= 1                  /*�*initialize a new row with 1  (unity).*/
end
else newV2= newV2  y                   /*�*Not unity?   Just append it to a row.*/
end   /*�*k*/

if newV2\==''  then say "row("row+1')='  newV2         /*�*display any residual data in the row.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV6;  do newV5=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, newV5); end;   return newV6
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fusc-sequence\fusc-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
