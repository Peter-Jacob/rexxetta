/*ͺ*REXX pgm counts the number of twin prime pairs under a specified number N (or a list).*/
parse arg newV3 .                                    /*ͺ*get optional number of primes to find*/
if newV3='' | newV3=","  then newV3= 10 100 1000 10000 100000 1000000 10000000  /*ͺ*No $? Use default.*/
w= length( commas( word(newV3, words(newV3) ) ) )        /*ͺ*get length of the last number in list*/
newV1= ' twin prime pairs found under '         /*ͺ*literal used in the showing of output*/

do i=1  for words(newV3);       x= word(newV3, i) /*ͺ*process each Nβlimit in the  $  list.*/
say right( commas(genP(x)), 20)     newV1     right(commas(x), max(length(x), w) )
end   /*ͺ*i*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas:  parse arg newV4;  do newV5=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, newV5); end;   return newV4
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: parse arg y; newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11;  newV2.6=13; newV6= 6; tp= 2; sq.6= 169
if y>10  then tp= tp+1
do j=newV2.newV6+2  by 2  for max(0, y%2-newV2.newV6%2-1)      /*ͺ*find odd primes from here on. */
parse var  j   ''  -1  newV4                /*ͺ*obtain the last digit of the  J  var.*/
if    newV4==5  then iterate;  if j// 3==0  then iterate  /*ͺ*J Γ· by 5?   J Γ· by  3? */
if j//7==0  then iterate;  if j//11==0  then iterate  /*ͺ*" "  " 7?   " "  " 11? */
/*ͺ* [β]  divide by the primes.   ___    */
do k=6  to newV6  while  sq.k<=j      /*ͺ*divide  J  by other primes βξεχΦ³ β J     */
if j//newV2.k == 0  then iterate j    /*ͺ*Γ· by prev. prime?  Β¬prime     ___    */
end   /*ͺ*k*/                       /*ͺ* [β]   only divide up to     β J     */
prev= newV2.newV6;  newV6= newV6+1;  sq.newV6= j*j;  newV2.newV6= j /*ͺ*save prev. P; bump # primes; assign P*/
if j-2==prev   then tp= tp + 1          /*ͺ*This & previous prime twins? Bump TP.*/
end         /*ͺ*j*/;            return tp
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Twin-primes\twin-primes-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
