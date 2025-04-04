/*ª*REXX program counts the number of  Pythagorean triples  that exist given a maximum    */
/*ª*ââââââââââââââââââââ perimeter of  N, and also counts how many of them are primitives.*/
parse arg N .                                    /*ª*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 100                   /*ª*Not specified?  Then use the default.*/
do j=1  for N;   newV1.j= j*j;   end   /*ª*pre-compute some squares.            */
N66= N * 2%3                                     /*ª*calculate  2/3  of  N     (for a+b). */
T= 0;   P= 0                                     /*ª*set the number of Triples, Primitives*/
do a=3  to N%3                     /*ª*limit  side  to 1/3 of the perimeter.*/
do b= a+1                       /*ª*the triangle can't be  isosceles.    */
ab= a + b                       /*ª*compute a partial perimeter (2 sides)*/
if ab>=N66       then iterate a /*ª*is a+bâ¥66% perimeter? Try different A*/
aabb= newV1.a + newV1.b                 /*ª*compute the sum of  aÂ²+bÂ²  (shortcut)*/
do c=b+1                     /*ª*compute the value of the third side. */
if ab+c > N   then iterate a /*ª*is a+b+c>perimeter ? Try different A.*/
if newV1.c >aabb  then iterate b /*ª*is     cÂ²  > aÂ²+bÂ² ? Try      "    B.*/
if newV1.c\==aabb then iterate   /*ª*is     cÂ² Â¬= aÂ²+bÂ² ? Try      "    C.*/
T= T + 1                     /*ª*eureka. We found a Pythagorean triple*/
P= P + (gcd(a, b)==1)        /*ª*is this  triple  a primitive triple? */
end   /*ª*c*/
end      /*ª*b*/
end         /*ª*a*/
newV2= left('', 7)                                   /*ª*for padding the output with 7 blanks.*/
say 'max perimeter ='    N   newV2    "Pythagorean triples ="    T    newV2    'primitives ='    P
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
gcd: procedure; parse arg x,y;  do until y==0; parse value x//y y with y x; end;  return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-triples\pythagorean-triples-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
