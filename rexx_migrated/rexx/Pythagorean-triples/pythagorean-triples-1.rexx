/*�*REXX program counts the number of  Pythagorean triples  that exist given a maximum    */
/*�*──────────────────── perimeter of  N, and also counts how many of them are primitives.*/
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 100                   /*�*Not specified?  Then use the default.*/
do j=1  for N;   newV1.j= j*j;   end   /*�*pre-compute some squares.            */
N66= N * 2%3                                     /*�*calculate  2/3  of  N     (for a+b). */
T= 0;   P= 0                                     /*�*set the number of Triples, Primitives*/
do a=3  to N%3                     /*�*limit  side  to 1/3 of the perimeter.*/
do b= a+1                       /*�*the triangle can't be  isosceles.    */
ab= a + b                       /*�*compute a partial perimeter (2 sides)*/
if ab>=N66       then iterate a /*�*is a+b≥66% perimeter? Try different A*/
aabb= newV1.a + newV1.b                 /*�*compute the sum of  a²+b²  (shortcut)*/
do c=b+1                     /*�*compute the value of the third side. */
if ab+c > N   then iterate a /*�*is a+b+c>perimeter ? Try different A.*/
if newV1.c >aabb  then iterate b /*�*is     c²  > a²+b² ? Try      "    B.*/
if newV1.c\==aabb then iterate   /*�*is     c² ¬= a²+b² ? Try      "    C.*/
T= T + 1                     /*�*eureka. We found a Pythagorean triple*/
P= P + (gcd(a, b)==1)        /*�*is this  triple  a primitive triple? */
end   /*�*c*/
end      /*�*b*/
end         /*�*a*/
newV2= left('', 7)                                   /*�*for padding the output with 7 blanks.*/
say 'max perimeter ='    N   newV2    "Pythagorean triples ="    T    newV2    'primitives ='    P
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gcd: procedure; parse arg x,y;  do until y==0; parse value x//y y with y x; end;  return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-triples\pythagorean-triples-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
