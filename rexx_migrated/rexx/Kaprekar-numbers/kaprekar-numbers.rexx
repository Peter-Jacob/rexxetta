/*ͺ*REXX pgm generates & counts (& maybe shows) some Kaprekar #s using the castβoutβ9 test*/
parse arg A B .                                  /*ͺ*obtain optional arguments from the CL*/
if A=='' | A=","  then A=    10000               /*ͺ*Not specified?  Then use the default.*/
if B=='' | B=","  then B= -1000000               /*ͺ* "      "         "   "   "     "    */
call Kaprekar          A                         /*ͺ*gen Kaprekar numbers and display 'em.*/
call Kaprekar          B                         /*ͺ* "     "        "   don't    "     " */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Kaprekar: procedure; parse arg N;  aN= abs(N)    /*ͺ*obtain the limit;   use  βNβ  value. */
numeric digits max(9, 2 * length(aN) ) /*ͺ*use enough decimal digits for square.*/
d= digits();         tell= N>0         /*ͺ*set D to number of digits;  set TELL.*/
newV2= 0;       if aN>0  then do;    newV2= 1;    if tell  then say right(1, d);    end
/*ͺ* [β]  handle case of  N  being unity.*/
if aN>1  then do j=9  for aN-9;        /*ͺ*calculate the  square  of  J   (S).  */
jc= j//9                 /*ͺ*JC:   J modulo 9   (cast out nines). */
if jc >2  then iterate   /*ͺ*Is  J mod 9 > two?  Then skip this J.*/
s= j*j                   /*ͺ*calculate the  square  of  J   (S).  */
if jc==s//9  then do k=1  for length(s)%2   /*ͺ*β‘ casted out 9's? */
parse var    s      L   newV1   R
if j\==L+R  then iterate
newV2= newV2 + 1;   if tell  then say right(j, d); leave
end   /*ͺ*k*/
end   /*ͺ*j*/
say
say center(" There're "     newV2     ' Kaprekar numbers below '     aN" ", 79, "β")
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Kaprekar-numbers\kaprekar-numbers.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
