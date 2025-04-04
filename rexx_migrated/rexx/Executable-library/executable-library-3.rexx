/*ͺ*REXX pgm finds the most common (popular) hailstone sequence length.   */
parse arg z .;  if z=='' then z=99999  /*ͺ*get the optional first argument*/
newV1.=0
w=0;          do j=1  for z            /*ͺ*βββββββββββββtask 4ββββββββββββ*/
newV2=words(hailstone(j))    /*ͺ*obtain hailstone sequence count*/
newV1.newV2 = newV1.newV2 + 1            /*ͺ*add unity to popularity count. */
end   /*ͺ*j*/
occ=0;  p=0
do k=1  for z
if newV1.k>occ  then do;  occ=newV1.k;  p=k;  end
end   /*ͺ*p*/

say '(between 1βββΊ'z") "  p,
' is the most common hailstone sequence length  (with' occ "occurrences)."
/*ͺ*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Executable-library\executable-library-3.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
