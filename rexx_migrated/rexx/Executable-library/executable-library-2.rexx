/*ͺ*REXX pgm tests a number and a range for hailstone (Collatz) sequences.*/
parse arg x .;  if x=='' then x=27     /*ͺ*get the optional first argument*/

newV1=hailstone(x)                         /*ͺ*βββββββββββββtask 2ββββββββββββ*/
newV2=words(newV1)                             /*ͺ*number of numbers in sequence. */
say x 'has a hailstone sequence of'  newV2  'and starts with: ' subword(newV1,1,4),
' and ends with:'    subword(newV1,newV2-3)
say
w=0;       do j=1  for 99999           /*ͺ*βββββββββββββtask 3ββββββββββββ*/
newV1=hailstone(j);  newV2=words(newV1) /*ͺ*obtain the hailstone sequence. */
if newV2<=w  then iterate       /*ͺ*Not big 'nuff? Then keep going.*/
bigJ=j;    w=newV2              /*ͺ*remember what # has biggest HS.*/
end   /*ͺ*j*/

say '(between 1βββΊ99,999) '  bigJ  'has the longest hailstone sequence:' w
/*ͺ*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Executable-library\executable-library-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
