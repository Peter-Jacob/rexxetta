/*�*REXX program tests a  number  and also a  range for  hailstone  (Collatz)  sequences. */
newV2.=0;     newV2.0=1;  newV2.2=1;  newV2.4=1;  newV2.6=1;  newV2.8=1  /*�*assign even numerals to be  "true".  */
numeric digits 20;  newV3.= 0                        /*�*handle big numbers; initialize array.*/
parse arg x y z .;  newV2.h= y                       /*�*get optional arguments from the C.L. */
if x=='' | x==","   then x=     27               /*�*No  1st  argument?  Then use default.*/
if y=='' | y==","   then y= 100000 - 1           /*�* "  2nd      "        "   "     "    */
if z=='' | z==","   then z=     12               /*�*head/tail number?     "   "     "    */
hm= max(y, 500000)                               /*�*use memoization (maximum num for  @.)*/
newV4= hailstone(x)     /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒task 1▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
say  x   ' has a hailstone sequence of '       words(newV4)
say      '    and starts with: '               subword(newV4, 1, z)    " ∙∙∙"
say      '    and  ends  with:  ∙∙∙'           subword(newV4, max(z+1, words(newV4)-z+1))
if y==0  then exit  /*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒task 2▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒*/
say
w= 0;        do j=1  for y;  newV4= hailstone(j)     /*�*traipse through the range of numbers.*/
newV1= words(newV4)                       /*�*find the length of the hailstone seq.*/
if newV1<=w  then iterate             /*�*Not big enough?  Then keep traipsing.*/
bigJ= j;   w= newV1                   /*�*remember what # has biggest hailstone*/
end   /*�*j*/
say '(between 1 ──►'   y") "      bigJ     ' has the longest hailstone sequence: '   w
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hailstone: procedure expose newV3. newV2. hm;  parse arg n 1 s 1 o,newV3.1  /*�*N,S,O: are the 1st arg*/
do  while newV3.n==0             /*�*loop while the residual is unknown.  */
parse var  n  ''  -1  L      /*�*extract the last decimal digit of  N.*/
if newV2.L  then n= n % 2        /*�*N is even?   Then calculate  fast ÷  */
else n= n * 3  +  1  /*�*"  " odd ?     "      "      3*n + 1 */
s= s n                       /*�* [↑]  %: is the REXX integer division*/
end   /*�*while*/              /*�* [↑]  append  N  to the sequence list*/
s= s newV3.n                              /*�*append the number to a sequence list.*/
newV3.o= subword(s, 2);   parse var s newV5 r /*�*use memoization for this hailstone #.*/
do  while r\=='';  parse var r newV5 r /*�*obtain the next  hailstone sequence. */
if newV3.newV5\==0  then leave             /*�*Was number already found?  Return  S.*/
if newV5>hm     then iterate           /*�*Is  number  out of range?  Ignore it.*/
newV3.newV5= r                             /*�*assign subsequence number to array.  */
end   /*�*while*/;         return s
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hailstone-sequence\hailstone-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
