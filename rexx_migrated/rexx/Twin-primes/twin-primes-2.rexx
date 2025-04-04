/*ͺ*REXX pgm counts the number of twin prime pairs under a specified number N (or a list).*/
parse arg newV3 .                                    /*ͺ*get optional number of primes to find*/
if newV3='' | newV3=","  then newV3= 100 1000 10000 100000 1000000 10000000    /*ͺ*No $?  Use default.*/
w= length( commas( word(newV3, words(newV3) ) ) )        /*ͺ*get length of the last number in list*/
newV1= ' twin prime pairs found under '         /*ͺ*literal used in the showing of output*/

do i=1  for words(newV3);       x= word(newV3, i) /*ͺ*process each Nβlimit in the  $  list.*/
say right( commas(genP(x)), 20)     newV1     right(commas(x), max(length(x), w) )
end   /*ͺ*i*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV4;  do newV5=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, newV5); end;   return newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: arg y; newV4= 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101
tp=8;          newV6= words(newV4); sq.103=103*103 /*ͺ*#: number of prims; TP: # twin pairs.*/
do aa=1  for newV6;  newV2.aa= word(newV4, aa)       /*ͺ*assign some low primes for quick Γ·'s.*/
end   /*ͺ*aa*/

do j=newV2.newV6+2  by 2  while j<y              /*ͺ*continue with the next prime past 101*/
parse var  j  ''  -1  newV4                  /*ͺ*obtain the last digit of the  J  var.*/
if newV4    ==5       then iterate           /*ͺ*is this integer a multiple of five?  */
if j//3 ==0       then iterate           /*ͺ* "   "     "    "     "     " three? */

do a=4  for 23                        /*ͺ*divide low primes starting with seven*/
if j//newV2.a ==0  then iterate j         /*ͺ*is integer a multiple of a low prime?*/
end           /*ͺ*a*/
/*ͺ* [β]  divide by the primes.   ___    */
do k=27  to newV6  while sq.k<= j /*ͺ*divide  J  by other primes βξεχΦ³ β J     */
if j//newV2.k ==0  then iterate j /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*k*/                   /*ͺ* [β]   only divide up to     β J     */
prev= newV2.newV6;  newV6= newV6+1;  sq.newV6= j*j;   newV2.newV6= j /*ͺ*save prev. P; bump # primes; assign P*/
if j-2==prev  then tp= tp + 1            /*ͺ*This & previous prime twins? Bump TP.*/
end              /*ͺ*j*/;        return tp
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Twin-primes\twin-primes-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
