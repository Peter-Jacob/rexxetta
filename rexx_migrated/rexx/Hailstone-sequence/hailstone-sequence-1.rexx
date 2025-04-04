/*ͺ*REXX program tests a  number  and also a  range for  hailstone  (Collatz)  sequences. */
numeric digits 20                                /*ͺ*be able to handle gihugeic numbers.  */
parse arg x y .                                  /*ͺ*get optional arguments from the C.L. */
if x=='' | x==","   then x=     27               /*ͺ*No  1st  argument?  Then use default.*/
if y=='' | y==","   then y= 100000 - 1           /*ͺ* "  2nd      "        "   "     "    */
newV2= hailstone(x)     /*ͺ*βββββββββββββββββββββtask 1βββββββββββββββββββββββββββββββββββββββ*/
say  x   ' has a hailstone sequence of '      words(newV2)
say      '    and starts with: '              subword(newV2, 1, 4)    " βββ"
say      '    and  ends  with:  βββ'          subword(newV2, max(5, words(newV2)-3))
if y==0  then exit  /*ͺ*βββββββββββββββββββββtask 2βββββββββββββββββββββββββββββββββββββββ*/
say
w= 0;         do j=1  for y;  call hailstone j   /*ͺ*traipse through the range of numbers.*/
if newV1<=w  then iterate            /*ͺ*Not big 'nuff?   Then keep traipsing.*/
bigJ= j;   w= newV1                  /*ͺ*remember what # has biggest hailstone*/
end   /*ͺ*j*/
say '(between 1 βββΊ'   y") "       bigJ      ' has the longest hailstone sequence: '   w
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hailstone: procedure expose newV1; parse arg n 1 s /*ͺ*N and S: are set to the 1st argument.*/
do newV1=1   while  n\==1     /*ͺ*keep loop while   N   isn't  unity.  */
if n//2  then n= n * 3  + 1 /*ͺ*N is odd ?   Then calculate  3*n + 1 */
else n= n % 2      /*ͺ*"  " even?   Then calculate  fast Γ·  */
s= s n                      /*ͺ* [β]  %   is REXX integer division.  */
end   /*ͺ*#hs*/               /*ͺ* [β]  append  N  to the sequence list*/
return s                              /*ͺ*return the  S  string to the invoker.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hailstone-sequence\hailstone-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
