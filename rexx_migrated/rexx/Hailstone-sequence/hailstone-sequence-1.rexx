/*�*REXX program tests a  number  and also a  range for  hailstone  (Collatz)  sequences. */
numeric digits 20                                /*�*be able to handle gihugeic numbers.  */
parse arg x y .                                  /*�*get optional arguments from the C.L. */
if x=='' | x==","   then x=     27               /*�*No  1st  argument?  Then use default.*/
if y=='' | y==","   then y= 100000 - 1           /*�* "  2nd      "        "   "     "    */
newV2= hailstone(x)     /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒task 1▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
say  x   ' has a hailstone sequence of '      words(newV2)
say      '    and starts with: '              subword(newV2, 1, 4)    " ∙∙∙"
say      '    and  ends  with:  ∙∙∙'          subword(newV2, max(5, words(newV2)-3))
if y==0  then exit  /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒task 2▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
say
w= 0;         do j=1  for y;  call hailstone j   /*�*traipse through the range of numbers.*/
if newV1<=w  then iterate            /*�*Not big 'nuff?   Then keep traipsing.*/
bigJ= j;   w= newV1                  /*�*remember what # has biggest hailstone*/
end   /*�*j*/
say '(between 1 ──►'   y") "       bigJ      ' has the longest hailstone sequence: '   w
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hailstone: procedure expose newV1; parse arg n 1 s /*�*N and S: are set to the 1st argument.*/
do newV1=1   while  n\==1     /*�*keep loop while   N   isn't  unity.  */
if n//2  then n= n * 3  + 1 /*�*N is odd ?   Then calculate  3*n + 1 */
else n= n % 2      /*�*"  " even?   Then calculate  fast ÷  */
s= s n                      /*�* [↑]  %   is REXX integer division.  */
end   /*�*#hs*/               /*�* [↑]  append  N  to the sequence list*/
return s                              /*�*return the  S  string to the invoker.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hailstone-sequence\hailstone-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
