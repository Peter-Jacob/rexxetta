/*ª*REXX program counts the number of  Pythagorean triples  that exist given a maximum    */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ perimeter of  N, and also counts how many of them are primitives.*/
parse arg N .                                    /*ª*obtain optional argument from the CL.*/
if N=='' | N==","  then N= 100                   /*ª*Not specified?  Then use the default.*/
newV1.= 0;        do j=1  for N;   newV1.j= j*j;   end   /*ª*pre-compute some squares.            */
N66= N * 2%3                                     /*ª*calculate  2/3  of  N     (for a+b). */
P= 0; T= 0;   do a=3  to N%3                     /*ª*limit  side  to 1/3 of the perimeter.*/
aEven= a//2==0                     /*ª*set variable to  1   if  A  is even. */
do b=a+1  by 1+aEven;  ab= a + b /*ª*the triangle can't be isosceles.     */
if ab>=N66       then iterate a  /*ª*is a+bâ‰¥66% perimeter? Try different A*/
aabb= newV1.a + newV1.b                  /*ª*compute the sum of  aÂ²+bÂ²  (shortcut)*/
do c=b + 1                     /*ª*compute the value of the third side. */
if aEven       then if c//2==0  then iterate  /*ª*both A&C even? Skip it*/
if ab+c>n      then iterate a  /*ª*a+b+c > perimeter? Try different  A. */
if newV1.c > aabb  then iterate b  /*ª*is  cÂ² >  aÂ²+bÂ² ?   "      "      B. */
if newV1.c\==aabb  then iterate    /*ª*is  cÂ² Â¬= aÂ²+bÂ² ?   "      "      C. */
if newV1.a.b.c     then iterate    /*ª*Is this a duplicate?  Then try again.*/
T= T + 1                       /*ª*Eureka! We found a Pythagorean triple*/
P= P + 1                       /*ª*count this also as a primitive triple*/
do m=2  while a*m+b*m+c*m<=N /*ª*generate non-primitives Pythagoreans.*/
T= T + 1                     /*ª*Eureka! We found a Pythagorean triple*/
am= a*m;   bm= b*m;  cm= c*m /*ª*create some short-cut variable names.*/
newV1.am.bm.cm= 1                /*ª*mark Pythagorean triangle as a triple*/
end   /*ª*m*/
end     /*ª*c*/
end       /*ª*b*/
end         /*ª*a*/                  /*ª*stick a fork in it,  we're all done. */
newV2= left('', 7)                                   /*ª*for padding the output with 7 blanks.*/
say 'max perimeter ='    N   newV2    "Pythagorean triples ="    T    newV2    'primitives ='    P
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pythagorean-triples\pythagorean-triples-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
