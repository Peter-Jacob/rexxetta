/*�*REXX pgm generates & counts (& maybe shows) some Kaprekar #s using the cast─out─9 test*/
parse arg A B .                                  /*�*obtain optional arguments from the CL*/
if A=='' | A=","  then A=    10000               /*�*Not specified?  Then use the default.*/
if B=='' | B=","  then B= -1000000               /*�* "      "         "   "   "     "    */
call Kaprekar          A                         /*�*gen Kaprekar numbers and display 'em.*/
call Kaprekar          B                         /*�* "     "        "   don't    "     " */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Kaprekar: procedure; parse arg N;  aN= abs(N)    /*�*obtain the limit;   use  │N│  value. */
numeric digits max(9, 2 * length(aN) ) /*�*use enough decimal digits for square.*/
d= digits();         tell= N>0         /*�*set D to number of digits;  set TELL.*/
newV2= 0;       if aN>0  then do;    newV2= 1;    if tell  then say right(1, d);    end
/*�* [↑]  handle case of  N  being unity.*/
if aN>1  then do j=9  for aN-9;        /*�*calculate the  square  of  J   (S).  */
jc= j//9                 /*�*JC:   J modulo 9   (cast out nines). */
if jc >2  then iterate   /*�*Is  J mod 9 > two?  Then skip this J.*/
s= j*j                   /*�*calculate the  square  of  J   (S).  */
if jc==s//9  then do k=1  for length(s)%2   /*�*≡ casted out 9's? */
parse var    s      L   newV1   R
if j\==L+R  then iterate
newV2= newV2 + 1;   if tell  then say right(j, d); leave
end   /*�*k*/
end   /*�*j*/
say
say center(" There're "     newV2     ' Kaprekar numbers below '     aN" ", 79, "═")
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Kaprekar-numbers\kaprekar-numbers.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
