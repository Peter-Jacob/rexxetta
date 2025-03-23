/*�*REXX program  calculates and displays the   fusc   (or  Stern's Diatomic)   sequence. */
parse arg st newV2 xw .                              /*�*obtain optional arguments from the CL*/
if st=='' | st==","  then st=  0                 /*�*Not specified?  Then use the default.*/
if  newV2=='' |  newV2==","  then  newV2= 61                 /*�* "      "         "   "   "     "    */
if xw=='' | xw==","  then xw=  0                 /*�* "      "         "   "   "     "    */
list= xw<1                                       /*�*boolean value:  LIST  to show numbers*/
newV1.=;        newV1.0= 0;       newV1.1= 1                 /*�*assign array default; assign low vals*/
mL= 0                                            /*�*the maximum length (digits)  so far. */
newV3=                                               /*�* "  list of  fusc  numbers    "  "   */
do j=0  for newV2                                 /*�*process a bunch of integers from zero*/
if j>1  then if j//2  then do;  newV4= (j-1) % 2;   p= (j+1) % 2;   newV1.j= newV1.newV4 + newV1.p;   end
else do;  newV4= j % 2;                       newV1.j= newV1.newV4;         end
if list  then if j>=st  then newV3= newV3 commas(newV1.j)                      /*�*add it to a list*/
else nop                                   /*�*NOP≡placeholder.*/
else do;   if length(newV1.j)<=mL  then iterate               /*�*still too small.*/
mL= length(newV1.j)                                /*�*found increase. */
if mL==1  then say '═══index═══   ═══fusc number═══'
say right( commas(j), 9)     right( commas(newV1.j), 14)
if mL==xw  then leave     /*�*Found max length?  Then stop looking.*/
end                             /*�* [↑]  display fusc #s of maximum len.*/
end   /*�*j*/
/*�*$   has a superfluous leading blank. */
if newV3\==''  then say strip(newV3)                     /*�*display a horizontal list of fusc #s.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:  parse arg newV5;  do newV4=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, newV4); end;   return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fusc-sequence\fusc-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
