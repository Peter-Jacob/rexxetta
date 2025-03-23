/*ช*REXX program computes and displays a series of gapful numbers starting at some number.*/
numeric digits 20                                /*ช*ensure enough decimal digits gapfuls.*/
parse arg gapfuls                                /*ช*obtain optional arguments from the CL*/
if gapfuls=''  then gapfuls= 30 25@7123 15@1000000 10@1000000000      /*ช*assume defaults.*/

do until gapfuls='';      parse var gapfuls stuff gapfuls;       call gapful stuff
end   /*ช*until*/
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
gapful: procedure; parse arg n "@" sp;  if sp==''  then sp= 100 /*ช*get args; use default.*/
say center(' 'n      " gapful numbers starting at: "     sp' ', 125, "โ")
newV1=;                   newV2= 0                              /*ช*initialize the $ list.*/
do j=sp  until newV2==n                              /*ช*SP:  starting point.  */
parse var   j   a  2  ''  -1  b                  /*ช*get 1st and last digit*/
if j // (a||b) \== 0  then iterate               /*ช*perform  รท  into  J.  */
newV2= newV2 + 1;             newV1= newV1 j                     /*ช*bump #;  append โโโบ $ */
end   /*ช*j*/
say strip(newV1);     say;     return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gapful-numbers\gapful-numbers.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
